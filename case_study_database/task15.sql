-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.

use quan_ly_furama;

select nv.id_nhan_vien,ho_ten,td.trinh_do,bp.ten_bo_phan,sdt,dia_chi, count(hd.ngay_lam_hop_dong) as "so lan"
from nhan_vien nv
	join vi_tri vt on vt.id_vi_tri = nv.id_vi_tri
    join trinh_do td on td.id_trinh_do = nv.id_trinh_do
    join bo_phan bp on bp.id_bo_phan = nv.id_bo_phan
    join hop_dong hd on hd.id_nhan_vien = nv.id_nhan_vien
where (year(ngay_lam_hop_dong) = 2018 or 2019 )
		and "so lan" <=3 
group by nv.id_nhan_vien ;
    
    