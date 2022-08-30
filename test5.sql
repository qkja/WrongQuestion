
create table books(
    book_id char(10) not null,
    book_name varchar(20) unique,
    book_price int
);

create table Persons(
per_id char(10),
per_name char(12),
per_age int(3),
per_tele char(10) primary key
);

create table Persons(
per_id char(10),
per_name char(12),
per_age int(3),
per_tele char(10),
primary key(per_tele char(10))
);

create table types(
type_id int primary key auto_increment,
type_name varchar(20),
type_remark char(11)
);

create table types(
type_id int,
type_name varchar(20) default 'unknow',
type_remark char(11)
);

insert into types values (1,'1','测试'),(1,'1','测试');

drop table types;
create table types(
type_id int,
type_name varchar(20) unique default 'unknow',
type_remark char(11)
);

create table class(
id int primary key auto_increment,
name varchar(20)
);

create table student(
id int primary key auto_increment,
name varchar(20),
classId int 
);

insert into class values 
(null ,'java1班'),
(null ,'java2班'),
(null ,'java3班'),
(null ,'java4班');



insert into student values (null,'李白',1);


create table class(
id int primary key auto_increment,
name varchar(20)
);

create table student(
id int primary key auto_increment,
name varchar(20),
classId int,
foreign key(classId) references class(id) 
);


insert into student values 
(null,'刘备',2),
(null,'曹操',3),
(null,'杜甫',4);

insert into student values (null,'错误',10);

create table user(
id int primary key auto_increment,
name varchar(20),
decription varchar(1000)
);

insert into user values 
(null,'曹操','乱世枭雄'),
(null,'刘备','仁德之主'),
(null,'孙权','年轻有为');


create table user2(
name varchar(20),
decription varchar(1000)
);

insert into user2 select name,decription from user; 
insert into user2 select* from user; 

select count(*) from user;
select count(id+id) from user;
select count() from user;


create table types(
type_id int,
type_name varchar(20) unique default 'unknow',
);
create table types(
type_id int,
type_name varchar(20) default 'unknow'
);

insert into types values (1,'1');
insert into types (type_id)values (2);

create table student(
id int primary key auto_increment,
name varchar(20),
score decimal(4,2)
score decimal(4,2)
);

insert into student values
(null,'刘备',84),
(null,'曹操',80),
(null,'孙权',90),
(null,'张飞',60);

select sum(score) from student;

select avg (score) from student;

select avg (score) from student where score<85;