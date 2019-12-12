drop database if exists caseStudyDataBase;
create database caseStudyDataBase;
use caseStudyDataBase;
create table Vitri(
IDVitri int unique auto_increment not null primary key,
TenViTri nvarchar(45) not null
);
create table TrinhDo(
IDTrinhDo int unique auto_increment not null primary key,
TrinhDo nvarchar(45) not null
);
create table BoPhan(
IDBoPhan int unique auto_increment not null primary key,
TenBoPhan nvarchar(45) not null
);
create table LoaiKhach(
IDLoaiKhach int unique auto_increment not null primary key,
TenLoaiKhach nvarchar(45) not null
);
create table KieuThue(
IDKieuThue int unique auto_increment not null primary key,
TenKieuThue nvarchar(45) not null,
Gia decimal
);
create table LoaiDichVu(
IDLoaiDichVu int unique auto_increment not null primary key,
TenLoaiDichVu nvarchar(45) not null
);
create table DichVuDiKem(
IDDichVuDiKem int unique auto_increment not null primary key,
TenDichVuDiKem nvarchar(45) not null,
Gia decimal,
DonVi int,
TrangThaiKhaDung nvarchar(45)
);
create table NhanVien(
IDNhanVien int unique auto_increment not null primary key,
HoTen nvarchar(50) not null,
NgaySinh date not null,
SoCMTND int not null unique,
Luong decimal,
SDT int,
Email varchar(50),
DiaChi nvarchar(50),
IdVitri int,
IDTrinhDo int,
IDBoPhan int,
constraint IDVitri_fk foreign key(IdVitri) references Vitri(IDVitri)on update cascade on delete cascade ,
constraint IDTrinhDo_fk foreign key(IDTrinhDo) references TrinhDo(IDTrinhDo) on update cascade on delete cascade,
constraint IDBoPhan_fk foreign key(IDBoPhan) references BoPhan(IDBoPhan)on update cascade on delete cascade
);
create table KhachHang(
IDKhachHang int unique auto_increment not null primary key,
HoTen nvarchar(50) not null,
NgaySinh date not null,
SoCMTND int not null unique,
SDT int,
Email varchar(50),
DiaChi nvarchar(50),
IDLoaiKhach int,
constraint IDLoaiKhach_fk foreign key(IDLoaiKhach) references LoaiKhach(IDLoaiKhach) on update cascade on delete cascade
);
create table DichVu(
IDDichVu int unique auto_increment not null primary key,
TenDichVu nvarchar(50) not null,
DienTich double not null,
SoTang tinyint ,
SoNguoiToiDa tinyint,
ChiPhiThue decimal,
TrangThai varchar(50) ,
IDKieuThue int,
IDLoaiDichVu int,
constraint IDKieuThue_fk foreign key(IDKieuThue) references KieuThue(IDKieuThue) on update cascade on delete cascade,
constraint IDLoaiDichVu_fk foreign key(IDLoaiDichVu) references LoaiDichVu(IDLoaiDichVu) on update cascade on delete cascade
);
create table HopDong(
IDHopDong int unique auto_increment not null primary key,
NgayLamHopDong date not null,
NgayKetThuc date not null,
TienDatCoc decimal,
TongTien decimal,
IdNhanVien int,
IDKhachHang int,
IDDichVu int,
constraint IdNhanVien_fk foreign key(IdNhanVien) references NhanVien(IdNhanVien) on update cascade on delete cascade,
constraint IDKhachHang_fk foreign key(IDKhachHang) references KhachHang(IDKhachHang) on update cascade on delete cascade,
constraint IDDichVu_fk foreign key(IDDichVu) references DichVu(IDDichVu) on update cascade on delete cascade
);
create table HopDongChiTiet(
IDHopDongChiTiet int not null auto_increment ,
SoLuong int,
IDHopDong int,
IDDichVuDiKem int,
constraint IDHopDongChiTiet primary key(IDHopDongChiTiet),
constraint IDHopDong_fk foreign key(IDHopDong) references HopDong(IDHopDong) on update cascade on delete cascade,
constraint IDDichVuDiKem_fk foreign key(IDDichVuDiKem) references DichVuDiKem(IDDichVuDiKem) on update cascade on delete cascade
);
insert into bophan(tenbophan) values ('Buồng phòng'),('Lễ tân'),('Nhà hàng'),('An ninhh'),('Văn phòng');
insert into vitri(tenvitri) values ('Giam Đốc'),('Trưởng Phòng'),('Quản Lý'),('Nhan Vien');
insert into trinhdo(trinhdo) values ('Cao học'),('Đại Học'),('Cao đẳng'),('Trung cấp');
insert into NhanVien(HoTen, NgaySinh, SoCMTND, Luong, SDT, Email, DiaChi, IDVitri, IDTrinhDo, IDBoPhan)
values('Hoàng Văn A','1990-01-24', 012312345, 7000000.00, 076121212, 'abc1@gamil.com', 'Quảng Trị',4 ,3 ,2 ),
('Đặng Văn B', '1970-07-12', 012312346, 20000000.00, 0932121234, 'abc2@gamil.com', 'Đà Nẵng',1 ,1 ,5 ),
('Trần C', '1991-02-14', 012312347, 9000000.00, 033121256, 'abc3@gamil.com', 'Quảng Bình',2 ,2 ,3),
('Khánh Trang', '1994-10-12', 012312348, 7000000.00, 044121278, 'Trang@gamil.com', 'Quảng Trị',4 ,3 ,1),
('Nguyễn Thị Trang', '1992-11-11', 012312398, 15000000.00, 0231213412, 'ab23@gamil.com', 'Đà Nẵng',3 ,1 ,2),
('Hoàng Thị Ngọc Quỳnh', '1994-08-06', 012312432, 15000000.00, 012123434, 'abewq4@gamil.com', 'Huế',2 ,2 ,5),
('Trần Thị Thu Út', '1980-06-19', 012312567, 9000000.00, 02324356, 'abqwe@gamil.com', 'Đà Nẵng',3 ,2 ,3),
('Lê Văn C', '1982-05-21', 012845743, 7000000.00, 0821212345, 'abqq223@gamil.com', 'Quảng Nam',4 ,2 ,2),
('Hoàng Ngọc G', '1981-04-14', 012324183, 15000000.00, 094121278, 'abcwqe224@gamil.com', 'Hà Nội',2 ,3 ,4),
('Trần Long Hoàng Ngọc', '1979-02-15', 012324179, 15000000.00, 0541212986, 'abdsad4@gamil.com', 'Quảng Trị',2 ,1 ,5);
insert into loaikhach(tenloaikhach)
values ('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');
insert into khachhang(HoTen, NgaySinh, SoCMTND, SDT, Email, DiaChi,IDloaiKhach)
values ('Hoàng Long', '1970-03-15', 098765432, 023567344, 'zxcs@gmail.com', 'Quảng Trị', 1),
('Trần Văn A', '1968-09-15', 098712322, 023567865, 'zxwqe232cs@gmail.com', 'Đà Nẵng', 1),
('Nguyễn Ngọc B', '1990-07-15', 06755432, 023567432, 'zx23cs@gmail.com', 'Quảng Trị', 3),
('Lê Văn C', '1969-06-15', 098734534, 023567423, '5asd6@gmail.com', 'Quảng Trị', 5),
('Nguyễn Hà', '1983-05-15', 09886652, 023549676, 'zxmkucs@gmail.com', 'Đà Nẵng', 2),
('Hoàng Văn C', '1985-11-25', 094355432, 023565624, 'zxqwecs@gmail.com', 'Vinh', 1),
('Trần B', '1995-04-25', 098765232, 023567631, 'zxcs@gmail.com', 'Quảng Ngãi', 1),
('Đoàn A', '1993-06-24', 098765412, 023567231, 'fdsd@gmail.com', 'Quảng Trị', 2),
('Trần Văn A', '1982-01-23', 098767332, 023847324, 'zghghgxcs@gmail.com', 'Đà Nẵng', 1),
('Lê Văn K', '1965-02-04', 097123132, 098367344, 'zxwewcs@gmail.com', 'Quảng Ngãi', 2);
insert into kieuthue(TenKieuThue,Gia) values ('Năm',100000000.00),
('Tháng',15000000.00),('Ngày',1000000.00),('Gio',200000.00);
insert into loaidichvu(TenLoaiDichVu) values ('Villa'),('House'),('Room');
insert into dichvu(TenDichVu,DienTich,SoTang,SoNguoiToiDa,ChiPhiThue,IDKieuThue,IDLoaiDichVu)
values('Villa1',100.00,3,3,1000000.00,2,1),
('House1', 50.00, 2 , 3, 750000.00, 3, 2),
('House2', 60.00, 2 , 5, 850000.00, 4, 2),
('Room1', 30.00, 1 , 3, 300000.00, 3, 3),
('Villa2', 150.00, 4 , 5, 1500000.00, 3, 1),
('House3', 50.00, 1 , 3, 5000000.00, 2, 2),
('Romm2', 25.00, 1 , 2, 1500000.00, 4, 3),
('Villa3', 100.00, 2 , 2, 6000000.00, 2, 1),
('Room3', 20.00, 2 , 1, 1000000.00, 4, 3);
insert into dichvudikem(TenDichVuDiKem,Gia,DonVi,TrangThaiKhaDung)
values('Massage',500000.00,1,'Tốt'),
('Car',400000.00,1,'Tốt'),
('Thức ăn',150000,2,'Tốt'),
('Nước uống',100000,2,'Tốt'),
('Karaoke',5000000,5,'Tốt');
insert into hopdong(NgayLamHopDong,NgayKetThuc,TienDatCoc,IDKhachHang,IDDichVu,IDNhanVien)
values('2019-09-24','2019-10-01','5000000.00',1,3,1),
('2019-10-24','2019-10-30',2000000.00, 1, 2,1),
('2019-01-31','2019-02-24',10000000.00, 3,3,1),
('2015-05-12','2019-02-20',2000000.00, 2,6,1),
('2019-04-12','2019-04-15', 1000000.00, 5,4,5),
('2016-01-12','2019-01-15',1000000.00, 1,1,2),
('2019-06-20','2019-03-01',2000000.00,7,7,8),
('2015-08-15','2018-04-12',1000000.00,8,4,7),
('2018-08-15','2018-04-12',1000000.00,9,1,9),
('2016-08-15','2018-04-12',1000000.00,10,2,10)
;
insert into hopdongchitiet(SoLuong,IDHopDong,IDDichVuDiKem)
values (3,1,3),(4,6,3),(2,3,2),(5,4,4),(2,1,1),(2,2,1),(2,7,2),(1,10,3),(2,9,3),(3,5,1),(4,8,1);

