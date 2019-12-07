DROP DATABASE IF EXISTS my_data2;
CREATE DATABASE my_data2;
use my_data2;
create table customers(
id int auto_increment primary key,
name varchar(30) not null ,
address varchar(30),
email varchar(50)
);
create table orders (
oder_id int auto_increment primary key,
staff varchar(30) ,
customer_id int,
foreign key(customer_id) references customers (id)
);