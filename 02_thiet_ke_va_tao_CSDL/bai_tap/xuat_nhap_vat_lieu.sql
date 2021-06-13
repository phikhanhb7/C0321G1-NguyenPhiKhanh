drop database if exists quan_ly_xuat_nhap ;
create database if not exists quan_ly_xuat_nhap;
use quan_ly_xuat_nhap ;

create table phieu_xuat(
so_px int primary key,
ngay_xuat date
);

create table vat_tu(
ma_vat_tu int primary key ,
ten_vat_tu varchar(45)

);

create table chi_tiet_phieu_suat(
so_px int ,
ma_vat_tu int ,
primary key(so_px,ma_vat_tu),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
dg_xuat varchar(45),
sl_xuat varchar(45)
);

create table phieu_nhap(
so_pn int primary key,
ngay_nhap date
);

create table chi_tiet_phieu_nhap(
ma_vat_tu int,
so_pn int,
primary key(ma_vat_tu, so_pn),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_pn) references phieu_nhap(so_pn),
dg_nhap varchar(45),
ngay_nhap date
);

create table don_hang(
so_dh int primary key ,
ngay_dh date

);

create table chi_tiet_don_dat_hang(
ma_vat_tu int ,
so_dh int ,
primary key (ma_vat_tu,so_dh),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_dh) references don_hang(so_dh)
);

create table so_dt(
id_so_dt int primary key ,
so_dt varchar(10)
);


create table nha_cc(
ma_nha_cc int primary key ,
ten_nha_cc varchar(45),
dia_chi varchar(45),
id_so_dt int,
foreign key (id_so_dt) references so_dt(id_so_dt),
so_dh int,
foreign key (so_dh) references don_hang(so_dh)
);


