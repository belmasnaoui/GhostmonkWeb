using System.ComponentModel.DataAnnotations;

namespace GhostmonkMainSiteModel.Metadata
{
    public class JournalMetadata
    {
        [Required]
        public string Title { get; set; }
    }
}
