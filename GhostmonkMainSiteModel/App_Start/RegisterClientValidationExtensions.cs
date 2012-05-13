using DataAnnotationsExtensions.ClientValidation;

[assembly: WebActivator.PreApplicationStartMethod(typeof(GhostmonkMainSiteModel.App_Start.RegisterClientValidationExtensions), "Start")]
 
namespace GhostmonkMainSiteModel.App_Start {
    public static class RegisterClientValidationExtensions {
        public static void Start() {
            DataAnnotationsModelValidatorProviderExtensions.RegisterValidationExtensions();            
        }
    }
}