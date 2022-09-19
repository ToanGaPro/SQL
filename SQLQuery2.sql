CREATE DATABASE DeThiFsoft;
use DeThiFsoft;
CREATE TABLE NhaCungCap(
MaNhaCC nvarchar(50) primary key,
TenNhaCC nvarchar(50),
DiaChi nvarchar(50),
SoDT int,
MaSoThue nvarchar(50)
);
CREATE TABLE LoaiDichVu(
MaLoaiFV nvarchar(50) primary key,
TenTenLoai nvarchar(50)
);
CREATE TABLE MucPhi(
MaMP nvarchar(50) primary key,
DonGia Float(50),
MoTa nvarchar(50)
);
CREATE TABLE DongXe(
DongXe nvarchar(50) primary key,
HangXe nvarchar(50),
SoChoNguoi nvarchar(50)
);
CREATE TABLE DangKyCungCap(
MaDKCC nvarchar(50) primary key,
MaNhaCC nvarchar(50) foreign key references NhaCungCap,
MaLoaiFV nvarchar(50) foreign key references LoaiDichVu,
DongXe nvarchar(50) foreign key references DongXe,
MaMP nvarchar(50)  foreign key references MucPhi,
NgayBatDauCungCap nvarchar(50),
NgayKetThucCungCap nvarchar(50),
SoLuongXeDangKy int
);
INSERT INTO NhaCungCap Values 
('NC001',N'Cty TNHH Toàn Pháp',N'Hải Châu','0511399888','581234'),
('NC002',N'Cty Phan Đình Nam',N'Hòa Thuận','0511399888','781234'),
('NC003',N'Cty Cổ phần Đông Du',N'Liên Chiều','0511399888','581234'),
('NC004',N'Ông Nguyễn Văn A',N'Hải Châu','0511399888','581234'),
('NC005',N'Cty Cổ Phần Toàn Cầu Xanh',N'Thánh Khê','0511399888','581234'),
('NC006',N'Cty TNHH AMA',N'Hải Châu','0511399888','581234'),
('NC007',N'Bà Trần Thị Bích Vấn',N'Hải Châu','0511399888','581234'),
('NC008',N'Cty TNHH Phan Thánh',N'Hòa Thuận','0511399888','581234'),
('NC009',N'Tập Đoàn ĐNÁ',N'Liên Chiêu','0511399888','581234'),
('NC0010',N'Cty Cổ phần Rạng Đông',N'Liên Chiêu','0511399888','581234');
SELECT * FROM NhaCungCap
INSERT INTO LoaiDichVu Values 
('DV01',N'Dịch vụ xe taxi'),
('DV02',N'Dịch vụ xe nus công cộng tuyến cố định'),
('DV03',N'Dịch vụ xe cho thuê theo hợp đồng');
SELECT * FROM LoaiDichVu
INSERT INTO MucPhi Values 
('MP01','10.0000',N'Áp dụng từ 1/2015'),
('MP02','15.0000',N'Áp dụng từ 2/2015'),
('MP03','20.0000',N'Áp dụng từ 1/2010'),
('MP04','25.0000',N'Áp dụng từ 1/2011');
SELECT * FROM MucPhi
INSERT INTO DongXe Values 
('Hiace','Toyota','16'),
('Vios','Toyota','5'),
('Escape','Ford','5'),
('Forte','KIA','5'),
('Careto','KIA','7'),
('Stare','Huyndai','5'),
('Grand-i10','1Huyndai','7');
INSERT INTO DangKyCungCap Values 
('DK001','NC001','DV01','Hiace','MP01','2015-20-15','2016-20-11','4'),
('DK002','NC002','DV02','Vios','MP02','2015-20-15','2016-20-11','4'),
('DK003','NC003','DV03','Escape','MP03','2015-20-15','2016-20-11','4'),
('DK004','NC005','DV01','Careto','MP04','2015-20-15','2016-20-11','4'),
('DK005','NC002','DV02','Stare','MP03','2015-20-15','2016-20-11','4'),
('DK006','NC004','DV03','Hiace','MP04','2015-20-15','2016-20-11','4'),
('DK007','NC004','DV01','Forte','MP03','2015-20-15','2016-20-11','4'),
('DK008','NC006','DV01','Stare','MP02','2015-20-15','2016-20-11','4'),
('DK009','NC005','DV03','Hiace','MP02','2015-20-15','2016-20-11','4'),
('DK0010','NC006','DV01','Stare','MP02','2015-20-15','2016-20-11','4'),
('DK0012','NC007','DV03','Escape','MP01','2015-20-15','2016-20-11','10'),
('DK0013','NC003','DV02','Stare','MP01','2015-20-15','2016-20-11','4'),
('DK0014','NC008','DV02','Grand-i10','MP01','2015-20-15','2016-20-11','5'),
('DK0016','NC001','DV03','Stare','MP01','2015-20-15','2016-20-11','7'),
('DK0017','NC002','DV03','Careto','MP02','2015-20-15','2016-20-11','4'),
('DK0018','NC008','DV03','Vios','MP02','2015-20-15','2016-20-11','4'),
('DK0019','NC003','DV03','Careto','MP03','2015-20-15','2016-20-11','1'),
('DK0020','NC002','DV03','Grand-i10','MP04','2015-20-15','2016-20-11','2'),
('DK0021','NC006','DV01','Forte','MP03','2015-20-15','2016-20-11','4'),
('DK0022','NC002','DV02','Careto','MP04','2015-20-15','2016-20-11','4'),
('DK0023','NC002','DV01','Vios','MP02','2015-20-15','2016-20-11','4'),
('DK0024','NC003','DV03','Grand-i10','MP04','2015-20-15','2016-20-11','9'),
('DK0025','NC003','DV03','Careto','MP01','2015-20-15','2016-20-11','6');
--Câu 3: Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ
SELECT * FROM DongXe where SoChoNguoi > 5
--Câu 4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
--thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
--thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km
SELECT ncc.MaNhaCC , ncc.TenNhaCC FROM NhaCungCap ncc join DangKyCungCap dkcc on ncc.MaNhaCC = dkcc.MaNhaCC
													  join MucPhi mp on dkcc.MaMP = mp.MaMP
													  join DongXe dx on dkcc.DongXe = dx.DongXe where (dx.HangXe = 'Toyota' and mp.DonGia = 15.000) or (dx.HangXe = 'KIA' and mp.DonGia = 20.000)
