using System.Diagnostics;
using GhostmonkMainSite.Utils;
using NUnit.Framework;

namespace GhostmonkMainSite.Tests.Utils
{
    [TestFixture]
    public class TweetParserTests
    {
        [Test]
        public void ParseHashTags_ValidHashTag_CreatesTwitterLink()
        {
            const string tweet = "#hash sometext #hash";
            const string expectedResult = "<a href='http://www.twitter.com/search?q=hash' target='_blank'>#hash</a> sometext <a href='http://www.twitter.com/search?q=hash' target='_blank'>#hash</a>";
            Assert.AreEqual( expectedResult, TweetParser.CreateSymbolLinks( "#", tweet ) );
        }

        [Test]
        public void ParseHashTags_InvalidHashTag_NoLinkCreated()
        {
            const string expectedResult = "invalid#hash";
            Assert.AreEqual( expectedResult, TweetParser.CreateSymbolLinks( "#", expectedResult ) );
        }

        [Test]
        public void ParseLinks_FullyQulifiedLink_CreateLink()
        {
            const string tweet = "sometext http://www.ghostmonk.com/somemorestuff.html";
            const string expectedResult = "sometext <a href='http://www.ghostmonk.com/somemorestuff.html' target='_blank'>http://www.ghostmonk.com/somemorestuff.html</a>";
            Assert.AreEqual( expectedResult, TweetParser.ParseLinks( tweet ) );
        }

        [Test]
        public void ParseLinks_MissingProtocol_CreateLink()
        {
            const string tweet = "sometext www.ghostmonk.com/somemorestuff.html";
            const string expectedResult = "sometext <a href='http://www.ghostmonk.com/somemorestuff.html' target='_blank'>www.ghostmonk.com/somemorestuff.html</a>";
            Assert.AreEqual( expectedResult, TweetParser.ParseLinks( tweet ) );
        }

        [Test]
        public void ParseLinks_MissingProtocol_MissingSubDomain_ValidTLD_CreateLink()
        {
            const string tweet = "sometext ghostmonk.com/somemorestuff";
            const string expectedResult = "sometext <a href='http://ghostmonk.com/somemorestuff' target='_blank'>ghostmonk.com/somemorestuff</a>";
            Assert.AreEqual( expectedResult, TweetParser.ParseLinks( tweet ) );
        }

        [Test]
        public void ParseAmpersands_ValidFormat_CreateTwitterLink()
        {
            const string tweet = "sometext @ghostmonk moretext@ghostmonk";
            const string expectedResult = "sometext <a href='http://www.twitter.com/ghostmonk' target='_blank'>@ghostmonk</a> moretext@ghostmonk";
            Assert.AreEqual( expectedResult, TweetParser.CreateSymbolLinks( "@", tweet ) );
        }

        [Test]
        public void ParseAmpersands_MultipleValidFormats_CreateTwitterLink()
        {
            const string tweet = "@ghostmonk @ghostmonk";
            const string expectedResult = "<a href='http://www.twitter.com/ghostmonk' target='_blank'>@ghostmonk</a> <a href='http://www.twitter.com/ghostmonk' target='_blank'>@ghostmonk</a>";
            Assert.AreEqual( expectedResult, TweetParser.CreateSymbolLinks( "@", tweet ) );
        }

        [Test]
        public void SearchAllTypes_ValidFormat_ReturnsFormattedString()
        {
            const string tweet = "@ghostmonk sometext @ghostmonk @ghostmonk moretext@ghostmonk #hash http://www.ghostmonk.com";
            const string expectedResult = "<a href='http://www.twitter.com/ghostmonk' target='_blank'>@ghostmonk</a> sometext "
                                          + "<a href='http://www.twitter.com/ghostmonk' target='_blank'>@ghostmonk</a> <a href='http://www.twitter.com/ghostmonk' target='_blank'>@ghostmonk</a> "
                                          + "moretext@ghostmonk <a href='http://www.twitter.com/search?q=hash' target='_blank'>#hash</a> "
                                          + "<a href='http://www.ghostmonk.com' target='_blank'>http://www.ghostmonk.com</a>";
            string actualResult = TweetParser.ParseTweet( tweet );
            Debug.Write( actualResult );
            Assert.AreEqual( expectedResult, actualResult );
        }
    }
}