﻿-- yêu cầu 2
-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên 
--bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.


select * from nhanvien where (ho_va_ten like 'h%' or ho_va_ten like 't%'
 or ho_va_ten like 'k%')  and length(ho_va_ten)<15; 

 -- yêu cầu 3 
 
 -- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
 -- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khachhang where DiaChi in ("Quang Tri","Da Nang") and (curdate()-NgaySinh>(18*30*365) and curdate()-NgaySinh<(50*30*365));

-- yêu cầu 4
-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”
select khachhang.ho_va_ten, count(hopdong.IDDichVu) as so_lan_dat_phong from khachhang inner join hopdong on khachhang.IDKhachHang=hopdong.IDKhachHang
inner join loaikhach on khachhang.IDLoaiKhach=loaikhach.IDLoaiKhach where loaikhach.TenLoaiKhach="Diamond"
group by hopdong.IDKhachHang order by so_lan_dat_phong;

-- yêu cầu 5
-- Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, 
-- NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau: 
-- ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) 
-- cho tất cả các Khách hàng đã từng đặt phỏng. 
-- (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select khachhang.IDKhachHang, khachhang.ho_va_ten, loaikhach.TenLoaiKhach, hopdong.IDHopDong, hopdong.NgayLamHopDong, hopdong.NgayketThuc, hopdong.TongTien,dichvu.TenDichVu
from khachhang left join hopdong on khachhang.IDKhachHang=hopdong.IDKhachHang 
left join loaikhach on khachhang.IDLoaiKhach=loaikhach.IDLoaiKhach
left join dichvu on hopdong.IDDichVu=dichvu.IDDichVu;

-- yêu cầu 6 
-- Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu 
-- của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện
-- đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select dichvu.IDDichVu, dichvu.TenDichVu, dichvu.DienTich, dichvu.ChiPhiThue,loaidichvu.tendichvu from dichvu 
 inner join loaidichvu on dichvu.loaidichvu_id=loaidichvu.id 
 where not exists(select hopdong.IDHopDong from hopdong where (hopdong.NgayLamHopDong between "2018-12-31" and "2019-03-31") AND hopdong.IDDichVu=dichvu.IDDichVu);

-- yêu cầu 7
-- Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, 
-- TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt 
-- phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
select dichvu.IDDichVu, dichvu.TenDichVu, dichvu.DienTich, dichvu.SoNguoiToiDa,dichvu.ChiPhiThue,loaidichvu.tendichvu from dichvu
inner join loaidichvu on dichvu.loaidichvu_id=loaidichvu.id 
where exists(select hopdong.IDHopDong from hopdong where year(hopdong.NgayLamHopDong)='2018' and hopdong.IDDichVu=dichvu.IDDichVu) 
and not exists(select hopdong.IDHopDong from hopdong where year(hopdong.NgayLamHopDong)='2019' and hopdong.IDDichVu=dichvu.IDDichVu);

-- yêu cầu 8
-- Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu 
-- HoThenKhachHang không trùng nhau.
select khachhang.ho_va_ten from khachhang;
select distinct khachhang.ho_va_ten from khachhang;
select distinct khachhang.ho_va_ten from khachhang group by khachhang.ho_va_ten;
select khachhang.ho_va_ten from khachhang union select khachhang.ho_va_ten from khachhang ;

-- yêu cầu 9
-- Thực hiện thống kê doanh thu theo tháng, 
-- nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng 
-- thực hiện đặt phòng.

create temporary table temp(
thang int ,
doanhthu int(255)
);
SELECT temp.thang,temp.doanhthu, case 
when  hopdong.NgayLamHopDong<"2019-02-01" and hopdong.NgayLamHopDong>="2019-01-01"  then (temp.doanhthu=temp.doanhthu+hopdong.TongTien,
temp.thang=1)
when  hopdong.NgayLamHopDong<"2019-03-01" and hopdong.NgayLamHopDong>="2019-02-01"  then temp.doanhthu=temp.doanhthu+hopdong.TongTien
when  hopdong.NgayLamHopDong<"2019-04-01" and hopdong.NgayLamHopDong>="2019-03-01"  then temp.doanhthu=temp.doanhthu+hopdong.TongTien
when  hopdong.NgayLamHopDong<"2019-05-01" and hopdong.NgayLamHopDong>="2019-04-01"  then temp.doanhthu=temp.doanhthu+hopdong.TongTien
when  hopdong.NgayLamHopDong<"2019-06-01" and hopdong.NgayLamHopDong>="2019-05-01"  then temp.doanhthu=temp.doanhthu+hopdong.TongTien

end as doanhthu
from dichvu left join hopdong on dichvu.IDDichVu= hopdong.IDDichVu
inner join temp;

-- yêu cầu 10
-- Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu 
-- Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, 
-- TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet)
select hopdong.IDHopDong,hopdong.NgayLamHopDong, hopdong.NgayketThuc, hopdong.TienDatCoc,count(hopdongchitiet.IDDichVuDiKem) as SoLuongDichVuDiKem
from hopdong inner join hopdongchitiet on hopdong.IDHopDong=hopdongchitiet.IDHopDong group by hopdong.IDHopDong;

