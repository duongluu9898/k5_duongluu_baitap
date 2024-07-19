-- Tạo bảng phong
CREATE TABLE IF NOT EXISTS public.phong
(
    ma_phong character varying COLLATE pg_catalog."default" NOT NULL,
    loai_phong character varying COLLATE pg_catalog."default",
    so_khach_toi_da integer,
    gia_phong_1_gio integer,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT phong_pkey PRIMARY KEY (ma_phong)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.phong
    OWNER to postgres;

-- Tạo bảng dat_phong
CREATE TABLE IF NOT EXISTS public.dat_phong
(
    ma_dat_phong character varying COLLATE pg_catalog."default" NOT NULL,
    ma_phong character varying COLLATE pg_catalog."default",
    ma_khach_hang character varying COLLATE pg_catalog."default",
    ngay_dat character varying COLLATE pg_catalog."default",
    gio_bat_dau character varying COLLATE pg_catalog."default",
    gio_ket_thuc character varying COLLATE pg_catalog."default",
    tien_dat_coc integer,
    ghi_chu character varying COLLATE pg_catalog."default",
    trang_thai_dat character varying COLLATE pg_catalog."default",
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT dat_phong_pkey PRIMARY KEY (ma_dat_phong),
    CONSTRAINT khach_hang_ma_khach_hang_foreign FOREIGN KEY (ma_khach_hang)
        REFERENCES public.khach_hang (ma_khach_hang) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT khach_hang_ma_phong_foreign FOREIGN KEY (ma_phong)
        REFERENCES public.phong (ma_phong) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dat_phong
    OWNER to postgres;

-- Tạo bảng chi_tiet_su_dung_dich_vu
CREATE TABLE IF NOT EXISTS public.chi_tiet_su_dung_dich_vu
(
    ma_dat_phong character varying COLLATE pg_catalog."default" NOT NULL,
    ma_dich_vu character varying COLLATE pg_catalog."default" NOT NULL,
    so_luong integer,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT chi_tiet_su_dung_dich_vu_pkey PRIMARY KEY (ma_dat_phong, ma_dich_vu),
    CONSTRAINT chi_tiet_su_dung_dich_vu_ma_dat_phong_foreign FOREIGN KEY (ma_dat_phong)
        REFERENCES public.dat_phong (ma_dat_phong) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT chi_tiet_su_dung_dich_vu_ma_dich_vu_foreign FOREIGN KEY (ma_dich_vu)
        REFERENCES public.dich_vu_di_kem (ma_dich_vu) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.chi_tiet_su_dung_dich_vu
    OWNER to postgres;

-- tạo bảng dich_vu_di_kem
CREATE TABLE IF NOT EXISTS public.dich_vu_di_kem
(
    ma_dich_vu character varying COLLATE pg_catalog."default" NOT NULL,
    ten_dich_vu character varying COLLATE pg_catalog."default",
    don_vi_tinh character varying COLLATE pg_catalog."default",
    don_gia integer,
    CONSTRAINT dich_vu_di_kem_pkey PRIMARY KEY (ma_dich_vu)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dich_vu_di_kem
    OWNER to postgres;

-- tạo bảng khach_hang 
CREATE TABLE IF NOT EXISTS public.khach_hang
(
    ma_khach_hang character varying COLLATE pg_catalog."default" NOT NULL,
    ten_khach_hang character varying COLLATE pg_catalog."default",
    dia_chi character varying COLLATE pg_catalog."default",
    so_dien_thoai character varying COLLATE pg_catalog."default",
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT khach_hang_pkey PRIMARY KEY (ma_khach_hang)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.khach_hang
    OWNER to postgres;


-- THÊM DỮ LIỆU VÀO CÁC BẢNG
INSERT INTO phong(ma_phong, loai_phong, so_khach_toi_da, gia_phong_1_gio)
VALUES
('P0001', 'loai 1', 20, 60000),
('P0002', 'loai 1', 25, 80000),
('P0003', 'loai 2', 15, 50000),
('P0004', 'loai 3', 20, 50000)

INSERT INTO khach_hang(ma_khach_hang, ten_khach_hang, dia_chi, so_dien_thoai)
VALUES
('KH0001', 'Nguyen Van A', 'Hoa xuan' , 111111111),
('KH0002', 'Nguyen Van B', 'Hoa hai' , 111111112),
('KH0003', 'Phan Van A', 'Cam le' , 111111113),
('KH0004', 'Phan Van B', 'Hoa xuan' , 111111114)

INSERT INTO dat_phong(ma_dat_phong, ma_phong, ma_khach_hang, ngay_dat, gio_bat_dau,
gio_ket_thuc, tien_dat_coc, trang_thai_dat)
VALUES
('DP0001', 'P0001', 'KH0002', '26/03/2018', '11:00', '13:30', 100000, 'Da dat'),
('DP0002', 'P0001', 'KH0003', '27/03/2018', '17:15', '19:15', 50000, 'Da huy'),
('DP0003', 'P0002', 'KH0002', '26/03/2018', '20:30', '22:15', 100000, 'Da dat'),
('DP0004', 'P0003', 'KH0001', '01/04/2018', '19:30', '21:15', 200000, 'Da dat')

INSERT INTO dich_vu_di_kem(ma_dich_vu, ten_dich_vu, don_vi_tinh, don_gia)
VALUES
('DV001', 'Beer', 'lon', 10000),
('DV002', 'Nuoc ngot', 'lon', 8000),
('DV003', 'Trai cay', 'dia', 35000),
('DV004', 'Khan uot', 'cai', 2000)

INSERT INTO chi_tiet_su_dung_dich_vu(ma_dat_phong, ma_dich_vu, so_luong)
VALUES
('DP0001', 'DV001', 20),
('DP0001', 'DV003', 3),
('DP0001', 'DV002', 10),
('DP0002', 'DV002', 10),
('DP0002', 'DV003', 1),
('DP0003', 'DV003', 2),
('DP0003', 'DV004', 10)

-- TRUY VẤN DỮ LIỆU
/*
Câu 1: Hiển thị MaDatPhong, MaPhong, LoaiPhong,
GiaPhong, TenKH, NgayDat,
TongTienHat, TongTienSuDungDichVu, TongTienThanhToan
tương ứng với từng mã đặt phòng có trong bảng DAT_PHONG.
Những đơn đặt phòng nào không sử dụng dịch vụ đi kèm thì 
cũng liệt kê thông tin của đơn đặt phòng đó ra

TongTienHat = GiaPhong * (GioKetThuc – GioBatDau) 
TongTienSuDungDichVu = SoLuong * DonGia 
TongTienThanhToan = TongTienHat + sum (TongTienSuDungDichVu)
*/
	
SELECT dat_phong.ma_phong, dat_phong.ngay_dat,
dat_phong.gio_bat_dau, dat_phong.gio_ket_thuc,
phong.loai_phong, phong.gia_phong_1_gio,
khach_hang.ten_khach_hang, COUNT(dat_phong.ma_dat_phong) AS so_lan_su_dung_dich_vu
FROM dat_phong
LEFT JOIN phong
ON dat_phong.ma_phong = phong.ma_phong
LEFT JOIN khach_hang
ON dat_phong.ma_khach_hang = khach_hang.ma_khach_hang
LEFT JOIN chi_tiet_su_dung_dich_vu
ON dat_phong.ma_dat_phong = chi_tiet_su_dung_dich_vu.ma_dat_phong
LEFT JOIN dich_vu_di_kem
ON chi_tiet_su_dung_dich_vu.ma_dich_vu = dich_vu_di_kem.ma_dich_vu
GROUP BY dat_phong.ma_dat_phong, phong.loai_phong, phong.gia_phong_1_gio, khach_hang.ten_khach_hang;

/*
Câu 2: Hiển thị MaKH, TenKH, DiaChi, SoDT
của những khách hàng đã từng đặt phòng karaoke có địa chỉ ở “Hoa xuan”
*/

SELECT khach_hang.ma_khach_hang, khach_hang.ten_khach_hang,
khach_hang.dia_chi, khach_hang.so_dien_thoai, trang_thai_dat,
dat_phong.created_at, dat_phong.updated_at
FROM dat_phong
LEFT JOIN khach_hang
ON dat_phong.ma_khach_hang = khach_hang.ma_khach_hang
WHERE trang_thai_dat ILIKE '%Da dat%' AND dia_chi ILIKE '%Hoa xuan%'

/*
Câu 3: Hiển thị MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, SoLanDat
của những phòng được khách hàng đặt có số lần đặt lớn hơn 2 lần
và trạng thái đặt là “Da dat”
*/
SELECT phong.ma_phong, phong.loai_phong,
phong.so_khach_toi_da, phong.gia_phong_1_gio,
dat_phong.trang_thai_dat,
COUNT(phong.ma_phong) AS so_lan_dat,
dat_phong.created_at, dat_phong.updated_at
FROM dat_phong
LEFT JOIN phong
ON dat_phong.ma_phong = phong.ma_phong
GROUP BY phong.ma_phong, dat_phong.trang_thai_dat, dat_phong.created_at, dat_phong.updated_at
HAVING dat_phong.trang_thai_dat ILIKE '%Da dat%' AND COUNT(phong.ma_phong) > 2






