create database furama;
use furama;

create table position (
  id int primary key, 
  name varchar(45)
);

create table education_degree (
  id int primary key, 
  name varchar(45)
);

-- bộ phận
create table division(
  id int primary key, 
  name varchar(45)
);



create table role(
  role_id int primary key, 
  role_name varchar(45)
);

create table user(
  username varchar(255) primary key,
  password varchar(255)
);

create table user_role (
role_id int,
username varchar(255),
primary key(role_id,username),
foreign key(role_id) references role(role_id) on delete cascade,
foreign key(username) references user(username) on delete cascade
);

create table employee (
  id int primary key, 
  name varchar(45), 
  day_of_birth date, 
  id_card varchar(45), 
  salary double, 
  phone_number varchar(45), 
  email varchar(45), 
  address varchar(45), 
  position_id int, 
  education_degree_id int, 
  division_id int, 
  username varchar(255), 
  foreign key(position_id) references position (id) on delete cascade, 
  foreign key(education_degree_id) references education_degree (id) on delete cascade, 
  foreign key(division_id) references division(id) on delete cascade,
  foreign key(username) references user(username) on delete cascade
);


create table customer_type(
  id int primary key, 
  name varchar(45)
);

create table customer(
  id int primary key, 
  customer_type_id int, 
  name varchar(45), 
  day_of_birth date, 
  gender bit(1), 
  id_card varchar(45), 
  phone_number varchar(45), 
  email varchar(45), 
  address varchar(45), 
  foreign key(customer_type_id) references customer_type(id) on delete cascade
);

create table attach_facility (
  id int primary key, 
  name varchar(45), 
  cost double, 
  unit varchar(10), 
  status varchar(45)
);



create table rent_type(
  id int primary key, 
  name varchar(45)
);

create table facility_type(
  id int primary key, 
  name varchar(45)
);

create table facility (
  id int primary key, 
  name varchar(45), 
  area int, 
  cost double, 
  max_people int, 
  rent_type_id int, 
  facility_type_id int, 
  standard_room varchar(45), 
  description_other_convenience varchar(45), 
  pool_area double, 
  number_of_floors int, 
  facility_free text, 
  foreign key (facility_type_id) references facility_type(id) on delete cascade, 
  foreign key (rent_type_id) references rent_type(id) on delete cascade
);

create table contract(
  id int primary key auto_increment, 
  start_date datetime, 
  end_date datetime, 
  deposit double, 
  employee_id int, 
  customer_id int, 
  facility_id int, 
  foreign key(employee_id) references employee(id) on delete cascade, 
  foreign key(customer_id) references customer(id) on delete cascade, 
  foreign key(facility_id) references facility(id) on delete cascade
);

create table contract_detail (
  id int primary key auto_increment, 
  contract_id int, 
  attach_facility_id int, 
  quantity int, 
  foreign key(attach_facility_id) references attach_facility(id) on delete cascade, 
  foreign key(contract_id) references contract(id) on delete cascade
);

DELIMITER $$
create procedure select_total_cost_by_contract_id()
begin
select c.id as id, f.id as facilityId, f.name as facilityName , cus.id as customerId, cus.name as customerName, c.start_date, c.end_date, c.deposit,
   (ifnull(f.cost,0) + sum( ifnull(cd.quantity , 0)* ifnull(af.cost,0))) as totalCost
 from contract c 
left join facility f on c.facility_id = f.id
left join customer cus on c.customer_id = cus.id
left join contract_detail cd on c.id = cd.contract_id
left join attach_facility af on af.id = cd.attach_facility_id
group by c.id
order by c.id;
end $$
DELIMITER ;



DELIMITER $$
create procedure select_attach_facility_by_id(id int)
begin
select c.id as contract_id , af.name as attach_facility_name, af.cost as attach_facility_cost ,cd.quantity
from contract c 
join contract_detail cd on c.id = cd.contract_id
left join attach_facility af on af.id = cd.attach_facility_id
where c.id = id;
end $$
DELIMITER ;

select  id ,  name from  attach_facility;

