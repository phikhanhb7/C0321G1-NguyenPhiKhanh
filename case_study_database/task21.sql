-- 21.	Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019”

use quan_ly_furama ;

create view v_nhan_vien as
select nv.id_nhan_vien,nv.ngay_sinh,nv.dia_chi,nv.so_CMND,nv.SDT,nv.email,nv.luong
from nhan_vien nv
join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
where nv.dia_chi = "Hải Châu" and hd.ngay_lam_hop_dong = "2019/12/12"
group by nv.id_nhan_vien;

select * from v_nhan_vien;