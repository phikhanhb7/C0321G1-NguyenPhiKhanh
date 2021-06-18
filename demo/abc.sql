create database demo1 ;
use demo1 ;
create table hoc_sinh(
id int primary key ,
name varchar (45) );

insert into hoc_sinh
values 
(1,'Nam') ,
(2,'Khanh') ,
(3,'Tín') ;

create table mon_hoc(
id_mon_hoc int primary key ,
name_sub varchar(45) );


insert into mon_hoc
values 
(1,'Toán'),
(2,'Lý'),
(3,'Hóa');

create table mark2(
id int  references hoc_sinh(id) on update cascade on delete cascade ,
id_mon_hoc int  references mon_hoc(id_mon_hoc) on update cascade on delete cascade ,
primary key(id,id_mon_hoc) ,
mark int ) ;

insert into mark2
values
(1,1,10),
(1,2,8),
(1,3,7),
(2,1,5),
(2,2,8),
(2,3,6),
(3,1,9),
(3,2,7),
(3,3,8);

