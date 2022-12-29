use student_management;

select address, count(id_student) as "Số lượng"
from student
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên
select s.*, avg(m.mark) as "điểm trung bình"
from student s inner join mark m
on s.id_student = m.id_student
group by s.id_student;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select s.*, avg(m.mark) as "điểm trung bình"
from student s inner join mark m
on s.id_student = m.id_student
group by s.id_student
having avg(m.mark) > 9;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select s.id_student, s.name_student, avg(m.mark) 
from student s inner join mark m
on s.id_student = m.id_student
group by s.id_student, s.name_student
having avg(m.mark) >= all (select avg(m.mark) from mark m group by m.id_student);

