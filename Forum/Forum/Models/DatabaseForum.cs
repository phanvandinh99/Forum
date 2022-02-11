using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Forum.Models
{
    public partial class DatabaseForum : DbContext
    {
        public DatabaseForum()
            : base("name=DatabaseForum")
        {
        }

        public virtual DbSet<BaiViet> BaiViets { get; set; }
        public virtual DbSet<BinhLuan> BinhLuans { get; set; }
        public virtual DbSet<ChuDe> ChuDes { get; set; }
        public virtual DbSet<DanhMuc> DanhMucs { get; set; }
        public virtual DbSet<NguoiDung> NguoiDungs { get; set; }
        public virtual DbSet<Quyen> Quyens { get; set; }
        public virtual DbSet<TraLoiBinhLuan> TraLoiBinhLuans { get; set; }
        public virtual DbSet<ViPham> ViPhams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BaiViet>()
                .Property(e => e.TaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<BinhLuan>()
                .Property(e => e.TaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.TaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);

            modelBuilder.Entity<TraLoiBinhLuan>()
                .Property(e => e.TaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<ViPham>()
                .Property(e => e.TaiKhoan)
                .IsUnicode(false);
        }
    }
}
