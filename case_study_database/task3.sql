use quan_ly_furama;

select * from khach_hang
where (year(curdate()) - year(ngay_sinh) between 18 and 50) and (dia_chi in ("Đà Nẵng","Quảng Trị"));