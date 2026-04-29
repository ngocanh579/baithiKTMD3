drop database if  exists ql_matbang;
create database ql_matbang;
use ql_matbang;
CREATE TABLE mat_bang (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ma_mat_bang VARCHAR(20) UNIQUE NOT NULL,
    trang_thai VARCHAR(20),
    dien_tich DOUBLE,
    tang INT,
    loai_mat_bang VARCHAR(50),
    gia_tien DOUBLE,
    ngay_bat_dau DATE,
    ngay_ket_thuc DATE
);

INSERT INTO mat_bang
(ma_mat_bang, trang_thai, dien_tich, tang, loai_mat_bang, gia_tien, ngay_bat_dau, ngay_ket_thuc)
VALUES

    ('MB-01', 'Trống', 45.5, 1, 'Văn phòng chia sẻ', 12000000, '2026-01-01', '2026-07-01'),

    ('MB-02', 'Đã thuê', 60.0, 2, 'Văn phòng trọn gói', 20000000, '2025-10-01', '2026-10-01'),

    ('MB-03', 'Hạ tầng', 35.0, 3, 'Văn phòng chia sẻ', 9000000, '2026-02-01', '2026-08-01'),

    ('MB-04', 'Đầy đủ', 80.0, 5, 'Văn phòng trọn gói', 30000000, '2025-05-01', '2026-05-01'),

    ('MB-05', 'Trống', 25.0, 1, 'Văn phòng chia sẻ', 7000000, NULL, NULL),

    ('MB-06', 'Đã thuê', 55.0, 7, 'Văn phòng trọn gói', 18000000, '2025-09-15', '2026-03-15'),

    ('MB-07', 'Hạ tầng', 40.0, 4, 'Văn phòng chia sẻ', 11000000, '2026-03-01', '2026-09-01'),

    ('MB-08', 'Trống', 95.0, 10, 'Văn phòng trọn gói', 35000000, NULL, NULL),

    ('MB-09', 'Đầy đủ', 70.0, 12, 'Văn phòng chia sẻ', 22000000, '2025-06-01', '2026-06-01'),

    ('MB-10', 'Trống', 30.0, 15, 'Văn phòng trọn gói', 15000000, NULL, NULL);
