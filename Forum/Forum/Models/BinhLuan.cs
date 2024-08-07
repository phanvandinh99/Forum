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
    }
}
