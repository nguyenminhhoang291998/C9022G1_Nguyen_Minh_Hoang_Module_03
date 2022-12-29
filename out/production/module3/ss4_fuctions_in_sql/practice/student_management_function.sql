use student_management;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * , max(credit) from subject;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.* , max(m.mark) "Mark max"
from subject s left join mark m
on s.id_sub = m.id_sub;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.* , avg(m.mark) as "Mark average"
from student s left join mark m
on s.id_student = m.id_student
group by s.id_student
order by avg(m.mark) desc;
