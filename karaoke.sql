CREATE TABLE "PHONG" (
  "ma_phong" varchar PRIMARY KEY,
  "loai_phong" varchar,
  "so_khach_toi_da" int,
  "gia_phong_1_gio" int,
  "created_at" timestamptz DEFAULT (now()),
  "updated_at" timestamptz DEFAULT (now())
);

CREATE TABLE "DAT_PHONG" (
  "ma_dat_phong" varchar PRIMARY KEY,
  "ma_phong" varchar,
  "ma_khach_hang" varchar,
  "ngay_dat" time,
  "gio_bat_dau" time,
  "gio_ket_thuc" time,
  "tien_dat_coc" int,
  "ghi_chu" varchar,
  "trang_thai_dat" varchar,
  "created_at" timestamptz DEFAULT (now()),
  "updated_at" timestamptz DEFAULT (now())
);

CREATE TABLE "KHACH_HANG" (
  "ma_khach_hang" varchar PRIMARY KEY,
  "ten_khach_hang" varchar,
  "dia_chi" varchar,
  "so_dien_thoai" int,
  "created_at" timestamptz DEFAULT (now()),
  "updated_at" timestamptz DEFAULT (now())
);

CREATE TABLE "CHI_TIET_SU_DUNG_DV" (
  "ma_dat_phong" varchar,
  "ma_dich_vu" varchar,
  "so_luong" int,
  "created_at" timestamptz DEFAULT (now()),
  "updated_at" timestamptz DEFAULT (now()),
  PRIMARY KEY ("ma_dat_phong", "ma_dich_vu")
);

CREATE TABLE "DICH_VU_DI_KEM" (
  "ma_dich_vu" varchar PRIMARY KEY,
  "ten_dich_vu" varchar,
  "don_vi_tinh" varchar,
  "don_gia" int,
  "created_at" timestamptz DEFAULT (now()),
  "updated_at" timestamptz DEFAULT (now())
);

ALTER TABLE "DAT_PHONG" ADD FOREIGN KEY ("ma_phong") REFERENCES "PHONG" ("ma_phong");

ALTER TABLE "DAT_PHONG" ADD FOREIGN KEY ("ma_khach_hang") REFERENCES "KHACH_HANG" ("ma_khach_hang");

ALTER TABLE "CHI_TIET_SU_DUNG_DV" ADD FOREIGN KEY ("ma_dat_phong") REFERENCES "DAT_PHONG" ("ma_dat_phong");

ALTER TABLE "CHI_TIET_SU_DUNG_DV" ADD FOREIGN KEY ("ma_dich_vu") REFERENCES "DICH_VU_DI_KEM" ("ma_dich_vu");
