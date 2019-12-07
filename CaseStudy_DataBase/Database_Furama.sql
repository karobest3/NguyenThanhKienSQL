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

select* from nhanvien
where (HoTen like 'H%' or HoTen like 'T%' or HoTen like 'K%') AND length(HoTen)<=15;

select* from khachhang
where ( DiaChi = 'Đà Nẵng' or DiaChi = 'Quảng Trị') and
 (year(current_date()) - year(NgaySinh) >= 18 and (year(current_date()) - year(NgaySinh)) <= 50);

 select khachhang.HoTen,khachhang.IDLoaiKhach, count(khachhang.HoTen) as solandatphong
 from khachhang
 inner join hopdong on khachhang.IDKhachHang = hopdong.IDKhachHang
 where khachhang.IDLoaiKhach = 1
 group by khachhang.HoTen
 order by solandatphong ASC;

 select khachhang.IDKhachHang, Hoten, TenLoaiKhach,hopdong.IDHopDong,TenDichVu,NgayLamHopDong,NgayKetThuc, sum(dichvu.chiphithue+hopdongchitiet.soluong*dichvudikem.gia) as tongtien
 from loaikhach
 inner join khachhang on loaikhach.IDLoaiKhach = khachhang.IDLoaiKhach
 left join hopdong on khachhang.IDKhachHang = hopdong.IDKhachHang
 left join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
 left join loaidichvu on dichvu.IDLoaiDichVu = loaidichvu.IDLoaiDichVu
 left join hopdongchitiet on hopdong.IDHopDong = hopdongchitiet.IDHopDong
 left join dichvudikem on hopdongchitiet.IDDichVuDiKem = dichvudikem.IDDichVuDiKem
 group by khachhang.IDKhachHang
 order by khachhang.IDKhachHang;

 select dichvu.IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu
 from loaidichvu
 inner join dichvu on loaidichvu.IDLoaiDichVu = dichvu.IDLoaiDichVu
 inner join hopdong on dichvu.IDDichVu = hopdong.IDDichVu
 where not exists(
 select hopdong.NgayLamHopDong from hopdong
 where (hopdong.NgayLamHopDong between '2019-01-01' and '2019-03-01') and dichvu.IDDichVu = hopdong.IDDichVu)
 group by dichvu.IDDichVu;

 select dichvu.IDdichvu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu
  from loaidichvu
 inner join dichvu on loaidichvu.IDLoaiDichVu = dichvu.IDLoaiDichVu
 inner join hopdong on hopdong.IDDichVu = dichvu.IDDichVu
 where exists (
 select hopdong.NgayLamHopDong from hopdong
where (year(hopdong.NgayLamHopDong) = '2018' and hopdong.IDDichVu = dichvu.IDDichVu)
 and not exists ( select hopdong.NgayLamHopDong from hopdong where year(hopdong.NgayLamHopDong) ='2019' and hopdong.IDDichVu = dichvu.IDDichVu )
 )
 group by TenDichVu;

-- task8
-- c1
select distinct HoTen from khachhang;

 -- C2

 select HoTen from khachhang
 group by HoTen;

-- c3

select HoTen from khachhang
union
select HoTen from khachhang;

 -- task 9

 select meses.month , count(month(NgayLamHopDong)) as sokhachhangdangki
 FROM
            (
                      SELECT 1 AS MONTH
                       UNION SELECT 2 AS MONTH
                       UNION SELECT 3 AS MONTH
                       UNION SELECT 4 AS MONTH
                       UNION SELECT 5 AS MONTH
                       UNION SELECT 6 AS MONTH
                       UNION SELECT 7 AS MONTH
                       UNION SELECT 8 AS MONTH
                       UNION SELECT 9 AS MONTH
                       UNION SELECT 10 AS MONTH
                       UNION SELECT 11 AS MONTH
                       UNION SELECT 12 AS MONTH
            ) as meses
 left join hopdong on month(hopdong.NgayLamHopDong) = meses.month
  left join khachhang on khachhang.IDKhachHang = hopdong.IDKhachHang
 where year(hopdong.NgayLamHopDong) = '2019' or year(hopdong.NgayLamHopDong) is null or month(hopdong.NgayLamHopDong) is null
 group by meses.month
 order by meses.month;
  -- task 10

 select hopdong.IDHopDong, NgayLamHopDong, NgayKetThuc, TienDatCoc, count(IDhopdongchitiet) as SoLuongDichVuDiKem
 from dichvudikem
 inner join hopdongchitiet on hopdongchitiet.IDDichVuDiKem = dichvudikem.IDDichVuDiKem
 inner join hopdong on hopdong.IDHopDong = hopdongchitiet.IDHopDong
