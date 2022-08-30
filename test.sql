-- 这是订单表
create table if not exists goods(
	goods_id int,
	goods_name varchar(50),
	unit_price decimal(7,2),
	category varchar(50),
	provider varchar(50)
);

-- 插入
-- into 可以省略
insert into goods values(1,'test',500.3,'buy','buyer');
-- 指定列插入  要是我们不指定列插入会报错
insert into goods (goods_id,goods_name)values(2,'曲康杰');
--查看表所有的内容
select * from goods;

-- 要想正确插入中文   要修改配置文件 my.ini 文件
--"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" "--defaults-file=C:\ProgramData\MySQL\MySQL Server 5.7\my.ini" "-uroot" "-p" "--default-character-set=utf8"
--C:\ProgramData\MySQL\MySQL Server 5.7  这就是我的配置文件  
-- 一定要小心  复制一份

-- 插入多组数据
insert into goods (goods_id,goods_name)values(3,'qkj'),(4,'曲康利');
--(0.00 sec)  这是时间   秒   60ms对于计算机来说很慢  
--  2 rows affected 两行数据被修改

-- 关系型数据库 就是这么慢 牺牲保护有效

--第二课
--插入多行是相对于不完全插入的的吧   不是的   我们插入的数据之间要有空格
insert goods (goods_id,goods_name)values(6,'qu'),(7,'kj');
insert goods values(9,'qu',100.00,'buy','buyer'),(10,'test',500.3,'buy','1');
--查找   最难的   不是难是复杂
--查找有很多方法  我们学的是比较常见的


select * from <表名>  --这个语句最好崽测试环境  不要生产环境

-- 办公环境    进公司  笔记本  台式机
-- 开发环境    服务器  Linux 
-- 测试环境    服务器  Linux  64G 16核     
-- 以上三个称为线下环境   

-- 生产环境    普通用户就可以直接使用   服务器是最好的    分布式  不要再生产环境中修改  压力很大

--第二个查找  指定列查找
select <列名> from <表名>;
select  goods_id from goods;    -- 二五幺事件
select  goods_id ,goods_name from goods;   --列与列与逗号分隔开 

-- 查找某列并使用表达试

select goods_name,goods_id + unit_price from goods;

--查找某一列并在基础上加10
select goods_id+10,goods_name from goods;
select goods_name,goods_id+10 from goods; --记住并不会修改原始数据  只是打印时改变




-- 注意表达式计算的结过不一定和原来的数据的类型相同   尽量保证数据的准确性
select goods_name,goods_id + unit_price as total from goods;  --将goods_id + unit_price加起来列名改为total   其中as可以省略


-- 列求和  同一行若干列加在一起 
-- 行求和  同一列若干行加在一起


--去重查找
select distinct goods_name from goods;  -- distinct  
-- 指定多列去重   一摸一样才去重  

--排序

select * from goods order by goods_id asc;  -- 默认是升序排序也可以指定 ASC
select goods_name from goods order by goods_id desc;  -- desc表示降序


--更加复杂  表达时


select goods_id+unit_price as total from goods order by goods_id+unit_price;

--多列排序

-- 条件查询

--比较相等  
select * from goods where unit_price <=> null;


select * from goods where unit_price is not null;

-- 查找500
select * from goods where unit_price <501;   --里面为空的不计算在内

-- where不能使用别名

-- 再sql中如果针对null进行运算都是null
--一般工作中的数据库很少使用null

--in(11,23,2,222)  在这里面的都给我找出来

-- 模糊匹配  看列之间是不是是不是相似 一般不太建议使用   效率较低

--搭配通配符

--模糊匹配也可以针对数字

-- 复杂  最左原则 谁干掉的数据多  谁在左边





-- 分页查找

select * from goods; -- 不在生产环境  除了条件查找 

-- 最保险的就是分页   去一部分

-- 100000     ->    20

--核心limit

--+limit 3 前三个元素
--+limit 3  offset 3 从第四个开始计算往下去三个   可以当成下标

--要是limt 数字太大 没有错误
-- 如果offset过大 也不影响


-- 修改操作

--update 每次修改几行数据是不确定的   要看where



-- 详解sql数据库的查找

create table if not exists exam_result(
id int,
name varchar(20),
chinese decimal(3,1),
math decimal(3,1),
english decimal(3,1)
);


insert into exam_result values
(1,'唐三藏',67.8,78.9,89.1),
(2,'孙悟空',50.5,78,99.5),
(3,'猪八戒',90,15,60.0),
(4,'沙和尚',69.0,77.2,88.2),
(5,'曹孟德',65.2,85.0,99.0),
(6,'关云长',66.0,10.0,90),
(7,'李七夜',72,79.0,78.0)
;

insert exam_result (id,name,math,english) values (8,'帝尊',99,99);


select* from  exam_result;
select * from  exam_result;

select* from  goods;

-- 插入
insert into [表名] values ()   -- 全部插入
insert into [表名] (插入的列名)values ()   -- 部分插入
insert into [表名] values (),(),().....    --  多行插入

-- 全局查找
select* from  exam_result;

--单行查找
select id from exam_result;
-- 多行查找
select id,name from exam_result;

-- 表达式查找
select id+10 from exam_result;

select id+10,math+1000 from exam_result; -- 表达式结果尽量得到正确的

-- 计算多列 各列相加

select name,math+english+chinese from exam_result;
-- 添加as  指定别名  可以省略
select math+english+chinese as tatal from exam_result;

-- 删除数据
delete from exam_result where name = 'xxx';

-- 去重查找
insert exam_result (id,name,math,english) values (9,'帝尊',99,99);

select distinct id,math from exam_result;   -- 去重查找得到的行数可能不一样   多行去重  先去首选项
select distinct name,math from exam_result; -- 一旦你使用去重  列都要放到distinct 之后

 
-- 排序
select * from exam_result order by chinese asc;  -- 默认是升序排序也可以指定 ASC
select * from exam_result order by chinese desc;  --  DESC 是降序

select id,name,math+english+chinese as tatal from exam_result order by tatal;




-- 多列排序
-- 优先级不一样   
-- 记住我们尽量最快得到数据

-- NULL 被认为是最小的   任何数据和null相加  都是null

--条件查询
select * from exam_result where chinese is not null;

-- in 代表若干选项的一个

-- like 模糊匹配

-- 搭配通配符 % _

--% 任意长度
--查找 帝xx
select * from exam_result where name like '帝%';
select * from exam_result where name like '帝_';

-- 模糊匹配数字

select * from exam_result where chinese like '9%';

select * from exam_result where chinese <=> null;

-- and 和 or 同时出现   and的优先级更高  不过我们都加上括号



-- 分页查找
--+limit 3 前三个元素
--+limit 3  offset 3 从第四个开始计算往下去三个   可以当成下标




-- 修改

update [表名] set [列名] = 修改的值,[列名] = 修改的值,[列名] = 修改的值 where 语句


update exam_result set chinese = 80 where id = 8 OR id = 9 ;

--
update exam_result set math = math+10 order by chinese+math+english asc limit 3; 