-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
-- (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt
--  vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.


select hd.id_hop_dong,nv.ho_ten,kh.ho_ten,kh.SDT,
dv.ten_dich_vu,count(hdct.id_hop_dong_chi_tiet) as 'so_luong_DVDK',
hd.ngay_lam_hop_dong,hd.tien_dat_coc
from hop_dong hd
join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
where ( (month(hd.ngay_lam_hop_dong) in (10,11,12)) and  year(hd.ngay_lam_hop_dong) = 2019 ) 
		 and dv.id_dich_vu not in (select dv.id_dich_vu
 						from hop_dong hd
                        join dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
                        where (month(ngay_lam_hop_dong) between 1 and 6)  
                       and year(ngay_lam_hop_dong) = 2019  
                      )
group by hd.id_hop_dong;


