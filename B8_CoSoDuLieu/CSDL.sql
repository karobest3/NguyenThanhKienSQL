SELECT * FROM classicmodels.customers;
-- SELECT customerName, phone, city, country FROM customers ;
SELECT * FROM classicmodels.customers WHERE customerName = 'Signal Gift Stores';
SELECT * FROM classicmodels.customers WHERE customerName like '%A%';
select * from classicmodels.customers where city in ('Nantes','Las VeGas','NYC');
update classicmodels.customers set customerName='Kien'
where customerNumber ='131';
insert into customers (customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,city,state,postalCode,country)
values ('155','Kien','Nguyen','Thanh','112412','level1','da nang','asdas','asd21','viet nam');
select *  FROM classicmodels.customers where customerNumber= '155';
 DELETE FROM `classicmodels`.`customers` WHERE `customerNumber`='103';