-- yêu cầu 11
-- Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có 
-- TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
select distinct dichvudikem.TenDichVuDiKem,dichvudikem.Gia,dichvudikem.DonVi from hopdong 
inner join hopdongchitiet on hopdong.IDHopDong=hopdongchitiet.IDHopDong
inner join dichvudikem on hopdongchitiet.IDDichVuDiKem=dichvudikem.IDDichVuDiKem
inner join khachhang on khachhang.IDKhachHang=hopdong.IDKhachHang 
inner join loaikhach on khachhang.IDLoaiKhach=loaikhach.IDLoaiKhach
where loaikhach.TenLoaiKhach="Diamond" and (khachhang.DiaChi="Vinh" or khachhang.DiaChi="Quang Ngai"); 


-- yêu cầu 12
-- Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, 
-- TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.

select hopdong.IDHopDong, hopdong.TongTien,hopdong.TienDatCoc, nhanvien.ho_va_ten, khachhang.ho_va_ten,khachhang.SDT, dichvu.TenDichVu, 
count(hopdongchitiet.IDDichVuDiKem)as so_lan_su_dung
from hopdong inner join nhanvien on hopdong.IDNhanVien=nhanvien.IDNhanVien
inner join khachhang on hopdong.IDKhachHang=khachhang.IDKhachHang
inner join dichvu on hopdong.IDDichVu=dichvu.IDDichVu
inner join hopdongchitiet on hopdong.IDHopDong=hopdongchitiet.IDHopDongChiTiet
where not exists(select hopdong.IDHopDong where hopdong.NgayLamHopDong between "2019-01-01" and "2019-06-31")
and exists(select hopdong.IDHopDong where hopdong.NgayLamHopDong between "2019-09-01" and "2019-12-31")
group by hopdongchitiet.IDHopDong;

