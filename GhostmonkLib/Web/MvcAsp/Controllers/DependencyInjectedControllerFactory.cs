using System;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.Practices.Unity;

namespace GhostmonkLib.Web.MvcAsp.Controllers
{
    public class DependencyInjectedControllerFactory : DefaultControllerFactory
    {
        private readonly UnityContainer container;

        public DependencyInjectedControllerFactory( UnityContainer container )
        {
            this.container = container;
        }

        protected override IController GetControllerInstance( RequestContext requestContext, Type controllerType )
        {
            return container.Resolve( controllerType ) as IController;
        }
    }
}
