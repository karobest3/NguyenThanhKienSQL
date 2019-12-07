drop database if exists my_data;
create database my_data;
use my_data;
create table customer(
customer_number int not null auto_increment primary key,
customer_name varchar(30) not null,
email varchar(35) not null unique,
phone int not null unique
);
create table transactions(
transaction_number int not null auto_increment,
transaction_time datetime,
trasaction_money decimal,
constraint transaction_number primary key (transaction_number)
);
create table accounts(
account_number int not null auto_increment primary key,
account_name varchar(30) not null,
account_dateOpen date,
account_balance decimal,
number_customer int,
number_transaction int,
foreign key (number_customer) references customer(customer_number),
foreign key (number_transaction) references transactions(transaction_number)
)