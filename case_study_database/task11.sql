-- 11.	Hiển thị thông tin các Dịch vụ dã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.


select dv.id_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_tang,dv.so_nguoi_toi_da,dv.chi_phi_thue
from dich_vu dv
join hop_dong hd on dv.id_dich_vu = hd.id_dich_vu
join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
join loai_khach lkh on kh.id_loai_khach = lkh.id_loai_khach
where lkh.ten_loai_khach="Diamond"  and kh.dia_chi in ("Vinh","Quảng Ngãi")
group by dv.ten_dich_vu;