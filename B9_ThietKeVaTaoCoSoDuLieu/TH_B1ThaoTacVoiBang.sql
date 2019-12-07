DROP DATABASE IF EXISTS my_data;
CREATE DATABASE my_data;
use my_data;
CREATE TABLE contacts
(contact_id INT(7) NOT NULL AUTO_INCREMENT,
last_name varchar(30) not null,
first_name varchar(0) not null,
birthday date,
constraint contacts_pk primary key(contact_id)
);
create table suppliers
(supplier_id int(7) not null auto_increment,
supplier_name varchar(35) not null,
supplier_rep varchar(30) not null default 'TDB',
constraint suppliers_pk primary key(supplier_id)
);
drop table contacts;
alter table suppliers
add supplier_address varchar(30) not null
after supplier_name,
add supplier_definition varchar(50) first;
alter table suppliers
modify supplier_definition text not null;
alter table suppliers
drop column supplier_address;
alter table suppliers
change column supplier_name namesupp
varchar(30) not null;
alter table suppliers
rename to supplier;
