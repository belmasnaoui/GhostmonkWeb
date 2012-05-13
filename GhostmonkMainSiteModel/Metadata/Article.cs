using System;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace GhostmonkMainSiteModel.Metadata
{
    public class ArticleMetadata
    {
        [Required]
        public string Title { get; set; }

        [AllowHtml]
        public string Body { get; set; }

        [Required]
        public DateTime PublishDate { get; set; }

        public string Summary { get; set; }

        public string LinkText { get; set; }
    }
}
