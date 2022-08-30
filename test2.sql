-- 删除操作
delete from [表名] where [条件]
delete from exam_result where id = 9;  -- 不要乱删  一般手段恢复不了   有可能会爆表  存在此盘中  根据的数据的重要性，决定是定期清理还是备份到其他地方

-- 数据库也有设置权限功能  有专门的人管理DAB 技术水平很高 钱多事少的岗位




--进阶 
--约束
desc [表名]


--非空约束 NOT NULL

create table if not exists student(
id int not null,
tele varchar(20) unique,
name varchar(20),
secore decimal(3,1)
);

-- default 指定默认值  default 'unknow'

-- 如何保证主键不重复

-- 自增 
primary key auto_increment

--我们将他列为空

-- 表的设计


--多对多
--多表查询
--新增
create table user (
	id int primary key auto_increment,
	name varchar(20),
	decription varchar(1000)
);
insert into user values(null,'曹操','乱世奸雄'),(null,'刘备','仁德之主'),(null,'孙权','年少有为');

create table user2 (
	id int primary key auto_increment,
	name varchar(20),
	decription varchar(1000)
);

--将user表中的数据导入user2中

insert user2 select id,name,decription from user ;

-- 子查询的列的数目类型多少一直

--多个sql进行拼装  会得到很多复杂的sql  一个sql就几百行代码  我们不建议

--查询

-- 聚合查询
--借助sql的内置的函数

--COUNT  计算结果的行数

select count(*) from user;
select count(name) from user;
select count(id) from user;
-- 记住count不计算null的值 (我的好象计算) 后面也不能有空格  当成列名了

insert into user values(null,'null','null');
select sum(id) from user; --行和
select avg(id) from user; --平均值
select max(id) from user; --
select min(id) from user; --

--可以搭配where子句  过滤作用

