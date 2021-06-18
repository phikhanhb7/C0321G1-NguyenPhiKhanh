-- 27.	Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện console của database



delimiter //
create trigger tr_1
after delete
on hop_dong for each row
begin
set @tong = (select 
 count(id_hop_dong) 
 from hop_dong );
 
end //
delimiter ;

set @tong = 0 ;
delete from hop_dong
where id_hop_dong = 100 ;
select @tong as 'total' ;