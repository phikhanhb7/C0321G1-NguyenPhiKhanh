use quan_ly_furama;

select * 
from nhan_vien
where (ho_ten like "h%" or ho_ten like "t%"  or ho_ten like "k%" ) and (length(ho_ten) <=15) ; 