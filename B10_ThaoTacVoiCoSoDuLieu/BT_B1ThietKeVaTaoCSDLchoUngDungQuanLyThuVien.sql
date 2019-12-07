drop database if exists thuvien;
create database thuvien;
use thuvien;
create table loaisach (
IDloaisach int auto_increment not null primary key,
tenloaisach nvarchar(50) not null);
create table thesinhvien(
IDthesinhvien int auto_increment not null primary key,
tensinhvien nvarchar(50) not null,
NgaySinh date not null,
SoCMTND int not null unique,
SDT int,
Email varchar(50),
DiaChi nvarchar(50)
);
create table sach(
IDsach int auto_increment not null primary key,
tensach nvarchar(50),
nhasanxuat nvarchar(50),
IDloaisach int,
constraint fk_IDloaisach foreign key(IDloaisach) references loaisach(IDloaisach)
);
create table themuon(
IDthesinhvien int,
IDsach int,
ngaymuon date ,
ngaytra date,
constraint pk_themuon primary key(IDthesinhvien,IDsach),
constraint fk_IDthesinhvien foreign key(IDthesinhvien) references thesinhvien(IDthesinhvien),
constraint fk_IDsach foreign key(IDsach) references sach(IDsach)
);
insert into loaisach(tenloaisach) values('sach lap trinh'),('sach thieu nhi'),('sach toan'),('sach hoa'),('sach van');
insert into thesinhvien(tensinhvien, NgaySinh, SoCMTND, SDT,Email,DiaChi)
 values('Nguyen A','1990-02-12',01252122,0134532112,'assdd@gmail.com','Da Nang'),
 ('Tran B', '1992-04-30', 012332332,043332212,'kjkv@gmail.com','Quang Binh'),
('Tran B', '1992-04-30', 01232132,043334321,'kjkv@gmail.com','Hue'),
('Tran B', '1992-04-30', 012123232,043353113,'kjkv@gmail.com','Vinh'),
('Tran B', '1992-04-30', 012312321,02131112,'kjkv@gmail.com','Quang Nam'),
('Tran B', '1992-04-30', 0123123131,01313112,'kjkv@gmail.com','Quang Tri');
insert into sach(tensach,nhasanxuat,IDloaisach)
values ('LTCB','NB',1),('JAVA','LT',1),('Doremon','ND',2),('TNC','QG',3),('NV9','QG','5'),('SQL','CG','1'),('JavaScript','LT','1'),('Dragon','ND','2'),('Hoa8','QG','4');
 insert into themuon(IDthesinhvien,IDsach,ngaymuon,ngaytra)
 values(1,2,'2019-11-01','2019-11-02'),
 (1,3,'2019-11-02','2019-11-08'),
 (2,4,'2019-11-04','2019-11-02'),
 (4,5,'2019-11-02','2019-11-09'),
 (2,6,'2019-11-06','2019-11-02'),
 (2,3,'2019-11-01','2019-11-10'),
 (2,5,'2019-11-01','2019-11-02'),
 (1,5,'2019-11-02','2019-11-11');

 select * from sach;
select * from sach where IDloaisach = 1;
select * from sach inner join themuon on themuon.IDsach = sach.IDsach;

select * from thesinhvien inner join themuon on thesinhvien.IDthesinhvien = themuon.IDthesinhvien
group by themuon.idthesinhvien
having ngaytra > now();