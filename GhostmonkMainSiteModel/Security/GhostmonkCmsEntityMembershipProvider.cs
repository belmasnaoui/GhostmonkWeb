using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Configuration.Provider;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web.Configuration;
using System.Web.Hosting;
using System.Web.Security;

namespace GhostmonkMainSiteModel.Security
{
    public sealed class GhostmonkCmsEntityMembershipProvider : MembershipProvider
    {
        private const int NEW_PASSWORD_LENGTH = 8;
        private const string EVENT_SOURCE = "OdbcMembershipProvider";
        private const string EVENT_LOG = "Application";
        private const string EXCEPTION_MESSAGE = "An exception occurred. Please check the Event Log.";

        private static readonly Dictionary<string, MembershipPasswordFormat> passwordFormatLookup = new Dictionary<string, MembershipPasswordFormat>
        {
            {"Hashed", MembershipPasswordFormat.Hashed},
            {"Clear", MembershipPasswordFormat.Clear},
            {"Encrypted", MembershipPasswordFormat.Encrypted},
        };
        
        private string connectionString;
        private MachineKeySection machineKey;
        private MembershipPasswordFormat passwordFormat;
        private NameValueCollection config;

        public bool WriteExceptionsToEventLog { get; set; }

        public override string ApplicationName { get; set; }

        public override MembershipPasswordFormat PasswordFormat { get { return passwordFormat; } }

        public override bool EnablePasswordReset { get { return GetBool( "enablePasswordReset", true ); } }

        public override bool EnablePasswordRetrieval { get { return GetBool( "enablePasswordRetrieval", true ); } }

        public override bool RequiresQuestionAndAnswer { get { return GetBool( "requiresQuestionAndAnswer", false ); } }

        public override bool RequiresUniqueEmail { get { return GetBool( "requiresUniqueEmail", true ); } }

        public override int MaxInvalidPasswordAttempts { get { return GetInt( "maxInvalidPasswordAttempts", 5 ); } }

        public override int PasswordAttemptWindow { get { return GetInt( "passwordAttemptWindow", 10 ); } }

        public override int MinRequiredNonAlphanumericCharacters { get { return GetInt( "minRequiredNonAlphanumericCharacters", 1 ); } }

        public override int MinRequiredPasswordLength { get { return GetInt( "minRequiredPasswordLength", 7 ); } }

        public override string PasswordStrengthRegularExpression { get { return GetString( "passwordStrengthRegularExpression", string.Empty ); } }

        public override void Initialize( string name, NameValueCollection config )
        {
            if( config == null )
                throw new ArgumentNullException( "config" );

            this.config = config;

            if( string.IsNullOrEmpty( name ) )
                name = "GhostmonkMembershipProvider";

            if( string.IsNullOrEmpty( config[ "description" ] ) )
            {
                config.Remove( "description" );
                config.Add( "description", "Ghostmonk Membership provider" );
            }

            base.Initialize( name, config );

            ApplicationName = GetString( "applicationName", HostingEnvironment.ApplicationVirtualPath );
            WriteExceptionsToEventLog = GetBool( "writeExceptionsToEventLog", true );

            string tempFormat = config[ "passwordFormat" ] ?? "Hashed";

            if( !passwordFormatLookup.TryGetValue( tempFormat, out passwordFormat ) )
                throw new ProviderException( "Password format not supported." );

            ConnectionStringSettings connectionStringSettings = ConfigurationManager.ConnectionStrings[ config[ "connectionStringName" ] ];

            if( connectionStringSettings == null || connectionStringSettings.ConnectionString.Trim() == "" )
                throw new ProviderException( "Connection string cannot be blank." );

            connectionString = connectionStringSettings.ConnectionString;

            Configuration cfg = WebConfigurationManager.OpenWebConfiguration( HostingEnvironment.ApplicationVirtualPath );
            machineKey = ( MachineKeySection )cfg.GetSection( "system.web/machineKey" );

            if( machineKey.ValidationKey.Contains( "AutoGenerate" ) && PasswordFormat != MembershipPasswordFormat.Clear )
                throw new ProviderException( "Hashed or Encrypted passwords are not supported with auto-generated keys." );
        }