--Câu 5: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung
--cấp và giảm dần theo mã số thuế
SELECT * FROM NhaCungCap ncc order by ncc.TenNhaCC asc , ncc.MaNhaCC desc
--Câu 6: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
--yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
--cung cấp là “20/11/2015”
SELECT ncc.MaNhaCC , ncc.TenNhaCC FROM NhaCungCap ncc join DangKyCungCap dkcc on ncc.MaNhaCC = dkcc.MaNhaCC where dkcc.NgayBatDauCungCap = '2015-20-15'
--Câu 7: Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe
--chỉ được liệt kê một lần
SELECT DISTINCT dx.HangXe FROM DongXe dx order by dx.HangXe
--Câu 8: Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia,
--HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương
--tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương
--tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra
SELECT dkcc.MaDKCC, ncc.MaNhaCC , ncc.TenNhaCC , ncc.DiaChi , ncc.MaSoThue, dv.TenTenLoai , mp.DonGia, dx.HangXe, dkcc.NgayBatDauCungCap , dkcc.NgayKetThucCungCap
FROM NhaCungCap ncc join DangKyCungCap dkcc on ncc.MaNhaCC = dkcc.MaNhaCC join DongXe dx on dkcc.DongXe = dx.DongXe
join MucPhi mp on dkcc.MaMP = mp.MaMP
join LoaiDichVu dv on dkcc.MaLoaiFV = dv.MaLoaiFV
--Câu 9: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện
--thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”
SELECT ncc.MaNhaCC , ncc.TenNhaCC FROM NhaCungCap ncc where ncc.MaNhaCC in ( select dkcc.MaNhaCC from DangKyCungCap dkcc
where dkcc.DongXe = 'Hiace' or dkcc.DongXe = 'Cerato' )
--Câu 10: Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp
--phương tiện lần nào cả
SELECT ncc.MaNhaCC , ncc.TenNhaCC FROM NhaCungCap ncc where not exists(select * from DangKyCungCap dkcc where ncc.MaNhaCC = dkcc.MaNhaCC)