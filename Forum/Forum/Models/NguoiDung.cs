namespace Forum.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NguoiDung")]
    public partial class NguoiDung
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NguoiDung()
        {
            BaiViets = new HashSet<BaiViet>();
            BinhLuans = new HashSet<BinhLuan>();
            TraLoiBinhLuans = new HashSet<TraLoiBinhLuan>();
            ViPhams = new HashSet<ViPham>();
        }

        [Key]
        [StringLength(50)]
        public string TaiKhoan { get; set; }

        [Required]
        [StringLength(50)]
        public string MatKhau { get; set; }

        [Required]
        [StringLength(100)]
        public string Ho { get; set; }

        [Required]
        [StringLength(50)]
        public string Ten { get; set; }

        public int? GioiTinh { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgaySinh { get; set; }

        public int? TrangThai { get; set; }

        [StringLength(200)]
        public string HinhAnh { get; set; }

        public int? DiemThanhTich { get; set; }
        public int? SoBaiViet { get; set; }

        public int? MaQuyen { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BaiViet> BaiViets { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BinhLuan> BinhLuans { get; set; }

        public virtual Quyen Quyen { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TraLoiBinhLuan> TraLoiBinhLuans { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ViPham> ViPhams { get; set; }
    }
}
