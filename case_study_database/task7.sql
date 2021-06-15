use quan_ly_furama ;

select dv.id_dich_vu, dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,hd.ngay_lam_hop_dong
from dich_vu dv
join hop_dong hd on dv.id_dich_vu=hd.id_dich_vu
where (year(hd.ngay_lam_hop_dong) = 2018)
and dv.id_dich_vu not in (select dv.id_dich_vu
from dich_vu dv
join hop_dong hd on dv.id_dich_vu=hd.id_dich_vu
where (year(hd.ngay_lam_hop_dong) = 2019))
