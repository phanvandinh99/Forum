namespace Forum.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ViPham")]
    public partial class ViPham
    {
        [Key]
        public int MaViPham { get; set; }

        [Required]
        [StringLength(100)]
        public string NoiDungViPham { get; set; }

        [StringLength(50)]
        public string TaiKhoan { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }
    }
}
