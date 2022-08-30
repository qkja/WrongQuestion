-- 设计一张商品表，包含以下字段：、
-- 商品名称、商品价格、商品库存、商品描述

create table if not exists goods(
goods_name varchar(100),
goods_price decimal(4,2),
goods_stock int,
goods_desc varchar(100)
);

--删除商品表中，价格大于60，或者是库存小于200的记录


delete from goods where goods_price > 60 or goods_stock < 200;
--在以上创建的商品表中插入一条数据：
--名称为“学生书包”、价格18.91、库存101、描述为空

insert into goods values('学生书包',18.91,101,NULL);

--修改所有库存大于30的商品记录，将价格增加50块
update goods set goods_price = goods_price + 50 where goods_stock > 30;

-- 设计一张老师表，
-- 包含以下字段：姓名、年龄、身高、体重、性别、学历、生日、身份证号
create table if not exists teacher(
name varchar(20),
age int,
high decimal(3,2),
weight decimal(5,2),
sex char(2),
education varchar(20),
birthday varchar(20),
id varchar(20) unique
);

-- 设计一张图书表，
-- 包含以下字段：图书名称，图书作者、图书价格、图书分类
create table if not exists book(
name varchar(20),
author varchar(20),
price decimal(5,2),
typebook varchar(200)
);


--在图书表中新增一条记录：
--Java核心技术、作者“Cay S. Horstman”，价格56.43，分类为“计算机技术”
insert book values('Java核心技术','Cay S. Horstman',56.43,'计算机技术');
--修改“Java核心技术”的图书信息，将价格修改为61
update book set price = 61 where name = 'Java核心技术';

--查询book图书表中，
--作者author列不为空，
--或者满足条件：价格price在50元以上且出版日期publish_date在2019年之后的图书信息

select * from books where (author is not null) or (price>50 and publish_date>2019);



--查询用户user表中，满足以下条件的用户数据：
--ID在1至200或300至500，且账号accout列不为空
--充值金额amount在1000以上。

select * from `user` where ((id betwwen 1 and 200) or (id betwwen 300 and 500)) 
and (accout is not null and accout>1000);


--查询article文章表中，
--文章标题title为空，或者满足发表日期create_date在2019年1月1日之后

select * from article (title is null) or (create_date > 20190101);

--查询article文章表中，
--发表日期create_date在2019年1月1日上午10点30分至2019年11月10日下午4点2分的文章

select * from article (create_date > '2019-01-01 10:30:00') or (create_date < '2019-11-10 16:02:00');

--student学生表中，
--字段有姓名name，年龄age，要求查询姓张，并且年龄在18到25岁之间的学生

select * from student where (age between 18 and 25) and (name like '张%');