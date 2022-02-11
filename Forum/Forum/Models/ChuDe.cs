namespace Forum.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChuDe")]
    public partial class ChuDe
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ChuDe()
        {
            BaiViets = new HashSet<BaiViet>();
        }

        [Key]
        public int MaChuDe { get; set; }

        [Required]
        [StringLength(100)]
        public string TenChuDe { get; set; }

        public int? SoBaiViet { get; set; }

        public int? MaDanhMuc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BaiViet> BaiViets { get; set; }

        public virtual DanhMuc DanhMuc { get; set; }
    }
}
