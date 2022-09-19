--Bài 1: Để quản lý Thực tập nghề nghiệp của sinh viên, người ta xây dựng một cơ sở dữ liệu có tên là
--ThucTap gồm các sơ đồ quan hệ sau:
--Khoa(makhoa char(10), tenkhoa char(30), dienthoai char(10))
--GiangVien(magv int, hotengv char(30), luong decimal(5,2), makhoa char(10))
--SinhVien(masv int, hotensv char(30), makhoa char(10), namsinh int, quequan char(30))
--DeTai(madt char(10), tendt char(30), kinhphi int, NoiThucTap char(30))
--HuongDan(masv int, madt char(10), magv int, ketqua decimal(5,2))
CREATE DATABASE ThucTap;
use ThucTap;
CREATE TABLE TblKhoa(
makhoa char(10) primary key,
tenkhoa char(10),
dienthoai char(10)
);
CREATE TABLE TblGiangVien(
magv int primary key,
hotengv char(30),
luong decimal(5,2),
makhoa char(10) foreign key  references TblKhoa
);
CREATE TABLE TblSinhVien(
masv int primary key,
hotensv char(30),
luong decimal(5,2),
namsinh int,
quequan char(30),
makhoa char(10) foreign key references TblKhoa
);
--DeTai(madt char(10), tendt char(30), kinhphi int, NoiThucTap char(30))
--HuongDan(masv int, madt char(10), magv int, ketqua decimal(5,2))
CREATE TABLE TblDeTai(
madt char(10) primary key,
tendt char(30),
kinhphi int,
NoiThucTap char(30)
);
CREATE TABLE TblHuongDan(
masv int primary key,
madt char(10) foreign key references TblDeTai,
magv int foreign key references TblGiangVien,
ketqua decimal(5,2)
);
INSERT INTO TblKhoa VALUES('MK1', 'UDPM','091234501'),
('MK2', 'TKWS','081234501'),
('MK3', 'TKDH','071234501'),
('MK4', 'MOD123','061234501');
SELECT * FROM TblKhoa;
INSERT INTO TblGiangVien VALUES('1', 'Hang','700','MK1'),
('2', 'Be','400','MK2'),
('3', 'Thom','100','MK3'),
('4', 'Ngo','600','MK4');
SELECT * FROM TblGiangVien;
INSERT INTO TblSinhVien VALUES('1', 'Tu','700','1992','HaNoi','MK1'),
('2', 'Ti','400','1991','HaiPhong','MK2'),
('3', 'Trau','100','1997','QuangNgau','MK3'),
('4', 'Tam','600','1995','HaTay','MK4');
SELECT * FROM TblSinhVien;
INSERT INTO TblDeTai VALUES
('Dt01','GIS',100,'Nghe An'),
('Dt02','ARC GIS',500,'Nam Dinh'),
('Dt03','Spatial DB',100, 'Ha Tinh'),
('Dt04','MAP',300,'Quang Binh' );
SELECT * FROM TblDeTai;
INSERT INTO TblHuongDan VALUES
(1,'Dt01',1,8),
(2,'Dt03',2,9),
(3,'Dt04',3,0);
SELECT * FROM TblHuongDan;
--Đưa ra thông tin gồm mã số, họ tênvà tên khoa của tất cả các giảng viên
SELECT gv.magv, gv.hotengv , kh.tenkhoa FROM TblKhoa kh join TblGiangVien gv on gv.makhoa = kh.makhoa
--Đưa ra thông tin gồm mã số, họ tênvà tên khoa của các giảng viên của khoa ‘UDPM’
SELECT gv.magv, gv.hotengv , kh.tenkhoa FROM TblKhoa kh join TblGiangVien gv on gv.makhoa = kh.makhoa where kh.tenkhoa = 'UDPM'  
--Cho biết số sinh viên của khoa ‘UDPM’
SELECT COUNT(sv.masv) as 'SoLuongSV' FROM TblSinhVien sv join TblKhoa kh on sv.makhoa = kh.makhoa where kh.tenkhoa = 'UDPM'
--Đưa ra danh sách gồm mã số, họ tênvà tuổi của các sinh viên khoa ‘UDPM’
SELECT masv , hotensv , namsinh FROM TblSinhVien sv join TblKhoa kh on sv.makhoa = kh.makhoa where kh.tenkhoa = 'UDPM'
--Cho biết số giảng viên của khoa ‘TKWS’
SELECT COUNT(gv.magv) as 'SoLuongGV' FROM TblGiangVien gv join TblKhoa kh on gv.makhoa = kh.makhoa where kh.tenkhoa = 'TKWS'
--Cho biết thông tin về sinh viên không tham gia thực tập
SELECT sv.makhoa , sv.hotensv FROM TblSinhVien sv where not exists (SELECT hd.masv FROM TblHuongDan hd where sv.masv = hd.masv)
--Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa
SELECT kh.makhoa , kh.tenkhoa , COUNT(gv.magv) as 'SoLuongGV' FROM TblKhoa kh join TblGiangVien gv on kh.makhoa = gv.makhoa group by kh.tenkhoa , kh.makhoa
--Cho biết số điện thoại của khoa mà sinh viên có tên ‘Tam’ đang theo học
SELECT kh.dienthoai , sv.hotensv FROM TblSinhVien sv join TblKhoa kh on sv.makhoa = kh.makhoa where sv.hotensv= 'Tam'
--II
--Cho biết mã số và tên của các đề tài do giảng viên ‘Hang’ hướng dẫn
SELECT gv.hotengv, dt.madt FROM TblGiangVien gv join TblHuongDan hd on gv.magv = hd.magv
												join TblDeTai dt on hd.madt = dt.madt where gv.hotengv = 'Hang'