-- yêu cầu 13
-- Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng 
-- đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
 
CREATE TEMPORARY TABLE temp
 select dichvudikem.TenDichVuDiKem as ten_dich_vu_di_kem,count(hopdongchitiet.IDDichVuDiKem) as so_lan_su_dung from hopdongchitiet
 inner join dichvudikem on dichvudikem.IDDichVuDiKem=hopdongchitiet.IDDichVuDiKem
group by dichvudikem.TenDichVuDiKem;
select * from temp;

CREATE TEMPORARY TABLE temp1
select max(temp.so_lan_su_dung) as result from temp;

select temp.ten_dich_vu_di_kem, temp.so_lan_su_dung from temp inner join temp1
where temp.so_lan_su_dung=temp1.result;
DROP TEMPORARY TABLE temp;
DROP TEMPORARY TABLE temp1;

-- yêu cầu 14
-- Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
select hopdong.IDHopDong, loaidichvu.tendichvu,dichvudikem.TenDichVuDiKem, count(hopdongchitiet.IDDichVuDiKem) as so_lan_su_dung
from hopdong inner join loaidichvu on loaidichvu.id=hopdong.IDDichVu 
inner join hopdongchitiet on hopdongchitiet.IDHopDong=hopdong.IDHopDong 
inner join dichvudikem on dichvudikem.IDDichVuDIKem=hopdongchitiet.IDDichVuDIKem
group by(dichvudikem.TenDichVuDiKem) having so_lan_su_dung=1;

