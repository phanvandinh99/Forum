namespace Forum.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BaiViet")]
    public partial class BaiViet
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BaiViet()
        {
            BinhLuans = new HashSet<BinhLuan>();
            LuotThiches = new HashSet<LuotThich>();
        }

        [Key]
        public int MaBaiViet { get; set; }

        [Required]
        [StringLength(200)]
        public string TenBaiViet { get; set; }

        [Required]
        public string NoiDungBaiViet { get; set; }

        public DateTime? NgayDang { get; set; }

        public DateTime? NgayCapNhat { get; set; }

        public int? TrangThai { get; set; }

        public int? LuotThich { get; set; }

        public int? BinhLuan { get; set; }

        public int? LuotXem { get; set; }

        public int? MaChuDe { get; set; }

        [StringLength(50)]
        public string TaiKhoan { get; set; }

        public virtual ChuDe ChuDe { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BinhLuan> BinhLuans { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LuotThich> LuotThiches { get; set; }
    }
}