--Cho biết tên đề tài không có sinh viên nào thực tập
SELECT dt.madt , dt.tendt FROM TblDeTai dt where not exists (SELECT hd.madt FROM TblHuongDan hd where hd.madt = dt.madt )
--Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên.
SELECT gv.magv , gv.hotengv , kh.tenkhoa FROM TblGiangVien gv join TblKhoa kh on gv.makhoa = kh.makhoa where gv.magv in (
SELECT hd.magv FROM TblHuongDan hd group by hd.magv having count(hd.masv) > 3)
--Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất
SELECT dt.madt, dt.tendt FROM TblDeTai dt where dt.kinhphi = (SELECT Max(dt.kinhphi) FROM TblDeTai dt)
--Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập
SELECT DT.Madt,DT.Tendt
FROM TBLDeTai DT
WHERE DT.Madt in (
SELECT HD.Madt
FROM TBLHuongDan HD
GROUP BY HD.Madt
HAVING COUNT(HD.Madt) > 2)
--Đưa ra mã số, họ tên và điểm của các sinh viên khoa ‘UDPM’
SELECT SV.Masv,SV.Hotensv,HD.KetQua
FROM TBLSinhVien SV JOIN TBLHuongDan HD
ON SV.Masv = HD.Masv
JOIN TBLKhoa K
ON K.Makhoa = SV.Makhoa
WHERE K.Tenkhoa = 'UDPM'
--Đưa ra tên khoa, số lượng sinh viên của mỗi khoa
SELECT K.Tenkhoa, COUNT(SV.Masv) AS Số_SV
FROM TBLSinhVien SV JOIN TBLKhoa K
ON SV.Makhoa = K.Makhoa
GROUP BY K.Tenkhoa
--Cho biết thông tin về các sinh viên thực tập tại quê nhà
SELECT * FROM TBLSinhVien SV JOIN TBLHuongDan HD ON HD.Masv = SV.Masv JOIN TBLDeTai DT ON dt.Madt = hd.Madt WHERE sv.quequan = dt.NoiThucTap
--Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập
SELECT * FROM TblSinhVien sv JOIN TblHuongDan hd on sv.masv = hd.masv where hd.ketqua is null
--Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập bằng 0
SELECT sv.masv , sv.hotensv FROM TblSinhVien sv JOIN TblHuongDan hd on sv.masv = hd.masv where hd.ketqua = 0