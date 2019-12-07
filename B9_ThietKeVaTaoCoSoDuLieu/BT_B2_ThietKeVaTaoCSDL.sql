drop database if exists my_data3;
create database my_data3;
use my_data3;
create table offices(
officeCode varchar(10) not null unique,
city varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50)  null,
state varchar(50)  null,
country varchar(50)  null,
postalCode varchar(15)  null,
constraint office_pk primary key(officeCode)
);
create table employees (
employeeNumber int not null unique,
lastName  varchar(50) not null,
firstName  varchar(50) not null,
email varchar(100) not null,
jobTitle varchar(50) not null,
reportTo int not null,
officeCode varchar(10) not null,
constraint employee_pk primary key(employeeNumber),
constraint employee_fk foreign key(reportTo) references employees(employeeNumber),
constraint employee_office_fk foreign key(officeCode) references offices(officeCode)
);

create table customers(
customerNumber int not null auto_increment,
customerName varchar(50) not null,
contactLastName varchar(50) not null,
contactFisrtName varchar(50) not null,
phone int(9) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50) null,
city varchar(50) not null,
state varchar(50) not null,
postalCode varchar(15) not null,
country varchar(50) not null,
creditLimit double null,
salesRepEmployeeNumber int not null,
constraint customer_pk primary key(customerNumber),
foreign key(salesRepEmployeeNumber) references employees(employeeNumber)
);
create table orders (
orderNumber int not null auto_increment,
orderDate date not null,
requiredDate date not null,
shippedDate date null,
`status` varchar(15) null,
comments text null,
priceEach double not null,
customerNumber int not null,
constraint order_pk primary key(orderNumber),
constraint oeder_fk foreign key(customerNumber) references customers(customerNumber)
);
create table payments(
checkNumber int not null,
paymentDate date not null,
amount decimal not null,
customerNumber int not null,
constraint payments_pk primary key(checkNumber),
constraint payment_fk foreign key(customerNumber) references customers(customerNumber)
);
create table productLines(
productLine int not null unique,
textDescription text null,
image varchar(50) null,
constraint productLine_pk primary key(productLine)
);
create table products(
productCode int not null unique,
productName varchar(70) not null,
productScale varchar(10) not null,
productVendor varchar(50) not null,
productDescription text not null,
buyPrice decimal not null,
MSRP decimal not null,
productLine int not null unique,
constraint product_pk primary key(productCode),
foreign key(productLine) references productlines(productLine)
);


create table orderDetails(
orderNumber int not null,
productCode int not null,
quantityOrdered int not null,
priceEach decimal not null,
primary key(orderNumber,productCode),
foreign key(orderNumber) references orders(orderNumber),
foreign key(productCode) references products(productCode)
);