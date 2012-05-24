using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Configuration.Provider;
using System.Diagnostics;
using System.Globalization;
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
                name = "OdbcMembershipProvider";

            if( string.IsNullOrEmpty( config[ "description" ] ) )
            {
                config.Remove( "description" );
                config.Add( "description", "Sample ODBC Membership provider" );
            }

            base.Initialize( name, config );

            ApplicationName = GetString( "applicationName", HostingEnvironment.ApplicationVirtualPath );
            WriteExceptionsToEventLog = GetBool( "writeExceptionsToEventLog", true );

            string tempFormat = config[ "passwordFormat" ] ?? "Hashed";

            if( !passwordFormatLookup.TryGetValue( tempFormat, out passwordFormat ) )
                throw new ProviderException( "Password format not supported." );

            ConnectionStringSettings connectionStringSettings = ConfigurationManager.ConnectionStrings[ config[ "connectionStringName" ] ];

            if( connectionStringSettings == null || connectionStringSettings.ConnectionString.Trim() == "" )
            {
                throw new ProviderException( "Connection string cannot be blank." );
            }

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

            bool success = false;
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {
                
            }

            return success;
        }

        public override bool ChangePasswordQuestionAndAnswer( string username, string password, string newPwdQuestion, string newPwdAnswer )
        {
            if( !ValidateUser( username, password ) ) return false;

            bool success = false;
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            return success;
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

            MembershipUser user = GetUser( username, false );

            if( user != null )
            {
                status = MembershipCreateStatus.DuplicateUserName;
                return null;
            }

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            status = MembershipCreateStatus.Success;
            return GetUser( username, false );
        }

        public override bool DeleteUser( string username, bool deleteAllRelatedData )
        {
            bool success = false;
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            return success;
        }

        public override MembershipUserCollection GetAllUsers( int pageIndex, int pageSize, out int totalRecords )
        {
            MembershipUserCollection users = new MembershipUserCollection();
            totalRecords = 0;
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }
            return users;
        }

        public override int GetNumberOfUsersOnline()
        {
            int numOnline = 0;
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }
            return numOnline;
        }

        public override string GetPassword( string username, string answer )
        {
            if( !EnablePasswordRetrieval )
                throw new ProviderException( "Password Retrieval Not Enabled." );

            if( PasswordFormat == MembershipPasswordFormat.Hashed )
                throw new ProviderException( "Cannot retrieve Hashed passwords." );

            string password = string.Empty;
            string passwordAnswer = string.Empty;

            if( RequiresQuestionAndAnswer && !CheckPassword( answer, passwordAnswer ) )
            {
                UpdateFailureCount( username, "passwordAnswer" );
                throw new MembershipPasswordException( "Incorrect password answer." );
            }

            if( PasswordFormat == MembershipPasswordFormat.Encrypted )
                password = UnEncodePassword( password );

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            return password;
        }

        public override MembershipUser GetUser( string username, bool userIsOnline )
        {
            MembershipUser user = null;

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            return user;
        }

        public override MembershipUser GetUser( object providerUserKey, bool userIsOnline )
        {
            MembershipUser user = null;

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            return user;
        }

        public override bool UnlockUser( string username )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            return true;
        }

        public override string GetUserNameByEmail( string email )
        {
            string username = null;

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            return username;
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

            string passwordAnswer = "";

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            return passwordAnswer;
        }

        public override void UpdateUser( MembershipUser user )
        {
            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }
        }

        public override bool ValidateUser( string username, string password )
        {
            bool isValid = false;

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            return isValid;
        }

        public override MembershipUserCollection FindUsersByName( string usernameToMatch, int pageIndex, int pageSize, out int totalRecords )
        {
            MembershipUserCollection users = new MembershipUserCollection();
            totalRecords = 0;

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            return users;
        }

        public override MembershipUserCollection FindUsersByEmail( string emailToMatch, int pageIndex, int pageSize, out int totalRecords )
        {
            MembershipUserCollection users = new MembershipUserCollection();
            totalRecords = 0;

            using( GhostmonkMainSiteModelContainer container = new GhostmonkMainSiteModelContainer( connectionString ) )
            {

            }

            return users;
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
                    encodedPassword =
                        Convert.ToBase64String( EncryptPassword( Encoding.Unicode.GetBytes( password ) ) );
                    break;
                case MembershipPasswordFormat.Hashed:
                    var hash = new HMACSHA1 { Key = HexToByte( machineKey.ValidationKey ) };
                    encodedPassword =
                        Convert.ToBase64String( hash.ComputeHash( Encoding.Unicode.GetBytes( password ) ) );
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
                    password =
                        Encoding.Unicode.GetString( DecryptPassword( Convert.FromBase64String( password ) ) );
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
