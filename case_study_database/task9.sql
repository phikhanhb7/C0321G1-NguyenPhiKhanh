-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
use quan_ly_furama ;

select month(ngay_lam_hop_dong) , sum(chi_phi_thue) as 'Tong tien'
from hop_dong hd
join dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
where year(ngay_lam_hop_dong) = 2019  
group by month(ngay_lam_hop_dong);