-- 查找

create table myfriends(
id int,
name varchar(20),
birthday date,
tele varchar(11)
);

insert into myfriends values(1,'曲康杰',20011112,18337821735);
insert into myfriends values(2,'曲康利',20040102,NULL),
(3,'曲贯杰',NULL,NULL),
(4,'曲伟杰',NULL,NULL),
(5,'曲稼璐',NULL,NULL),
(6,'曲全斌',NULL,NULL),
(7,'曲全谱',NULL,NULL);

select distinct <字段名> from <表名>;