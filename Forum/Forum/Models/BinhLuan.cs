namespace Forum.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BinhLuan")]
    public partial class BinhLuan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BinhLuan()
        {
            TraLoiBinhLuans = new HashSet<TraLoiBinhLuan>();
        }

        [Key]
        public int MaBinhLuan { get; set; }

        [Required]
        public string NoiDungBinhLuan { get; set; }

        public DateTime? NgayBinhLuan { get; set; }

        public int? MaBaiViet { get; set; }

        [StringLength(50)]
        public string TaiKhoan { get; set; }

        public virtual BaiViet BaiViet { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TraLoiBinhLuan> TraLoiBinhLuans { get; set; }
    }
}
