create database c0922g1;
use c0922g1;

create table jame(
username varchar(50) primary key,
password varchar(5)
);

create table class(
id int primary key auto_increment,
name varchar(50)
);

create table room(
id int auto_increment primary key,
name varchar(50),
class_id int,
foreign key(class_id) references class(id)
);

create table student(
id int auto_increment primary key,
name varchar (50),
gender boolean,
birthday date,
email varchar(50),
point int check(point >0 and point <=10),
username varchar(50) unique,
class_id int,
foreign key (class_id) references class(id),
foreign key (username) references jame(username) 
);

create table instructor(
id int auto_increment primary key,
name varchar(50),
birthday date,
salary int
);

create table instructor_class(
instrustor_id int,
class_id int,
start_time date,
end_time date,
primary key (instrustor_id, class_id),
foreign key (instrustor_id) references instructor(id),
foreign key (class_id) references class(id) 
);

