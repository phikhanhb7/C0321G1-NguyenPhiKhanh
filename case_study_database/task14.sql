-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
--  Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
use quan_ly_furama;

select hdct.id_hop_dong,dv.ten_dich_vu,ten_dich_di_kem,count(hdct.id_dich_vu_di_kem) as 'so lan'

from hop_dong_chi_tiet hdct
join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
join hop_dong hd on hd.id_hop_dong = hdct.id_hop_dong
join dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
group by dvdk.ten_dich_di_kem 
having count(hdct.id_dich_vu_di_kem)= 1 ;


