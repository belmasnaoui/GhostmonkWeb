using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Routing;

namespace GhostmonkLib.Web.MvcAsp.Attributes
{
    public class LogAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting( ActionExecutingContext filterContext )
        {
            Log( "OnActionExecuting", filterContext.RouteData  );
        }

        public override void OnActionExecuted( ActionExecutedContext filterContext )
        {
            Log( "OnActionExecuted", filterContext.RouteData );
        }

        public override void OnResultExecuting( ResultExecutingContext filterContext )
        {
            Log( "OnResultExecuting", filterContext.RouteData );
        }

        public override void OnResultExecuted( ResultExecutedContext filterContext )
        {
            Log( "OnResultExecuted", filterContext.RouteData );
        }

        private static void Log( string stageName, RouteData data )
        {
            Trace.WriteLine( string.Format( "{0}::{1} - {2}", data.Values["controller"], data.Values["action"], stageName  ) );
        }
    }
}
