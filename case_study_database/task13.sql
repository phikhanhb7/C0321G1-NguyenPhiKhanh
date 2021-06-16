-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

use quan_ly_furama ;

select dvdk.id_dich_vu_di_kem, dvdk.ten_dich_di_kem,
dvdk.gia,dvdk.don_Vi,dvdk.trang_thai_kha_dung,
 sum(hdct.so_luong)  as 'so_lan_su_dung'
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
group by dvdk.id_dich_vu_di_kem
having so_lan_su_dung >= all (select  sum(hop_dong_chi_tiet.so_luong) 
				from hop_dong_chi_tiet
                group by id_dich_vu_di_kem
				);