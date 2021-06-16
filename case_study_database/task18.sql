-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).

delete from khach_hang
where id_khach_hang in (select id_khach_hang
						from hop_dong
						where year(ngay_lamf_hop_dong) < 2016
                         group by id_khach_hang);