use quanlysinhvien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’

select * 
from student st
where st.StudentName like "h%";

-- --Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.

select *
from class c
where month(c.StartDate) = 12; 

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.

select *
from subject SB
where SB.Credit Between 3 and 5  ;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.

update student st
set st.classid =2 
where st.studentname = 'Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

select StudentName, subname, Mark
from student st 
join mark m on m.studentid = st.Studentid
join subject sb on sb.SubId = m.SubId
order by m.mark desc, st.StudentName;