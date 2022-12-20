create database ss5_product;
use ss5_product;

--  Tạo bảng Products
create table products(
  id int, 
  product_code varchar(30), 
  product_name varchar(30), 
  product_price int, 
  product_amount int, 
  product_description varchar(30), 
  product_status varchar(30)
);


-- Chèn một số dữ liệu mẫu cho bảng Products.
insert into products 
values 
  (1, 'T1', 'Tao', 22, 5, 'N2', 'Ok'), 
  (2, 'C1', 'Cam', 20, 6, 'N2', 'Ok'), 
  (3, 'O1', 'Oi', 15, 7, 'N2', 'Ok'), 
  (4, 'B1', 'Buoi', 30, 6, 'N2', 'Ok'), 
  (5, 'C2', 'Coc', 13, 2, 'N2', 'Ok'), 
  (6, 'M1', 'Mit', 22, 6, 'N2', 'Ok'), 
  (7, 'X1', 'Xoai', 12, 6, 'N2', 'Ok');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_product_code on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_product_name_and_price on products(product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
explain 
select 
  * 
from 
  products 
where 
  product_code = 'C2';
drop 
  index i_product_code on products;
  
drop 
  index i_product_name_and_price on products;

-- Tạo view lấy về các thông tin: productCode, productName,
-- productPrice, productStatus từ bảng products.
create view w_products as(
  select 
    product_code, 
    product_name, 
    product_price, 
    product_status 
  from 
    products
);

-- Tiến hành sửa đổi view
insert into w_products 
values 
  ('C3', 'Chuối', 33, 'Ok');
  
update 
  w_products 
set 
  product_price = 22 
where 
  product_code = 'C3';
  
delete from 
  w_products 
where 
  product_code = 'C3';
  
select 
  * 
from 
  w_products;

-- Tiến hành xoá view
drop 
  view w_products;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter $$ create procedure get_all_product () begin 
select 
  * 
from 
  products;
end $$ delimiter;

call get_all_product;

-- Tạo store procedure thêm một sản phẩm mới
delimiter $$ create procedure add_product (
  new_id int, 
  new_product_code varchar(30), 
  new_product_name varchar(30), 
  new_product_price int, 
  new_product_amount int, 
  new_product_description varchar(30), 
  new_product_status varchar(30)
) begin insert into products 
values 
  (
    new_id, new_product_code, new_product_name, 
    new_product_price, new_product_amount, 
    new_product_description, new_product_status
  );
end $$ delimiter;

call add_product(9,'N1','Nhan',12,22,'N2','Ok');

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter $$ create procedure update_product (
  update_id int, 
  new_product_code varchar(30), 
  new_product_name varchar(30), 
  new_product_price int, 
  new_product_amount int, 
  new_product_description varchar(30), 
  new_product_status varchar(30)
) begin 
update 
  products 
set 
  product_code = new_product_code, 
  product_name = new_product_name, 
  product_price = new_product_price, 
  product_amount = new_product_amount, 
  product_description = new_product_description, 
  product_status = new_product_status 
where 
  id = update_id;
end $$ delimiter;

call update_product(10,'N2','Nam',14,22,'N3','Ok');

-- Tạo store procedure xoá sản phẩm theo id
delimiter // create procedure delete_product(delete_id int) begin 
delete from 
  products 
where 
  id = delete_id;
end // delimiter;

call delete_product(9);


