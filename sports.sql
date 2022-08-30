create database sports;
use sport;
create table run(
id int primary key auto_increment,
name varchar(20),
time date,
times int
);
insert run values ('曲康杰',20220614,30);
 Incorrect date value: '2002' for column 'time' at row 1