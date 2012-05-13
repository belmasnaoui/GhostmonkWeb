using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using DataAnnotationsExtensions;

namespace GhostmonkMainSiteModel.Metadata
{
    public class UserMetadata
    {
        [Required]
        [StringLength( 50 )]
        [DisplayName("First Name")]
        public string FirstName { get; set; }

        [Required]
        [StringLength( 50 )]
        [DisplayName( "Last Name" )]
        public string LastName { get; set; }

        [StringLength( 50 )]
        [DisplayName( "Screen Alias" )]
        public string ScreenName { get; set; }

        [Required]
        [Email]
        public string Email { get; set; }

        [Required]
        [Compare("Email")]
        [DisplayName("Confirm Email")]
        public string ConfirmEmail { get; set; }

        [Required]
        [Range(0,4)]
        [DisplayName( "User Level" )]
        public int AuthorizationLevel { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName( "Login Name" )]
        public string LoginName { get; set; }

        [Required]
        [StringLength( 10 )]
        public string Password { get; set; }

        [Required]
        [Compare("Password")]
        [DisplayName("Confirm Password")]
        public string ConfirmPassword { get; set; }
    }
}
