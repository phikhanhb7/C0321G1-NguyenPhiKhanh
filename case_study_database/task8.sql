use quan_ly_furama;

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên

select ho_ten
from khach_hang
group by ho_ten ;


select distinct ho_ten
from khach_hang;

select ho_ten
from khach_hang
union
select ho_ten
from khach_hang; 

select *
from khach_hang kh1
where not exists(
					select ho_ten
					from khach_hang kh2
					where kh1.ho_ten = kh2.ho_ten and kh1.id_khach_hang < kh2.id_khach_hang
				);
