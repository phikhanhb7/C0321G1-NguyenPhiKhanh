-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue
-- , TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

use quan_ly_furama;

select dv.id_dich_vu, dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue , hd.ngay_lam_hop_dong
from dich_vu dv
join hop_dong hd on hd.id_dich_vu = dv.id_dich_vu
where dv.id_dich_vu <>all (select hop_dong.id_dich_vu
							from hop_dong 
							where (year(ngay_lam_hop_dong)=2019) and (month(ngay_lam_hop_dong) in (1,2,3))
						   );
