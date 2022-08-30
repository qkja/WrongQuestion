drop table if exists student,course,classes;

create table classes(
id int primary key auto_increment,
name varchar(30),
`desc` varchar(100)
);

create table student(
id int primary key auto_increment,
sn varchar(20), 
name varchar(30),
qq_mail varchar(30),
classes_id int
);

create table course (
id int primary key auto_increment,
name varchar(30)
);

create table score(
score decimal(5,2),
student_id int,
course_id int 
);





insert into classes(name, `desc`) values
('计算机系2019级1班', '学习了计算机原理、C和Java语言、数据结构和算法'),
('中文系2019级3班','学习了中国传统文学'),
('自动化2019级5班','学习了机械自动化');

insert into course(name) values
('Java'),('中国传统文化'),('计算机原理'),('语文'),('高阶数学'),('英文');








create table `user` (
id int,
score decimal(3,1)
);

insert `user` values(1,22),(NULL,10,),(3,60);


select student.id,student.name ,course.id,course.name ,score.score from student,course,score;

select student.id,student.name ,course.id,course.name ,score.score from student,course,score
where student.id = score.student_id;

select student.id,student.name ,course.id,course.name ,score.score from student,course,score
where student.id = score.student_id and score.course_id = course.id;

select student.id,student.name ,course.name as course_name,score.score from student,course,score
where student.id = score.student_id and score.course_id = course.id;

select student.id,student.name ,course.name as course_name,sum(score.score) from student,course,score 
where student.id = score.student_id and score.course_id = course.id group by student.name;



create table emp(
id int primary key auto_increment,
name varchar(20) not null,
role varchar(20) not null,
salary numeric(11,2)
);
insert into emp(name, role, salary) values
('马云','服务员', 1000.20),
('马化腾','游戏陪玩', 2000.99),
('孙悟空','游戏角色', 999.11),
('猪无能','游戏角色', 333.5),
('沙和尚','游戏角色', 700.33),
('隔壁老王','董事长', 12000.66);


select role ,max(salary),min(salary),avg(salary) from emp group by role;

select role,avg(salary) from emp group by role having avg(salary) > 1000;

select
stu.sn,
stu.name,
stu.qq_mail,
sum( sco.score )

from  student stu join score sco on stu.id = sco.student_id
group by
sco.student_id;

--查询出来的都是有成绩的同学，“老外学中文”同学 没有显示

select * from student stu join score sco on stu.id=sco.student_id;

-- 学生表、成绩表、课程表3张表关联查询
SELECT
stu.id,
stu.sn,
stu.NAME,
stu.qq_mail,
sco.score,
sco.course_id,
cou.NAME
FROM
student stu
JOIN score sco ON stu.id = sco.student_id
JOIN course cou ON sco.course_id = cou.id
ORDER BY
stu.id;

select * from score sco where exists (select sco.course_id from course cou
where (name='语文' or name='英文') and cou.id = sco.course_id);

select * from score sco where exists (select sco.course_id from course cou
where (name='语文' or name='英文'));

select * from score where course_id in (select id from course where (name = '语文' or name = '英文'));

SELECT
s1.*
FROM
score s1,
score s2
WHERE
s1.student_id = s2.student_id AND s1.score < s2.score
AND s1.course_id = 1
AND s2.course_id = 3;

select * from course where id < 3 union select * from course where name = 'java';
select * from course where id < 3 union all select * from course where name = 'java';