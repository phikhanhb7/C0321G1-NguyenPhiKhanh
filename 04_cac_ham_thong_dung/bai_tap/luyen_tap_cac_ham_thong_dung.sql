use quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject sb
where sb.Credit = (select max(Credit)
					from subject);
                    
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select sb.subid,subname,credit,`status`,mark
from subject sb
join mark m on m.subid = sb.subid
where m.mark = (select max(mark)
				from mark)
;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select st.studentid, st.studentname, avg(mark) as 'Diem Trung Binh'
from student st
join mark m on m.studentid = st.studentid
group by st.studentid
order by m.mark desc ;
