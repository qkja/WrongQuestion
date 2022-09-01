create table student(
	id int not null,
	name varchar(20)
);

create table books(
    book_id char(10),
    book_name varchar(20),
    book_price int
);

create table books(
    book_id char(10),
    book_name varchar(20) default 'unknow',
    book_price int
);
create table Persons(
    per_id char(10),
    per_name char(12),
    per_age int(3),
    per_tele char(10),
    primary key(per_tele)   --   最后指定
);

create table books(
    book_id char(10),
    book_name varchar(20) primary key default 'unknow',
    book_price int
);
insert into books (book_id,book_price)values ('123',15);
insert into books (book_id,book_price)values ('456',20);
create table types(
    type_id int primary key auto_increment,
    type_name varchar(20),
    type_remark char(11)
);

insert into types values (null,'123','20');
insert into types values (null,'456','20');
insert into types (type_name,type_remark)values ('789','20');
delete from types where type_name = '456';

insert into types values (null,'000','20');
insert into types values (10,'333','20');

create table grades(
	stu_name char(10),
	stu_class char(5),
	stu_grade int,
	primary key(stu_name,stu_class)  --  stu_name 和 stu_class 一起 定义主键
);

delete from class where id = 3;
delete from class where id = 4;

delete from student;