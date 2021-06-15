use quan_ly_furama;

select * 
from nhan_vien
where (substring_index(ho_ten," ", -1) like "h%" or substring_index(ho_ten," ", -1) like "t%"  or substring_index(ho_ten," ", -1) like "k%" ) and (length(ho_ten) <=15) ; 