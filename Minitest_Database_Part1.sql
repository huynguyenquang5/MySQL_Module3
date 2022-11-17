drop database minitest_database_part1;

create database Minitest_Database_Part1;

use minitest_database_part1;

create table product (
product_id 	int primary key auto_increment,
code 		int not null unique,
name 		varchar(50),
price 		double,
date_create datetime,
amount 		int
);

create table customer (
customer_id int primary key auto_increment,
name 		varchar(50),
age 		int,
			constraint chk_age check (age > 0 and age < 120),
address 	varchar(255)
);

create table orders ( 
order_id 	int primary key auto_increment,
date_create datetime,
customer_id int,
			foreign key (customer_id) 	references customer (customer_id)
);

create table orderdetail (
order_id 	int,
product_id 	int,
quantity	int,
			primary key (order_id, product_id),
			foreign key (order_id) 		references orders (order_id),
			foreign key (product_id) 	references product (product_id)
);


insert into customer (name, age, address) value
('Nguyen Quang Huy', 27, 'Kham thien, Quan Dong Da, Ha Noi'),
('Nguyen Thanh Ngan', 36, 'Bac Linh Dam. Quan Thanh Xuan, Ha Noi'),
('Nguyen Quang Lap', 63, 'Le Duan, Quan Dong Da, Ha Noi'),
('Le Thi Loi', 59, 'Hang Bac, Quan Hoan Kiem, Ha Noi');

insert into product (code, name, price, date_create, amount) value
(1111, 'Xiaomi', 6500000, '2021-12-15', 30),
(2222, 'Oppo', 8000000, '2022-09-23', 20),
(3333, 'Samsung', 15000000, '2022-03-21', 30),
(4444, 'Apple', 34000000, '2022-08-09', 10),
(5555, 'Realme', 9350000, '2021-05-12', 60);

insert into orders (date_create, customer_id) value
('2022-11-10', 1),
('2022-11-08', 4),
('2022-11-15', 3),
('2022-11-17', 1),
('2022-10-31', 2),
('2022-11-01', 3),
('2022-11-10', 3),
('2022-11-17', 2);

insert into orderdetail (order_id, product_id, quantity) value
(1, 3, 14),
(2, 1, 9),
(3, 5, 20),
(4, 3, 1),
(5, 2, 4),
(6, 4, 5),
(7, 4, 4),
(8, 2, 10);

-- Hiển thị sản phẩm có số lượng cao nhất (nếu có nhiều hiện tất cả)
select name , amount from product
where amount = (select max(amount) from product);

-- Hiển thị các sản phẩm theo giá giảm dần
select name, price from product
order by price desc;

-- Hiển thị các sản phẩm có date_create trước ngày 10/7/2022
select name, date_create from product
where  date_create < '2022-07-10';

-- Hiển thị tổng tiền của tất cả order và mã order tương ứng
select orderdetail.order_id as 'Order ID', product.price * orderdetail.quantity as 'Total' from orderdetail
join product on product.product_id = orderdetail.product_id
order by orderdetail.order_id asc;

select sum(product.price * orderdetail.quantity) as 'Total Order' from orderdetail
join product on product.product_id = orderdetail.product_id;

-- Hiển thị sản phẩm được mua nhiều nhất (nếu có nhiều hiện tất cả)

-- select product.name, sum(orderdetail.quantity) as quantitysold from orderdetail
-- join product on product.product_id = orderdetail.product_id
-- group by orderdetail.product_id
-- order by quantitysold desc limit 1,1;

select product.name, sum(orderdetail.quantity) as quantitysold from orderdetail
join product on product.product_id = orderdetail.product_id
group by orderdetail.product_id
having sum(orderdetail.quantity) >= 
all (select sum(orderdetail.quantity) from orderdetail group by orderdetail.product_id);