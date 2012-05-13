using System.ComponentModel.DataAnnotations;
using GhostmonkMainSiteModel.Metadata;

namespace GhostmonkMainSiteModel
{
    [MetadataType( typeof(JournalMetadata) )]
    public partial class Journal {}

    [MetadataType(typeof(UserMetadata))]
    public partial class User
    {
        public string ConfirmPassword { get; set; }
        public string ConfirmEmail { get; set; }
    }

    [MetadataType( typeof( ArticleMetadata ) )]
    public partial class Article {}

    [MetadataType( typeof( ImageMetadata ) )]
    public partial class Image { }

    [MetadataType( typeof( VideoMetadata ) )]
    public partial class Video {}

    [MetadataType( typeof( SlideshowMetadata ) )]
    public partial class Slideshow { }

    [MetadataType( typeof( CommentMetadata ) )]
    public partial class Comment { }

    [MetadataType( typeof( CategoryMetadata ) )]
    public partial class Category { }

    [MetadataType( typeof( TagMetadata ) )]
    public partial class Tag { }

    [MetadataType( typeof( PullQuoteMetadata ) )]
    public partial class PullQuote { }
}
