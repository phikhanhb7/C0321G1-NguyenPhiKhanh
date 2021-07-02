drop database if exists demo;
CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');



DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN user_id INT)

BEGIN

    SELECT users.name, users.email, users.country

    FROM users

    where users.id = user_id;

    END$$

DELIMITER ;
-- Gọi Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng hiển thị danh sách users

DELIMITER $$
CREATE PROCEDURE select_users()
BEGIN
  select * from users;
END$$

DELIMITER ;

-- Gọi Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng sửa thông tin user
DELIMITER $$
CREATE PROCEDURE update_user(
IN user_id int(3),

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)
BEGIN
	update users
	set name=user_name, email=user_email, country=user_country
    where id = user_id;
END$$

DELIMITER ;

-- Gọi Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng xoá user

DELIMITER $$
CREATE PROCEDURE delete_user(
in id_user int(3)
)
BEGIN
  delete from users where id=id_user;
END$$

DELIMITER ;



DELIMITER $$
CREATE PROCEDURE insert_user(

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)
BEGIN

    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);

    END$$

DELIMITER ;






create table Permision(

id int(11) primary key,

name varchar(50)

);

 

create table User_Permision(

permision_id int(11),
user_id int(11),
FOREIGN KEY (permision_id) REFERENCES Permision(id),
FOREIGN KEY (user_id) REFERENCES users(id)

);

insert into Permision(id, name) values(1, 'add');
insert into Permision(id, name) values(2, 'edit');
insert into Permision(id, name) values(3, 'delete');
insert into Permision(id, name) values(4, 'view');







