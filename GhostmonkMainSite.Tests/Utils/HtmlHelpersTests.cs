using System.Web;
using System.Web.Mvc;
using GhostmonkMainSite.Utils;
using NUnit.Framework;

namespace GhostmonkMainSite.Tests.Utils
{
    [TestFixture]
    public class HtmlHelpersTests
    {
        private HtmlHelper helper;

        [SetUp]
        public void SetUp()
        {
            helper = null;
            helper = new HtmlHelper( new ViewContext(), new ViewUserControl() );
        }

        [Test]
        public void ThumbToFullImageLink_NullAlt_ExtractsProperAltTag()
        {
            const string expected = "<a href='/fimage.jpg' target='_blank'><img src='/timage.jpg' alt='timage' /></a>";
            IHtmlString result = helper.ThumbToFullImageLink( "/timage.jpg", "/fimage.jpg", null );
            Assert.AreEqual( expected, result.ToHtmlString() );
        }
    }
}
