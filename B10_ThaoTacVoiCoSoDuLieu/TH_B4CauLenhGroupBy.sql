select status from orders
group by status;
select status, count(*) as 'So luong status' from orders
group by status;
select status, sum(quantityOrdered*priceEach)
from orders inner join orderdetails on orders.ordernumber = orderdetails.ordernumber
group by status;
select orderNumber, sum(quantityOrdered*priceEach) from orderdetails
group by orderNumber;
select year(orderDate) as year, sum(quantityOrdered * priceEach) as total
from orders inner join orderdetails on orders.orderNumber = orderdetails.ordernumber
where status = 'shipped'
group by year
having year > 2003;