group by hopdong.IDHopDong
order by hopdong.IDHopDong;
 -- task 11

 select dichvudikem.IDDichVuDiKem , tendichvudikem, khachhang.HoTen
 from loaikhach
 inner join khachhang on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach
 inner join hopdong on hopdong.IDKhachHang = khachhang.IDKhachHang
 inner join hopdongchitiet on hopdongchitiet.IDHopDong = hopdong.IDHopDong
 inner join dichvudikem on dichvudikem.IDDichVuDiKem = hopdongchitiet.IDDichVuDiKem
 where khachhang.IDLoaiKhach = 1 and (khachhang.DiaChi = 'Vinh' or khachhang.DiaChi = 'Quảng Ngãi');

  -- task 12
  select * from hopdong;
  select hopdong.IDHopDong, khachhang.Hoten, nhanvien.Hoten, khachhang.SDT, TenDichVu, TienDatCoc, count(IDhopdongchitiet) as SoLuongDichVuDiKem
  from  khachhang
 inner join hopdong on khachhang.IDKhachHang = hopdong.IDKhachHang
 inner join nhanvien on nhanvien.IDNhanVien = hopdong.IdNhanVien
 inner join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
 inner join loaidichvu on dichvu.IDLoaiDichVu = loaidichvu.IDLoaiDichVu
 inner join hopdongchitiet on hopdong.IDHopDong = hopdongchitiet.IDHopDong
 inner join dichvudikem on hopdongchitiet.IDDichVuDiKem = dichvudikem.IDDichVuDiKem
 where exists(
 select hopdong.ngaylamhopdong from hopdong where((ngaylamhopdong between '2019-10-01' and '2019-12-31') and hopdong.IDDichVu = dichvu.IDDichVu))
 and not exists( select hopdong.ngaylamhopdong from hopdong where(ngaylamhopdong between '2019-01-01' and '2019-06-30') and hopdong.IDDichVu = dichvu.IDDichVu)
 ;

  -- task 13
 --  soluong.IDDichVuDiKem , tendichvudikem, max(soluong.soluongdichvudikem) as dichvuduocsudugnhieunhat
   select *
   from (
   select DichVuDiKem.IDDichVuDiKem , tendichvudikem, hopdongchitiet.IDhopdongchitiet,count(hopdongchitiet.IDhopdongchitiet) as soluongdichvudikem
   from hopdongchitiet
 inner join DichVuDiKem on DichVuDiKem.IDDichVuDiKem = hopdongchitiet.IDDichVuDiKem
inner join hopdong on hopdong.IDhopdong= hopdongchitiet.IDhopdong
inner join khachhang on khachhang.IDkhachhang = hopdong.IDkhachhang
   group by tendichvudikem
   ) as soluong
  where soluong.soluongdichvudikem =  (select max(soluong.soluongdichvudikem) as dichvuduocsudugnhieunhat
   from (
   select DichVuDiKem.IDDichVuDiKem , tendichvudikem, hopdongchitiet.IDhopdongchitiet,count(hopdongchitiet.IDhopdongchitiet) as soluongdichvudikem
   from hopdongchitiet
 inner join DichVuDiKem on DichVuDiKem.IDDichVuDiKem = hopdongchitiet.IDDichVuDiKem
inner join hopdong on hopdong.IDhopdong= hopdongchitiet.IDhopdong
inner join khachhang on khachhang.IDkhachhang = hopdong.IDkhachhang
   group by tendichvudikem
   ) as soluong);

   -- task14

   select hopdong.IDHopDong, TenLoaiDichVu, TenDichVuDiKem, count(IDhopdongchitiet) as SoLanSuDung
    from hopdongchitiet
 inner join DichVuDiKem on DichVuDiKem.IDDichVuDiKem = hopdongchitiet.IDDichVuDiKem
