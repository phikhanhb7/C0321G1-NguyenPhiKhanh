-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi

update dich_vu_di_kem
set gia = gia *2
where id_dich_vu_di_kem in (select a.id from 
			( select dvdk.id_dich_vu_di_kem as id , sum(hdct.so_luong) as so_lan_su_dung
            from dich_vu_di_kem dvdk
            join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
            group by dvdk.id_dich_vu_di_kem 
            having so_lan_su_dung > 10) as a );