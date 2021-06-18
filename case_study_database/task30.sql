delimiter //
create procedure sp_3()
begin
	delete kh
	from khach_hang kh
	join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
    join loai_dich_vu ldv on kh.id_loai_dich_vu = ldv.id_loai_dich_vu
	where ldv.ten_loai_dich_vu ="Room" and year(hd.ngay_lam_hop_dong) between 2015 and 2019;
end //
delimiter ;