drop database if exists quan_ly_furama;
create database if not exists quan_ly_furama;
use quan_ly_furama ;

create table vi_tri(
id_vi_tri int  primary key ,
ten_vi_tri varchar(45)
);

insert into vi_tri
values
(1,'le tan'),
(2,'bao ve'),
(3,' giam doc'),
(4,'phuc vu');

create table trinh_do(
id_trinh_do int  primary key ,
trinh_do varchar(45)
);

insert into trinh_do
values
(1,'cao dang'),
(2,'dai hoc'),
(3,' trung cap'),
(4,'thac sy');

create table bo_phan(
id_bo_phan int  primary key ,
ten_bo_phan varchar(45)
);
insert into bo_phan
values
(1,'nhan su'),
(2,'sale'),
(3,' marketing'),
(4,' tap vu ');

create table nhan_vien(
id_nhan_vien int primary key ,
ho_ten varchar(45) ,
id_vi_tri int references vi_tri(id_vi_tri) on delete cascade on update cascade,
id_trinh_do int references trinh_do(id_trinh_do) on delete cascade on update cascade,
id_bo_phan int references bo_phan(id_bo_phan) on delete cascade on update cascade,
ngay_sinh date ,
so_cmnd varchar(45),
luong varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45)
);

insert into nhan_vien
values
(1,'Nam',1,2,1,'1988-10-21', '0123456987', '40000000','3214568790','nam@gmail.com','Đà Nẵng'),
(2,'Tin',2,3,4,'1998-11-8', '54654654564', '50000000','3214568790','nam@gmail.com','Quảng Trị'),
(3,'Khanh',3,2,2,'1997-6-30', '13212132', '46546','3214568790','nam@gmail.com','Quảng Bình'),
(4,'Dung',2,2,4,'1989-4-12', '465446555', '40000000','3214568790','nam@gmail.com','Nghệ An'),
(5,'Dai',1,2,3,'1988-7-25', '7987897987', '40000000','3214568790','nam@gmail.com','Sài gòn'),
(6,'Hau',2,4,4,'1989-3-31', '46546544', '40000000','3214568790','nam@gmail.com','Hà Nội'),
(7,'Ha',1,4,4,'1986-8-11', '555646789', '40000000','3214568790','nam@gmail.com','Thái bình');

create table loai_khach(
id_loai_khach int primary key ,
ten_loai_khach varchar(45)
);

insert into loai_khach
values
(1,'vip'),
(2,'trung'),
(3,'binh thuong');

create table khach_hang(
id_khach_hang int primary key ,
id_loai_khach int references loai_khach(id_loai_khach),
ho_ten varchar(45) ,
ngay_sinh date ,
so_cmnd varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45)
);

insert into khach_hang
values
(1,1,'Nam', '1999-12-12','132132134','45464646644','nam@gmai.com','Đà Nẵng'),
(2,2,'Tín', '1999-4-4','11454','4444','kf@gmai.com','Quảng Trị'),
(3,3,'Khanh', '1999-5-5','45564564','545454','ds@gmai.com','Huế'),
(4,2,'Đại', '1998-4-6','164164654','454545','d@gmai.com','Hội An');

create table kieu_thue(
id_kieu_thue int primary key ,
ten_kieu_thue varchar(45),
gia int
);

insert into kieu_thue
values
(1,'ngay',40000),
(2,'thang',500000),
(3,'nam',3000000);

create table loai_dich_vu(
id_loai_dich_vu int primary key ,
ten_loai_dich_vu varchar(45)
);
insert into loai_dich_vu
values
(1,'villa'),
(2,'room'),
(3,'house');


create table dich_vu(
id_dich_vu int primary key ,
ten_dich_vu varchar(45),
dien_tich int ,
so_tang int ,
so_nguoi_toi_da int,
chi_phi_thue double,
id_kieu_thue int references kieu_thue(id_kieu_thue),
id_loai_dich_vu int references loai_dich_vu(id_loai_dich_vu),
trang_thai varchar(45)
);
insert into dich_vu
values
(4,'villa 1', 45000,12,24,400000,1,2,'Tốt'),
(5,'room 1', 55000,8,20,200000,3,2,'Trung Bình'),
(6,'house 1', 65000,4,14,200000,1,3,'Rất Tốt');

create table dich_vu_di_kem(
id_dich_vu_di_kem int primary key ,
ten_dich_di_kem varchar(45),
gia int ,
 don_vi int ,
 trang_thai_kha_dung varchar(45)
);
insert into dich_vu_di_kem
values
(1,'Matxa',45000,4,'Tốt'),
(2,'kara',10000,1,'Tốt'),
(3,'Bơi',30000,2,'Rất Tốt');

create table hop_dong(
id_hop_dong int primary key,
id_nhan_vien int references nhan_vien(id_nhan_vien),
id_khach_hang int references khach_hang(id_khach_hang),
id_dich_vu int references dich_vu(id_dich_vu),
ngay_lam_hop_dong date ,
ngay_ket_thuc date ,
tien_dat_coc int
);

insert into hop_dong
values
(1,1,1,1,'2021-1-17','2021-12-21',5000000),
(2,2,2,2,'2021-2-14','2021-10-5',30000000),
(3,3,3,3,'2021-3-15','2021-9-7',40000000);

create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int primary key ,
id_hop_dong int references hop_dong(id_hop_dong),
id_dich_vu_di_kem int references dich_vu_di_kem(id_dich_vu_di_kem),
so_luong int
);

insert into hop_dong_chi_tiet
values
(1,1,1,25),
(2,2,3,45),
(3,3,2,36);

