use student_management;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select name_student from student where name_student like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where (month(start_day) = 12);

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates = 0;
update student set id_class = 2 where name_student = 'Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. 
-- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select name_student,name_sub, mark 
from student,subject,mark
where student.id_student = mark.id_student and mark.id_sub = subject.id_sub
order by mark.mark desc, student.name_student
;