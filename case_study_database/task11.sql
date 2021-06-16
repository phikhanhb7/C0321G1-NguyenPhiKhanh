-- 11.	Hiển thị thông tin các Dịch vụ di kem dã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.

use quan_ly_furama ;

select dvdk.id_dich_vu_di_kem,dvdk.ten_dich_di_kem,
dvdk.gia,dvdk.don_Vi,dvdk.trang_thai_kha_dung,
kh.ho_ten,kh.dia_chi
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
join hop_dong hd on hdct.id_hop_dong = hd.id_hop_dong
join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
where (kh.id_loai_khach = 1) and (kh.dia_chi = "Vinh"  or  kh.dia_chi = "Quang Ngai")
group by dvdk.ten_dich_di_kem;