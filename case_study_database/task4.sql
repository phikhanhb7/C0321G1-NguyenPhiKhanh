use quan_ly_furama;
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp
--  xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select *
from khach_hang ;
select *
from hop_dong ;
select *
from loai_khach ;

select kh.id_khach_hang, ho_ten,count(id_hop_dong) 'số lần đặt phòng'
from khach_hang kh
join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
where id_loai_khach = 4 
group by hd.id_khach_hang
order by  'số lần đặt phòng';