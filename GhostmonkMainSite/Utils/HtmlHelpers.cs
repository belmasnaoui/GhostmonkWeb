using System.Web;
using System.Web.Mvc;

namespace GhostmonkMainSite.Utils
{
    public static class HtmlHelpers
    {
        public static IHtmlString Image( this HtmlHelper helper, string src, string alt )
        {
            return new HtmlString( 
                string.Format( "<img src='{0}' alt='{1}' />", 
                    VirtualPathUtility.ToAbsolute( src ), alt ) );
        }

        public static IHtmlString CssLink( this HtmlHelper helper, string href, string media )
        {
            return new HtmlString( 
                string.Format( "<link href='{0}' rel='stylesheet' type='text/css' media='{1}' />", 
                    VirtualPathUtility.ToAbsolute( href ), media ) );
        }

        public static IHtmlString JsScriptLink( this HtmlHelper helper, string src )
        {
            return new HtmlString( 
                string.Format( "<script src='{0}' type='text/javascript'></script>", 
                    VirtualPathUtility.ToAbsolute( src ) ) );
        }

        public static IHtmlString RolloverLink( this HtmlHelper helper, string href, string activeImg, string inactiveImg, string alt )
        {
            href = VirtualPathUtility.IsAbsolute( href ) ? VirtualPathUtility.ToAbsolute( href ) : href;
            return new HtmlString(
                string.Format( "<a href='{0}'><img src='{1}' class='active' alt='{3}' /><img src='{2}' class='inactive' alt='{3}' /></a>",
                    href,
                    VirtualPathUtility.ToAbsolute( activeImg ),
                    VirtualPathUtility.ToAbsolute( inactiveImg ),
                    alt ) );
        }

        public static IHtmlString SocialMediaLink( this HtmlHelper helper, string href, string imgName, string alt )
        {
            const string socialIconsPath = "~/Content/Images/social-icons/";
            return RolloverLink(
                helper, href,
                socialIconsPath + imgName + ".png",
                socialIconsPath + imgName + "-out.png",
                alt );
        }

        public static IHtmlString ThumbToFullImageLink( this HtmlHelper helper, string thumbHref, string fullHref, string alt )
        {
            if( alt == null )
            {
                int start = thumbHref.LastIndexOf( "/" ) + 1;
                int length = thumbHref.LastIndexOf( "." ) - start;
                alt = thumbHref.Substring( start, length );
            }
            return new HtmlString( 
                string.Format( "<a href='{0}' target='_blank'><img src='{1}' alt='{2}' /></a>", 
                    VirtualPathUtility.ToAbsolute( fullHref ), 
                    VirtualPathUtility.ToAbsolute( thumbHref ), alt ) );
        }
    }
}