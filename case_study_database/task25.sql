-- 25.	Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó với Id Khách hàng được truyền vào như là 1 tham số của Sp_1

delimiter //
create procedure sp_1(in id int)
BEGIN
delete from khach_hang 
where id_khach_hang =  id;
END; //
delimiter ;

call sp_1(7);