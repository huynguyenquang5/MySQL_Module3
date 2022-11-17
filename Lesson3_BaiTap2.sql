-- use baitap2;

-- insert into customer
-- value 
-- (1, 'Minh Quan', 10),
-- (2, 'Ngoc Oanh', 20),
-- (3, 'Hong Ha', 50);

-- insert into order1
-- value 
-- (1, 1, '2006-3-21', null),
-- (2, 2, '2006-3-23', null),
-- (3, 1, '2006-3-16', null);

-- insert into product
-- value
-- (1, 'May Giat', 3),
-- (2, 'Tu Lanh', 5),
-- (3, 'Dieu Hoa', 7),
-- (4, 'Quat', 1),
-- (5, 'Bep Dien', 2);

-- insert into orderdetail
-- value
-- (1, 1, 3),
-- (1, 3, 7),
-- (1, 4, 2),
-- (2, 1, 1),
-- (3, 1, 8),
-- (2, 5, 4),
-- (2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
-- select oID, oDate, oTotalPrice from order1; 

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
-- select customer.cid, customer.cName, product.pName from customer
-- inner join order1 on order1.cid = customer.cid
-- inner join orderdetail on orderdetail.oid = order1.oid
-- inner join product on product.pid = orderdetail.pid;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
-- select cid, cname from customer
-- where cid not in (select order1.cid from order1);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)
-- select order1.oid, order1.odate, sum(orderdetail.odqty * product.pPrice) from order1
-- inner join orderdetail on orderdetail.oid = order1.oid 
-- inner join product on product.pid = orderdetail.pid
-- group by order1.oid;





