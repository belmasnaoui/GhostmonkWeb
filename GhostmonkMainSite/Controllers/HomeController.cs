using System.Linq;
using System.Web.Mvc;
using LinqToTwitter;

namespace GhostmonkMainSite.Controllers
{
    public class HomeController : Controller
    {
        private const string FAIL_WHALE = "Oooops! communication with Twitter failed...";

        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public PartialViewResult TwitterFeed()
        {
            TwitterContext twitter = new TwitterContext();
            Status target;
            try
            {
                target = ( from tweet in twitter.Status
                                  where tweet.Type == StatusType.User &&
                                        tweet.ScreenName == "ghostmonk" &&
                                        tweet.IncludeRetweets == true &&
                                        tweet.Count == 1
                                  select tweet ).First();
            }
            catch
            {
                target = new Status { Text = FAIL_WHALE };
            }


            return PartialView( "Twitter", target );
        }
    }
}