-- yêu cầu 15
-- Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, 
-- TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.


select nhanvien.IDNhanVien, nhanvien.ho_va_ten,nhanvien.SDT,nhanvien.DiaChi, trinhdo.TrinhDo,bophan.TenBoPhan, count(hopdong.IDNhanVien) as so_luong_hop_dong from nhanvien
inner join trinhdo on nhanvien.IDTrinhDo=trinhdo.IDTrinhDo
inner join bophan on nhanvien.IDBoPhan=bophan.IDBoPhan
inner join hopdong on nhanvien.IDNhanVien=hopdong.IDNhanVien
where hopdong.NgayLamHopDong between "2018-01-01" and "2019-12-31"
group by nhanvien.ho_va_ten
having so_luong_hop_dong<4;

-- yêu cầu 16
-- Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
delete from nhanvien where not exists (select nhanvien.IDNhanVien from hopdong  
where hopdong.NgayLamHopDong between "2017-01-01"and "2019-12-31" and  hopdong.IDNhanVien=nhanvien.IDNhanVien
);

-- yêu cầu 17
-- Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong 
-- năm 2019 là lớn hơn 10.000.000 VNĐ.

update khachhang, (select hopdong.IDKhachHang as id,sum(hopdong.TongTien) as tong_tien from hopdong
where  year(hopdong.NgayLamHopDong)=2019
group by hopdong.IDKhachHang
having tong_tien>10000000) as temp set khachhang.IDLoaiKhach = (select loaikhach.IDLoaiKhach from loaikhach where loaikhach.TenLoaiKhach="Diamond")
 where khachhang.IDLoaiKhach= (select loaikhach.IDLoaiKhach from loaikhach where loaikhach.TenLoaiKhach="Platinium")
 and temp.id= khachhang.IDKhachHang;
 
 -- yêu cầu 18
 -- Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).

 delete khachhang,hopdong,hopdongchitiet from khachhang inner join hopdong on khachhang.IDKhachHang=hopdong.IDKhachHang
 inner join hopdongchitiet on hopdong.IDHopDong=hopdongchitiet.IDHopDong 
 where hopdongchitiet.IDHopDong is null or not exists(select hopdong.IDHopDong where hopdong.NgayLamHopDong>"2016-01-01" and hopdong.IDKhachHang=khachhang.IDKhachHang);

-- yêu cầu 19
-- Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 
-- lên gấp đôi.
update dichvudikem inner join(select dichvudikem.TenDichVuDiKem as ten_dich_vu_di_kem
from hopdongchitiet inner join dichvudikem on dichvudikem.IDDichVuDiKem=hopdongchitiet.IDDichVuDiKem 
group by dichvudikem.IDDichVuDiKem having count(hopdongchitiet.IDDichVuDiKem)>3) as temp set dichvudikem.Gia=dichvudikem.Gia*2 where dichvudikem.TenDichVuDiKem = temp.ten_dich_vu_di_kem;
SET SQL_SAFE_UPDATES = 0;

-- yêu cầu 20
-- Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, 
-- NgaySinh, DiaChi.

select nhanvien.IDNhanVien as ID,nhanvien.ho_va_ten,nhanvien.Email,nhanvien.SDT,nhanvien.NgaySinh,nhanvien.DiaChi, "nhanvien" as FromTable 
from nhanvien 
union all
select khachhang.IDKhachHang as ID,khachhang.ho_va_ten,khachhang.Email,khachhang.SDT,khachhang.NgaySinh,khachhang.DiaChi,"khach hang" as FromTable 
from khachhang;







