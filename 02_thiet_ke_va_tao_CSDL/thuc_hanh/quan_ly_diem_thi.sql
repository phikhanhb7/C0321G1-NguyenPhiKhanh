 create database QuanLyDiemThi;
 use QuanLyDiemThi;
 create table HocSinh(
 MaHS int primary key,
 TenHS varchar(50),
 NgaySinh date,
 Lop int ,
 GT varchar(50)
 );
 
create table MonHoc(
MaMH int primary key,
TenMH varchar (255)
);

create table BangDiem (
MaMH int,
MaHS int ,
DiemThi int,
NgayKT date,
primary key(MaHS,MaMH),
foreign key (MaHS) references HocSinh(MaHS),
foreign key (MaMH) references MonHoc(MaMH)
);

create table GiaoVien(
MaGV int primary key ,
TenGV varchar(255),
SDT varchar(10)
);

alter table MonHoc add MaGV int ;
alter table MonHoc add foreign key (MaGV) references GiaoVien(MaGV);