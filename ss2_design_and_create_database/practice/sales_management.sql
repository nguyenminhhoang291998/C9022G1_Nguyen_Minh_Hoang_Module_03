create database sales_management;
use sales_management;

create table customer(
	c_id int primary key,
	c_name varchar(30),
	c_age int
);

create table order_product(
	o_id int primary key,
	c_id int,
	o_date date,
	o_total_price int,
	foreign key (c_id) references customer(c_id)
);

create table product(
	p_id int primary key,
	p_name varchar(30),
	p_price int
);

create table order_detail(
	o_id int,
	p_id int,
	primary key(o_id,p_id),
	od_qty varchar(30),
	foreign key(o_id) references order_product(o_id),
	foreign key(p_id) references product(p_id)
);