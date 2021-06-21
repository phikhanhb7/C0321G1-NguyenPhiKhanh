delimiter //
create trigger tr_2
before update on hop_dong for each row
begin
	if datediff(new.ngay_ket_thuc,old.ngay_lam_hop_dong,day) >= 2 then
		select "cập nhật thành công" ;
    else
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
	end if;
end; //
delimiter ;

