DROP TABLE IF EXISTS exam_result;
CREATE TABLE exam_result (
id INT,
name VARCHAR(20),
chinese DECIMAL(3,1),
math DECIMAL(3,1),
english DECIMAL(3,1)
);

INSERT INTO exam_result (id,name, chinese, math, english) VALUES
(1,'唐三藏', 67, 98, 56),
(2,'孙悟空', 87.5, 78, 77),
(3,'猪悟能', 88, 98.5, 90),
(4,'曹孟德', 82, 84, 67),
(5,'刘玄德', 55.5, 85, 45),
(6,'孙权', 70, 73, 78.5),
(7,'宋公明', NULL, 65, 30);

SELECT id FROM <表名>;

SELECT id + id ,name,math+100 FROM exam_result;

SELECT id + id as twoid ,name,math+100 FROM exam_result;

INSERT INTO exam_result (id,name, chinese, math, english) VALUES
(7,'宋公明', NULL, 65, 30),
(7,'吴用', NULL, 65, 30);

select <字段名1>, <字段名2>from <表名> where <判断语句>;
select name from exam_result where chinese <=> null;

select name from exam_result where chinese = null;

select * from exam_result where chinese > math;

select * from exam_result where chinese in(67,70.0,88.0);
select * from exam_result where chinese in(67,70.0,88.0) and chinese < math;

select id,name,chinese + math + english total from exam_result where total > 100;

select * from exam_result where name like '宋%';

update <表名> set <字段名1> = 新数据 , <字段名2> = 新数据 where 语句;

update exam_result set id = 9, chinese = 90 where name like '吴_';

delete from exam_result;