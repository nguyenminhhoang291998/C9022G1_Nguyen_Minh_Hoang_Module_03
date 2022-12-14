create database if not exists student_management;
use student_management;

/*tạo và thao tác với bảng student (class) : id, name*/
create table class(
id  int PRIMARY key,
name_class varchar(50)
);

select * from class;
insert into class values(1,'C0922G1');
insert into class values(2,'C0822G1'),(3,'C1002G1');
set SQl_safe_updates=0;
set SQl_safe_updates=1;
update class set name_class='C0722G1' where name_class='C0822G1';
select name_class from class;
delete from class where name_class = 'C1002G1';
alter table class add column(email varchar(20));
alter table class drop column email;
select * from class;


/*tạo và thao tác với bảng teacher: id, name, age, country*/
create table teacher(
id int primary key,
name_teacher varchar(30),
age int,
country varchar(30)
);

insert into teacher values(1,'Huy',25,'Viet Nam'),(2,'Andy',34,'England');
insert into teacher (age,id,country,name_teacher) values(28,4,'Brazil','Fred');

select * from teacher;
select name_teacher from teacher;

set sql_safe_updates =0;
set sql_safe_updates =1;
update teacher set name_teacher='Brown' where name_teacher='Andy';

delete from teacher where name_teacher = 'Fred';