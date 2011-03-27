using System.Linq;
using System.Web.Mvc;
using LinqToTwitter;

namespace GhostmonkMainSite.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public PartialViewResult TwitterFeed()
        {
            TwitterContext twitter = new TwitterContext();

            Status target = ( from  tweet in twitter.Status
                              where tweet.Type == StatusType.User &&
                                    tweet.ScreenName == "ghostmonk" &&
                                    tweet.IncludeRetweets == false &&
                                    tweet.Count == 1
                              select tweet ).First();

            return PartialView( "Twitter", target );
        }
    }
}
