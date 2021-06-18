-- 26.	Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

delimiter //
create procedure sp_2(p_id_hop_dong int,p_id_nhan_vien int,p_id_khach_hang int,p_id_dich_vu int,p_ngay_lam_hop_dong date,p_ngay_ket_thuc date,p_tien_dat_coc int)
begin
if (p_id_hop_dong not in (select id_hop_dong from hop_dong) 
					and p_id_nhan_vien in (select id_nhan_vien from nhan_vien ) and p_id_khach_hang in (select id_khach_hang from khach_hang)
                    and p_id_dich_vu in (select id_dich_vu from dich_vu ))
                    then insert into hop_dong 
                          values(p_id_hop_dong ,p_id_nhan_vien ,p_id_khach_hang ,p_id_dich_vu ,p_ngay_lam_hop_dong ,p_ngay_ket_thuc ,p_tien_dat_coc);
else SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'thêm thất bại';
end if;
end //
delimiter ;

use quan_ly_furama;
call sp_2 (100,1,1,1,'1997-11-24','1997-11-24',50000);
