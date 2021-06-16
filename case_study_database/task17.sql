-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.

use quan_ly_furama ;
update khach_hang 
set id_loai_khach = 1
where (id_loai_khach = 2)
and id_khach_hang in (select a.id from (select hd.id_khach_hang as id,
		sum(dv.chi_phi_thue + hdct.so_luong*dvdk.gia) as tong_tien
        from hop_dong hd
        join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
        join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
        join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
        where year(hd.ngay_lam_hop_dong)=2019
        group by id
        having tong_tien > 10000000 ) as a	);   