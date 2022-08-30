-- 查看数据库

show databases;

-- 创造数据库 

create database exists <name>;
create database if not exists <name>;

-- 删除数据库

drop database <name>;
drop database if exists <name>;


-- 查看数据库编码集

show create database <name>;

-- 按指定编码集创建数据库

create database <name> character set utf-8; -- utf-8 是一种编码集

-- 修改数据库的编码集

alter database <name> character set uft-8;

--打开一个数据库

use <name>;

-- 查看数据库下有的表

show tables;

-- 创建一张数据表
-- 我们的表名于SQL冲突，我们使用 反引号 将其括起来，就可以了

create table scores(
stu_name varchar(20),
stu_id varchar(20),
chinise decimal(4,2),
earth decimal(4,2),
english decimal(4,2)
);

-- 查看表结构

desc <表名>;

-- 修改表名

alter table <oldName> rename to <newName>;  -- to 也可以省略

-- 修改表的字符集

alter table <name> character set utf-8;

-- 增加一个字段
alter table <name> add <字段>;  

-- 删除一个字段
alter table <name> drop <字段名>

-- 增加数据

insert into table  <name> values(插入的数据); -- into 可以省略

create table if not exists exam_result(
id int,
name varchar(20),
chinese decimal(3,1),
math decimal(3,1),
english decimal(3,1)
);


insert into exam_result values(0,'孙仲谋',89.0,34,32);
insert exam_result values(1,'唐三藏',90,58.9,99.0);
insert into exam_result values(2,'曹操',NULL,34,32),(3,'孙悟空',20.0,100,90.0);

insert into exam_result (id,name,chinese)values(4,'猪八戒',90),(5,'沙和尚',20.0);
insert into exam_result values(5,'哪吒',20.0,100,90.0);
insert into exam_result values(6,'雷神',20.0,100,90.0);
insert into exam_result values(6,'风神',21.0,10,90.0);

-- 排序 

select * from exam_result order by math asc; 
select name,math+chinese+english as total from exam_result order by total desc limit 3;


update <表名> set <列名1> = <新数据>, <列名1> = <新数据> where 语句