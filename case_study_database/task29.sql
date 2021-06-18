delimiter //
create function func_1 ()
returns int 
deterministic 
begin
	return (select count(id_dich_vu)
		from hop_dong
        where id_dich_vu in (select dv.id_dich_vu 			
			from hop_dong hd
			join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
			join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
			join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
			group by dv.id_dich_vu
			having sum(dv.chi_phi_thue + hdct.so_luong*dvdk.gia)  > 300)
	);        
end; //
delimiter ;


-- B

delimiter //
create function func_2(f_id_khach_hang int)
returns int
deterministic 
begin 
	return (select max(datediff(ngay_ket_thuc,ngay_lam_hop_dong) )
	from hop_dong
    where id_khach_hang = f_id_khach_hang
    group by id_khach_hang);
end; //
delimiter ; 