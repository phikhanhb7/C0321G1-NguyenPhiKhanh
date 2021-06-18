-- 22.	Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này.
use quan_ly_furama ;

update  v_nhan_vien
set v_nhan_vien.dia_chi = 'Lien Chiểu';