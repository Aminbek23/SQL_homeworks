--puzzle 1
 --1
select distinct col1, col2 
from InputTbl
--2
select col1, col2
from InputTbl
group by col1, col2

--puzzle 2
select*from TestMultipleZero
where A<>0 or B<>0 or C<>0 or D<>0

--puzzle 3
select id, name  from section1
where id%2=1

--puzzle 4
select top 1* from section1
order by id asc

--puzlle 5
select top 1* from section1
order by id desc

--puzzle 6
select* from section1
where  name like 'B%'

--puzzle 7
select*from ProductCodes
where code like '%[_]%'
