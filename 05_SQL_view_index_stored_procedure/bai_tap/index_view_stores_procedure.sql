
create database if not exists demo;
use demo;
create table products(
id_product int auto_increment primary key,
product_code varchar(20),
product_name varchar(20),
product_price float,
product_amount float,
product_description varchar(45),
product_status varchar(45)
);

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values ("A1","Oppo",200,500,"white","still"),
("A2","SamSung",300,600,"black","still"),
("A3","Nokia",400,800,"yellow","still"),
("A4","XiaoMi",500,800,"pink","still"),
("A5","Iphone",600,900,"blue","still");


-- create index
create unique index index_code
on products (product_code);

create unique index index_name_price
on products (product_name,product_price);

explain select * from products where product_code = "A3";
explain select * from products where product_name = "SamSung" and product_price = "300";

 -- create view
 create view get_product as
 select product_code,product_name,product_price,product_status
 from products;

update get_product
set product_price = 350
where product_name = "SamSung";

drop view get_product;

-- create stored_procedure
delimiter //
create procedure get_product()
BEGIN
select * from products;
END; //
delimiter ;


delimiter //
create procedure add_product(p_code varchar(20),p_name varchar(20),p_price float,
p_amount float,p_description varchar(45),p_status varchar(20))
BEGIN
insert into products(product_code,product_name,product_price,product_amount,
product_description,product_status)
values (p_code,p_name,p_price,p_amount,p_description,p_status);
END; //
delimiter ;


delimiter //
create procedure update_product_name(p_id int,p_name varchar(45), p_code int,
		   p_price double,p_amount int,p_description varchar(100),p_status varchar(100))
BEGIN
update products
set product_name = p_name,
 product_code=p_code,
 product_price=p_price,
 product_amount = p_amount,
 product_description=p_description,
 product_status=p_status
where id_product = p_id;
END; //
delimiter ;

delimiter //
create procedure delete_product(p_id int)
BEGIN
delete from products 
where id_product = p_id;
END; //
delimiter ;
