-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
-- ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.

use quan_ly_furama;

select nv.id_nhan_vien as ID,nv.ho_ten,nv.email as ' Email hay CMND',nv.sdt,nv.ngay_sinh,nv.dia_chi, 'nhan vien' as `type`
from nhan_vien nv
union all
select kh.id_khach_hang as ID,kh.ho_ten,kh.so_cmnd,kh.sdt,kh.ngay_sinh,kh.dia_chi, 'khach hang' as `type`
from khach_hang kh;