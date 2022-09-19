--DẠNG 1: CÂU LỆNH TRUY VẤN CÓ ĐIỀU KIỆN 
--Bài số 1: Câu lệnh SQL không kết nối
--1. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh 
--(dd/mm/yyyy), GioiTinh (Nam, Nữ) , Namsinh của những sinh viên có họ
--không bắt đầu bằng chữ N,L,T.
CREATE DATABASE dang1;
use dang1;
CREATE TABLE SinhVien(
MaSV nvarchar(50) primary key,
HoTen nvarchar(50),
MaLop nvarchar(50),
NgaySinh datetime,
GioiTinh int,
);
Insert into SinhVien values
('SV01',N'Nguyễn Văn A','L01','2001/09/12','1'),
('SV02',N'Trần Văn B','L02','2002/09/12','0'),
('SV03',N'Đỗ Văn G','L03','2003/09/12','1'),
('SV04',N'Lặng Thị C','L04','2004/09/12','0');
Select MaSV , HoTen , MaLop , NgaySinh ,CASE GioiTinh when 1 then N'Nam' else N'Nữ' END AS
GioiTinh, YEAR(NgaySinh) From SinhVien where HoTen not like N'[NLT]%'
--2. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh 
--(dd/mm/yyyy), GioiTinh (Nam, Nữ) , Namsinh của những sinh viên nam 
--học lớp CT11. 
Select MaSV , HoTen , MaLop , NgaySinh, Case GioiTinh when 1 then N'Nam' else N'Nữ'END AS GioiTinh , YEAR(NgaySinh)
from SinhVien where GioiTinh = 1 and MaLop = 'L01'
--3. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh 
--(dd/mm/yyyy), GioiTinh (Nam, Nữ) của những sinh viên học lớp 
--CT11,CT12,CT13. 
--4. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh 
--(dd/mm/yyyy), GioiTinh (Nam, Nữ), Tuổi của những sinh viên có tuổi từ
--19-21.