DROP DATABASE IF EXISTS my_data1;
CREATE DATABASE my_data1;
use my_data1;
create table users (
users_id int(10) auto_increment primary key,
usersname varchar(30) not null unique,
password varchar(16) not null,
email varchar(50));
create table roles (
role_id int(7) auto_increment,
role_name varchar(12) not null,
primary key (role_id)
);
create table usersroles(
user_id int not null,
role_id int not null,
primary key(user_id, role_id),
foreign key (user_id) references users (users_id),
foreign key(role_id) references roles (role_id)
);