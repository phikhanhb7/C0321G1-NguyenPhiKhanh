drop database if exists product_managerment ;
create database product_managerment ;
use product_managerment ;

create table product (
 id  int primary key ,
 `name`  varchar(45),
 price double,
 quantity int ,
 color  varchar(45),
 discription  varchar(45),
 idCategory int references category(idCategory) on delete cascade on update cascade
);

insert into product
values
(1,"I-Phone",'10000000', 10 , 'Yellow', 'Tốt',1),
(2,"I-Path",'30000000', 5 , 'Whirle', 'Tốt',3),
(3,"Game-Ming",'20000000', 9 , 'Black', 'Tốt',2);

create table category (
idCategory int primary key ,
`name`  varchar(45)
);

insert into category
values
(1,'Điện thoại'),
(2,'PC'),
(3,'Máy Tính Bảng ');