        public override bool ChangePassword( string username, string oldPwd, string newPwd )
        {
            if( !ValidateUser( username, oldPwd ) ) return false;

            ValidatePasswordEventArgs args = new ValidatePasswordEventArgs( username, newPwd, true );
            OnValidatingPassword( args );

            if( args.Cancel )
                throw args.FailureInformation ?? new MembershipPasswordException( "Change password canceled due to new password validation failure." );

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                User user = GetUser( container, username, EncodePassword( oldPwd ) );
                
                if( user == null ) return false;

                user.LoginCredentials.Password = EncodePassword( newPwd );
                container.AcceptAllChanges();
                container.SaveChanges();
                return true;
            }
        }

        public override bool ChangePasswordQuestionAndAnswer( string username, string password, string newPwdQuestion, string newPwdAnswer )
        {
            if( !ValidateUser( username, password ) ) return false;

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                User user = GetUser( container, username, password );
                user.LoginCredentials.PasswordQuestion = newPwdQuestion;
                user.LoginCredentials.PasswordAnswer = newPwdAnswer;
                container.AcceptAllChanges();
                return container.SaveChanges() > 0;
            }
        }

        public override MembershipUser CreateUser( string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status )
        {
            ValidatePasswordEventArgs args = new ValidatePasswordEventArgs( username, password, true );
            OnValidatingPassword( args );

            if( args.Cancel )
            {
                status = MembershipCreateStatus.InvalidPassword;
                return null;
            }

            if( RequiresUniqueEmail && !string.IsNullOrEmpty( GetUserNameByEmail( email ) ) )
            {
                status = MembershipCreateStatus.DuplicateEmail;
                return null;
            }
            
            if( GetUser( username, false ) != null )
            {
                status = MembershipCreateStatus.DuplicateUserName;
                return null;
            }

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                container.AddToUsers( new User(){  } );
                status = MembershipCreateStatus.Success;
                return GetUser( username, false );
            }
        }

        public override bool DeleteUser( string username, bool deleteAllRelatedData )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                User user = (from u in container.Users where u.LoginCredentials.UserName == username select u).FirstOrDefault();
                if( user == null ) return false;
                container.DeleteObject( user.LoginCredentials );
                container.DeleteObject( user );
                container.AcceptAllChanges();
                return container.SaveChanges() > 0;
            }
        }

        public override MembershipUserCollection GetAllUsers( int pageIndex, int pageSize, out int totalRecords )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                totalRecords = container.Users.Count();
                GhostmonkMembershipUser user = new GhostmonkMembershipUser( "", "", "", "", "", "", true, false, DateTime.Now(),  );
                
                return new MembershipUserCollection();
            }
        }

        public override int GetNumberOfUsersOnline()
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                return 0;
            }
        }

        public override string GetPassword( string username, string answer )
        {
            if( !EnablePasswordRetrieval )
                throw new ProviderException( "Password Retrieval Not Enabled." );

            if( PasswordFormat == MembershipPasswordFormat.Hashed )
                throw new ProviderException( "Cannot retrieve Hashed passwords." );

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                User user = ( from u in container.Users
                              where u.LoginCredentials.UserName == username 
                              select u ).FirstOrDefault();

                if( user == null )
                    throw new MembershipPasswordException( "Cannot find user" );

                if( user.LoginCredentials.PasswordAnswer != answer )
                {
                    UpdateFailureCount( username, "Incorrect Answer" );
                    throw new MembershipPasswordException( "Provided answer does not match our record." );
                }
                return PasswordFormat == MembershipPasswordFormat.Encrypted 
                    ? UnEncodePassword( user.LoginCredentials.Password ) 
                    : user.LoginCredentials.Password;
            }
        }

        public override MembershipUser GetUser( string username, bool userIsOnline )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                return null;
            }
        }

        public override MembershipUser GetUser( object providerUserKey, bool userIsOnline )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                return null;
            }
        }

        public override bool UnlockUser( string username )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                return false;
            }
        }

        public override string GetUserNameByEmail( string email )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                return (from user in container.Users 
                        where user.Email == email 
                        select user.LoginCredentials.UserName).FirstOrDefault();
            }
        }
        
        public override string ResetPassword( string username, string answer )
        {
            if( !EnablePasswordReset )
                throw new NotSupportedException( "Password reset is not enabled." );

            if( answer == null && RequiresQuestionAndAnswer )
            {
                UpdateFailureCount( username, "passwordAnswer" );
                throw new ProviderException( "Password answer required for password reset." );
            }

            string newPassword = Membership.GeneratePassword( NEW_PASSWORD_LENGTH, MinRequiredNonAlphanumericCharacters );

            var args = new ValidatePasswordEventArgs( username, newPassword, true );
            OnValidatingPassword( args );

            if( args.Cancel )
                throw args.FailureInformation ?? new MembershipPasswordException( "Reset password canceled due to password validation failure." );

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                return string.Empty;
            }
        }

        public override void UpdateUser( MembershipUser user )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }
        }

        public override bool ValidateUser( string username, string password )
        {
            return GetUser( username, password ) != null;
        }

        public override MembershipUserCollection FindUsersByName( string usernameToMatch, int pageIndex, int pageSize, out int totalRecords )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                totalRecords = 0;
                return  new MembershipUserCollection();
            }
        }

        public override MembershipUserCollection FindUsersByEmail( string emailToMatch, int pageIndex, int pageSize, out int totalRecords )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                totalRecords = 0;
                return new MembershipUserCollection();
            }
        }

        private User GetUser( string username, string password )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                return GetUser( container, username, password );
            }
        }

        private User GetUser( GhostmonkMainSiteModelContainer container, string username, string password )
        {
            string encodedPassword = EncodePassword( password );
            return ( from user in container.Users
                        where user.LoginCredentials.UserName == username && user.LoginCredentials.Password == encodedPassword
                        select user ).FirstOrDefault();
        }

        private void UpdateFailureCount( string username, string failureType )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }
        }

        private bool CheckPassword( string password, string dbpassword )
        {
            switch( PasswordFormat )
            {
                case MembershipPasswordFormat.Encrypted:
                    return password == UnEncodePassword( dbpassword );
                case MembershipPasswordFormat.Hashed:
                    return dbpassword == EncodePassword( password );
                default:
                    return password == dbpassword;
            }
        }

        private string EncodePassword( string password )
        {
            string encodedPassword = password;

            switch( PasswordFormat )
            {
                case MembershipPasswordFormat.Clear:
                    break;
                case MembershipPasswordFormat.Encrypted:
                    encodedPassword = Convert.ToBase64String( EncryptPassword( Encoding.Unicode.GetBytes( password ) ) );
                    break;
                case MembershipPasswordFormat.Hashed:
                    var hash = new HMACSHA1 { Key = HexToByte( machineKey.ValidationKey ) };
                    encodedPassword = Convert.ToBase64String( hash.ComputeHash( Encoding.Unicode.GetBytes( password ) ) );
                    break;
                default:
                    throw new ProviderException( "Unsupported password format." );
            }

            return encodedPassword;
        }

        private string UnEncodePassword( string encodedPassword )
        {
            string password = encodedPassword;

            switch( PasswordFormat )
            {
                case MembershipPasswordFormat.Clear:
                    break;
                case MembershipPasswordFormat.Encrypted:
                    password = Encoding.Unicode.GetString( DecryptPassword( Convert.FromBase64String( password ) ) );
                    break;
                case MembershipPasswordFormat.Hashed:
                    throw new ProviderException( "Cannot unencode a hashed password." );
                default:
                    throw new ProviderException( "Unsupported password format." );
            }

            return password;
        }

        private byte[] HexToByte( string hexString )
        {
            var returnBytes = new byte[ hexString.Length / 2 ];
            for( int i = 0; i < returnBytes.Length; i++ )
            {
                returnBytes[ i ] = Convert.ToByte( hexString.Substring( i * 2, 2 ), 16 );
            }
            return returnBytes;
        }

        private static void WriteToEventLog( Exception e, string action )
        {
            var log = new EventLog { Source = EVENT_SOURCE, Log = EVENT_LOG };
            log.WriteEntry( 
                string.Format( "An exception occurred communicating with the data source.\n\nAction: {0}\n\nException: {1}", e, action ) );
        }

        private bool GetBool( string configKey, bool defaultVal )
        {
            return Convert.ToBoolean( GetString( configKey, defaultVal.ToString( CultureInfo.InvariantCulture ) ) );
        }

        private int GetInt( string configKey, int defaultVal )
        {
            return Convert.ToInt32( GetString( configKey, defaultVal.ToString( CultureInfo.InvariantCulture ) ) );
        }

        private string GetString( string configKey, string defaultValue )
        {
            return String.IsNullOrEmpty( config[ configKey ] ) ? defaultValue : configKey;
        }
    }
}
