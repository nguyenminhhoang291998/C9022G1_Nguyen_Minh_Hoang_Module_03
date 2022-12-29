use sales_management;
INSERT INTO customer VALUES (1,'hoang',18);
INSERT INTO order_product VALUES (1,1,2/2/2022,2);
INSERT INTO customer VALUES (2,'hhhh',22);
INSERT INTO order_product VALUES (2,2,null,2);
INSERT INTO customer VALUES (3,'kkkk',null);
INSERT INTO order_product VALUES (4,null,null,2);

select * from customer;

select * from order_product;
select * from order_product
inner join customer on customer.c_id = order_product.c_id;

select * from order_product
left join customer on customer.c_id = order_product.c_id;

select * from customer
where c_name like "%hoàng" or c_name like "%hải";

select * from customer
where c_age > 17;

select * from customer
where c_name like "thanh%";

select * from customer
order by c_age;

select c_age, count(c_id) as "so luong"
from customer 
where c_age >10
group by c_age
having count(c_id) > 2
;

select * from customer
where c_age = 18
order by c_name
;