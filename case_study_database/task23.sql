-- 23.	Tạo Clustered Index có tên là IX_KHACHHANG trên bảng Khách hàng
-- Giải thích lý do và thực hiện kiểm tra tính hiệu quả của việc sử dụng INDEX

create unique index ix_khachhang 
on khach_hang(ho_ten,ngay_sinh);

select * 
from khach_hang
where ho_ten = "Khanh";