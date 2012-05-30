using System;
using System.Web.Security;

namespace GhostmonkMainSiteModel.Security
{
    public class GhostmonkMembershipUser : MembershipUser
    {
        public GhostmonkMembershipUser( 
            string providerName, 
            string userName,
            string firstName,
            string lastName,
            string screenName,
            int id, 
            string email, 
            string passwordQuestion, 
            string comment, 
            bool isApproved, 
            bool isLockedOut, 
            DateTime creationDate, 
            DateTime lastLoginDate, 
            DateTime lastActivityDate, 
            DateTime lastPasswordChangedDate, 
            DateTime lastLockoutDate ) : base( providerName, userName, id, email, passwordQuestion, comment, isApproved, isLockedOut, creationDate, lastLoginDate, lastActivityDate, lastPasswordChangedDate, lastLockoutDate )
        {
            FirstName = firstName;
            LastName = lastName;
            ScreenName = screenName;
        }

        public int GetId { get { return ProviderUserKey is int ? ( int )ProviderUserKey : 0; } }

        public string FirstName { get; private set; }

        public string LastName { get; private set; }

        public string ScreenName { get; private set; }
    }
}
