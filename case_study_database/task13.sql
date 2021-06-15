-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

use quan_ly_furama ;

select dvdk.id_dich_vu_di_kem,ten_dich_di_kem,gia,don_vi,trang_thai_kha_dung, count(hdct.so_luong) as 'So Luong'
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
group by dvdk.id_dich_vu_di_kem ;