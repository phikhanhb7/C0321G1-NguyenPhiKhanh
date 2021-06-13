drop database if exists QuanLyBanHang ;
create database if not exists QuanLyBanHang ;
use QuanLyBanHang ;

create table Customer(
cid int primary key,
cname varchar(45),
cage int
);

create table oder(
oid int auto_increment primary key ,
cid int references Customer(cid),
odate date ,
ototalprice double
);

create table product(
pid int primary key ,
pname varchar(45),
pprice double
);

create table oderdetail(
pid int references product(pid),
oid int references oder(oid),
odqty varchar(45)
);