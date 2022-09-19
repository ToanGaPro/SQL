CREATE DATABASE QLKhachHag;
Use QLKhachHag;
CREATE TABLE KhachHang(
IdKhachHang int primary key,
TenKH nvarchar(50)
);
CREATE TABLE DatHang(
IdDatHang int primary key,
IdKhachHang int foreign key references KhachHang,
TenSP nvarchar(50),
NgayXL datetime
);
insert into KhachHang values
('1', N'Nguyễn Tuấn Anh'),
('2', N'Trần Văn Biên'),
('3', N'Nguyễn Đức Dũng'),
('4', N'Trần Hiếu'),
('5', N'Lê Đức Chiến'),
('6', N'Trần Hài Hả');
insert into DatHang values
('1','2','Iphone 7','2002/12/01'),
('2','3','Sumsung Note 5','2002/03/01'),
('3','2','Ipad 2 mini','2002/08/03'),
('4','1','Lenovo','2002/05/12'),
('5','4','Asus','2002/07/04'),
('6','7','Mac Pro','2002/03/08'),
('7','8','Sony Vio','2002/05/02');
Select * from DatHang
Select * from KhachHang
--Truy vấn dữ liệu sử dụng câu lệnh Select cùng với sử dụng JOIN
--Kế quả của câu truy vấn phải được hiển thị theo định dạng sau:
--IdDatHang	TenKH	TenSP	NgayXL
SELECT dh.IdDatHang , kh.TenKH , dh.TenSP , dh.NgayXL FROM KhachHang kh join DatHang dh on kh.IdKhachHang = dh.IdKhachHang
--Sử dụng câu lệnh “Select * Into…From” để tạo một bảng mới đặt tên là “XuLyDH” và chứa dữ liệu trong bảng này với dữ liệu lấy từ bảng DatHang thoả mãn điều kiện NgayXL trước ngày ‘2002-10-05’. (sử dụng QE)
Select dh.NgayXL into XuLyDH from DatHang dh where dh.NgayXL > '2002/10/5'
--Sử dụng câu lệnh “Insert Into…Select” để lấy 1 bản ghi TOP từ “DatHang” và chèn vào bảng “XuLyDH”
insert into XuLyDH Select TOP 1 * FROM DatHang
--Delete một bản ghi từ bảng XyLyDH thoả mãn điều kiện NgayXL là ‘2002/07/04’. (sử dụng QE)
Delete from DatHang  where NgayXL = '2002/07/04'
--Sử dụng Union để hợp dữ liệu từ hai tập dữ liệu DatHang và XuLyDH thành một tập dữ liệu. (sử dụng QA)
--Select * From DatHang Union 
--Áp dụng Constraints (sử dụng SSM hoặc QE)
--Áp dụng Primary Constraint cho các cột “Id” trong các bảng trên.
--Áp dụng Foreign Key Constraint cho bảng DatHang.
--Áp dụng Check Constraint để cột NgayXL có dữ liệu ngày trong khoảng ‘1970-01-01’ – ‘2050-01-01’ và thử chèn một bản ghi không hợp lệ với điều kiện trên để xem SQL có chạy không.
--Áp dụng Unique Constraint cho cột TenKH của bảng KhachHang
--Back up cơ sở dữ liệu và Restore tới một chỗ khác (có thể trên một server khác hoặc trên cùng một server nhưng với tên CSDL khác) (sử dụng SSM hoặc QE)
--Truncate và Drop bảng XuLyDH (sử dụng QE)