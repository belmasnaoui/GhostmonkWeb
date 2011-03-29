using System.Text.RegularExpressions;

namespace GhostmonkMainSite.Utils
{
    public class TweetParser
    {
        private const string URI_PATTERN = @"(?#Protocol)(?:(?:ht|f)tp(?:s?)\:\/\/|~\/|\/)?(?#Username:Password)(?:\w+:\w+@)?(?#Subdomains)(?:(?:[-\w]+\.)+(?#TopLevel Domains)(?:com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum|travel|[a-z]{2}))(?#Port)(?::[\d]{1,5})?(?#Directories)(?:(?:(?:\/(?:[-\w~!$+|.,=]|%[a-f\d]{2})+)+|\/)+|\?|#)?(?#Query)(?:(?:\?(?:[-\w~!$+|.,*:]|%[a-f\d{2}])+=?(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)(?:&(?:[-\w~!$+|.,*:]|%[a-f\d{2}])+=?(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)*)*(?#Anchor)(?:#(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)?";
        private const string TAG_PATTERN = " {0}[A-z,a-z,0-9]*";

        public static string ParseTweet( string tweet )
        {
            tweet = ParseLinks( tweet );
            tweet = CreateSymbolLinks( "#", tweet );
            tweet = CreateSymbolLinks( "@", tweet );
            return tweet;
        }

        public static string ParseLinks( string tweet )
        {
            return Regex.Replace( tweet, URI_PATTERN, new MatchEvaluator( NormalLink ) );
        }

        public static string CreateSymbolLinks( string symbol, string tweet )
        {
            string firstSymbolTag = tweet.Substring( 0, 1 ) == symbol
                ? tweet.Substring( 0, tweet.IndexOf( " " ) ) : string.Empty;

            string prefix = firstSymbolTag.Length > 0
                ? CreateTwitterLink( firstSymbolTag ) : string.Empty;

            string pattern = string.Format( TAG_PATTERN, symbol );

            return prefix + Regex.Replace( tweet.Substring( firstSymbolTag.Length ), pattern, new MatchEvaluator( TwitterLink ) );
        }

        private static string CreateTwitterLink( string value )
        {
            const string twitterUri = "http://www.twitter.com/";
            string query = value.Substring( 0, 1 ) == "#" ? "search?q=" : string.Empty;
            string tag = value.Substring( 1 );
            return string.Format( "<a href='{0}{1}{2}' target='_blank'>{3}</a>", twitterUri, query, tag, value );
        }

        private static string NormalLink( Match match )
        {
            string value = match.Value.Substring( 0, 7 ) == "http://" ? match.Value : "http://" + match.Value;
            return string.Format( "<a href='{0}' target='_blank'>{1}</a>", value, match.Value );
        }

        private static string TwitterLink( Match match )
        {
            return " " + CreateTwitterLink( match.Value.Substring( 1 ) );
        }
    }
}