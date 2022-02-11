namespace Forum.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TraLoiBinhLuan")]
    public partial class TraLoiBinhLuan
    {
        [Key]
        public int MaTraLoi { get; set; }

        [Required]
        [StringLength(200)]
        public string TenTraloi { get; set; }

        [Required]
        public string NoiDungTraloi { get; set; }

        public DateTime? NgayTraLoi { get; set; }

        public int? MaBinhLuan { get; set; }

        [StringLength(50)]
        public string TaiKhoan { get; set; }

        public virtual BinhLuan BinhLuan { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }
    }
}
