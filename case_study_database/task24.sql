-- 24.	Tạo Non-Clustered Index có tên là IX_SoDT_DiaChi trên các cột SODIENTHOAI và DIACHI 
-- trên bảng KHACH HANG và kiểm tra tính hiệu quả tìm kiếm sau khi tạo Index.

create index id_sdt_diachi
on khach_hang(sdt,dia_chi);