-- 使用 左连接
select Person.firstName,Person.lastName,Address.city, Address.state 
from Person left join Address on Address.personId = Person.personId ;

-- 分页查找  默认是 升序 这里改成降序 还要 去重
select distinct salary as SecondHighestSalary from Employee order by salary desc limit 1 offset 1;
-- 这里 还要防止 没有第二高 自连接
select (select distinct salary as SecondHighestSalary from Employee order by salary desc limit 1 offset 1;)