inner join hopdong on hopdong.IDhopdong= hopdongchitiet.IDhopdong
inner join khachhang on khachhang.IDkhachhang = hopdong.IDkhachhang
inner join dichvu on dichvu.IDdichvu = hopdong.IDdichvu
inner join loaidichvu on loaidichvu.IDloaidichvu = dichvu.IDloaidichvu
group by tendichvudikem
having count(IDhopdongchitiet) = 1;

 -- task 15

 select nhanvien.IDNhanVien, HoTen, TrinhDo, TenBoPhan, SDT, DiaChi
 from trinhdo
 inner join nhanvien on nhanvien.IDtrinhdo = trinhdo.IDtrinhdo
 inner join bophan on bophan.IDbophan = nhanvien.IDbophan
 inner join vitri on vitri.IDvitri = nhanvien.IDvitri
 inner join hopdong on hopdong.IDnhanvien = nhanvien.IDnhanvien
 where year(ngaylamhopdong) between '2018' and '2019'
 group by nhanvien.Hoten
 having count(hopdong.IDhopdong)<=3
 order by nhanvien.IDnhanvien;

 -- task 16
  select * from hopdong;
  select * from nhanvien;
  SET SQL_SAFE_UPDATES = 0;
  delete nhanvien
 from nhanvien
inner join hopdong on hopdong.IDnhanvien = nhanvien.IDnhanvien
 where year(ngaylamhopdong) not between '2017' and '2019';
 SET SQL_SAFE_UPDATES = 1;

--  -- task 17
  create temporary table soluong (
  select sum(dichvu.chiphithue+hopdongchitiet.soluong*dichvudikem.gia) as tongtien
 from loaikhach
 inner join khachhang on loaikhach.IDLoaiKhach = khachhang.IDLoaiKhach
 inner join hopdong on khachhang.IDKhachHang = hopdong.IDKhachHang
 inner join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
 inner join loaidichvu on dichvu.IDLoaiDichVu = loaidichvu.IDLoaiDichVu
 inner join hopdongchitiet on hopdong.IDHopDong = hopdongchitiet.IDHopDong
 inner join dichvudikem on hopdongchitiet.IDDichVuDiKem = dichvudikem.IDDichVuDiKem
 where year(ngaylamhopdong) = '2019'
 group by khachhang.Hoten
 having sum(dichvu.chiphithue+hopdongchitiet.soluong*dichvudikem.gia) > 10000000.00
  );
  select * from soluong;
update khachhang set khachhang.IDloaikhach = 1
where khachhang.IDloaikhach = 2 and exists ( select * from soluong);
 drop table soluong;
-- task 18
 SET SQL_SAFE_UPDATES = 0;
delete khachhang
from khachhang
inner join hopdong on hopdong.IDkhachhang = khachhang.IDkhachhang
where ngaylamhopdong < '2016-01-01' ;
SET SQL_SAFE_UPDATES = 1;

 -- task 19

 create temporary table solandatdvdk(
  select count(IDhopdongchitiet) as SoLanSuDung
    from hopdongchitiet
 inner join DichVuDiKem on DichVuDiKem.IDDichVuDiKem = hopdongchitiet.IDDichVuDiKem
inner join hopdong on hopdong.IDhopdong= hopdongchitiet.IDhopdong
inner join khachhang on khachhang.IDkhachhang = hopdong.IDkhachhang
inner join dichvu on dichvu.IDdichvu = hopdong.IDdichvu
inner join loaidichvu on loaidichvu.IDloaidichvu = dichvu.IDloaidichvu
group by tendichvudikem
having count(IDhopdongchitiet) >= 10
 );
update dichvudikem set dichvudikem.gia = dichvudikem.gia*2
where exists (select * from  solandatdvdk);
 drop table solandatdvdk;

-- task 20

 select nhanvien.IDnhanvien, nhanvien.Hoten, nhanvien.SDT, nhanvien.email, nhanvien.diachi,"nhan vien" as Fromtable
 from nhanvien
union all
 select khachhang.IDkhachhang, khachhang.Hoten, khachhang.SDT, khachhang.email, khachhang.diachi,"khach hang" as Fromtable
 from khachhang ;