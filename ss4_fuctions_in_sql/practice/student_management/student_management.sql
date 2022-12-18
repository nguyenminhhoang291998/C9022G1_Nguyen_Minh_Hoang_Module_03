create database if not exists student_management;
use student_management;

create table class(
id_class int primary key auto_increment not null,
name_class varchar(60) not null,
start_day datetime not null,
status_class bit 
);

create table student(
id_student int primary key auto_increment not null,
name_student varchar(30) not null,
address varchar(50),
phone_number varchar(20),
status_student bit,
id_class int not null,
foreign key (id_class) references class(id_class)
);

create table subject(
id_sub int primary key auto_increment not null,
name_sub varchar(30) not null,
credit tinyint not null default 1 check (credit >=1),
status_subject bit default 1
);

create table mark(
id_mark int primary key auto_increment not null,
id_sub int not null,
id_student int not null,
mark float default 0 check (mark between 0 and 100),
exam_time Tinyint default 1,
unique (id_sub,id_student),
foreign key (id_sub) references subject(id_sub),
foreign key (id_student) references student(id_student)
);

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student(name_student,address,phone_number,status_student,id_class)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student(name_student,address,status_student,id_class)
values ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student(name_student,address,phone_number,status_student,id_class)
values ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (id_sub, id_student, mark, exam_time)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);       