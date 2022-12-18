use c0922g1;

-- Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp
select c.name, count(s.class_id) as "Số lượng học viên mỗi lớp" 
from class c left join student s
on c.id = s.class_id
group by c.name
having count(s.class_id) >0;	

-- Tính điểm lớn nhất của mỗi các lớp 

select c.name, max(s.point) as "Điểm lớn nhất của mỗi các lớp"
from class c left join student s
on c.id = s.class_id
group by c.name;

-- Tình điểm trung bình  của từng lớp 
select c.name, avg(s.point) as "Điểm trung bình của mỗi các lớp"
from class c left join student s
on c.id = s.class_id
group by c.name;

-- Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym. 
select name, birthday from student 
union
select birthday, name from instructor;

-- Lấy ra top 3 học viên có điểm cao nhất của trung tâm.
select name, point from student
order by point desc
limit 3;

-- Lấy ra các học viên có điểm số là cao nhất của trung tâm. 
select name, point from student
having point >=8
order by point desc;
