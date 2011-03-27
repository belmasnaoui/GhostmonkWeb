using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace GhostmonkMainSite
{
    public class MvcApplication : HttpApplication
    {
        private static readonly List<string> partialViewLocations = new List<string>{ };

        public static void RegisterRoutes( RouteCollection routes )
        {
            routes.IgnoreRoute( "{resource}.axd/{*pathInfo}" );

            routes.MapRoute( "Home", string.Empty, new { controller = "Home", action = "Index" } );

            routes.MapRoute(
                "CategoryLink",
                "{category}/{linkText}",
                new { controller = "Article", action = "FullArticle", category = "BlogEntry", linkText = string.Empty } );

            routes.MapRoute(
                "Default",
                "{controller}/{action}/{id}",
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } );
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
                
            RegisterRoutes( RouteTable.Routes );
            partialViewLocations.Add( "~/Views/Widgets/{0}.ascx" );
            RegisterViewEngine();
        }

        public static void RegisterViewEngine()
        {
            ViewEngines.Engines.Clear();
            WebFormViewEngine viewEngine = new WebFormViewEngine();
            viewEngine.PartialViewLocationFormats 
                = partialViewLocations.ToArray().Concat( viewEngine.PartialViewLocationFormats ).ToArray();
            ViewEngines.Engines.Add( viewEngine );
        }
    }
}