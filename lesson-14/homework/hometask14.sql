--Easy tasks
--task 1
select left(name,CHARINDEX(',',name)-1)as FirstName,
substring(name,CHARINDEX(',',name)+1, len(name)) as LastName
from TestMultipleColumns

--task 2
select * from TestPercent
where  PATINDEX('%[%]%',strs)>0

--task 3
select PARSENAME(vals,'1') as part1,PARSENAME(vals,'2') as part2 from Splitter

--task 4
declare @id  varchar(50)='1234ABC123456XYZ1234567890ADS'
select @id= replace(@id, '1','x');
select @id= replace(@id, '2','x');
select @id= replace(@id, '3','x');
select @id= replace(@id, '4','x');
select @id= replace(@id, '5','x');
select @id= replace(@id, '6','x');
select @id= replace(@id, '7','x');
select @id= replace(@id, '8','x');
select @id= replace(@id, '9','x');
select @id= replace(@id, '0','x');
select @id as result

--task 5
select*from testDots
where len(vals)-len(replace(vals,'.',''))>2

--task 6
select*,len(texts)-len(replace(texts,' ','')) as len_space from CountSpaces

--task 7
select emp1.Name as m_name, emp1.Salary as m_salary,
emp2.Name as w_name, emp2.Salary as w_salary
from Employee as emp1
inner join Employee as emp2
on emp1.Id=emp2.ManagerId
where emp1.Salary<emp2.Salary

--task 8
select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,DATEDIFF(year,HIRE_DATE, GETDATE()) as YearsOfService from Employees
where DATEDIFF(year,HIRE_DATE, GETDATE()) between 10 and 15


--Medium Tasks
--task 1
declare @str varchar (50) = 'rtcfvty34redt',
@checker int=1, @number varchar(30)='', @letters varchar(30)= ''

while @checker <= len(@str)
begin
      if ascii(substring(@str,@checker,1)) between 48 and 57
	  set @number=@number+substring(@str,@checker,1)
	  else if ascii(substring(@str,@checker,1)) between 97 and 122
	  set @letters=@letters+substring(@str,@checker,1)

	    set @checker=@checker+1
end
  select @number as numbers, @letters as letters 


--task 2
--SQL so‘rovini yozing, barcha sanalarning Id larini topish uchun,
--agar ularning harorati oldingi (kechagi) kunga nisbatan yuqori bo‘lsa. (weather)
select*from weather
join bn
--task 3 SQL so‘rovini yozing, har bir o‘yinchi uchun birinchi login sanasini ko‘rsatish uchun. (Activity)
select*from Activity
min  group by bn
--task 4 
 select SUBSTRING(fruit_list,CHARINDEX(',',fruit_list,CHARINDEX(',',fruit_list)+1)+1,
 CHARINDEX(',',fruit_list,CHARINDEX(',',fruit_list,CHARINDEX(',',fruit_list)+1)+1-
 CHARINDEX(',',fruit_list,CHARINDEX(',',fruit_list)+1)-1))
 as fruit  from fruits

--task 5 
declare @str varchar(50) ='sdgfhsdgfhs@121313131',
@checker int=1, @number varchar(30)=' ', @letter varchar(30)=' ', @symbol varchar(30)=' '
while @checker<=len(@str)
 begin 
 if ascii(substring(@str,@checker,1)) between 48 and 57
set @number=@number+substring(@str,@checker,1)
 else if ascii(substring(@str,@checker,1)) between 97 and 122
 set @letter=@letter+substring(@str,@checker,1)
 else set @symbol=@symbol+substring(@str,@checker,1)
 set @checker=@checker+1
 end
 select @number as number , @letter as letter, @symbol as symbol

--task 6
  select p1.id,
  case when p1.code=0 then p2.code
  else p1.code  end as code
  from p1
  join p2 on p2.id=p1.id
 

--task 7 
select *,DATEDIFF(year,HIRE_DATE, GETDATE()) as YearsOfService,
case when DATEDIFF(year,HIRE_DATE, GETDATE())<1 then 'Yangi Xodim'
 when DATEDIFF(year,HIRE_DATE, GETDATE()) between 1 and 5 then 'Junior'
  when DATEDIFF(year,HIRE_DATE, GETDATE()) between 5 and 10 then 'O''rta Daraja'
  when DATEDIFF(year,HIRE_DATE, GETDATE()) between 10 and 20 then 'Katta Daraja'
  when DATEDIFF(year,HIRE_DATE, GETDATE())>20 then 'Veteran'
  else 'bunday ishchi mavjud emas' end as years
from Employees

--task 8 
select left(vals,patindex('%[^0-9]%',VALS+'a')-1) from GetIntegers 

--Difficult Tasks

--task 1 Ushbu jumboqda sizga vergul bilan ajratilgan satrdagi birinchi ikkita harfni almashtirish vazifasi berilgan.
--(MultipleVals)
select*
from MultipleVals

stuff and substring

--task 2 SQL so‘rovi yozing, u har bir o‘yinchi uchun birinchi kirgan qurilmani qaytarsin. (Activity
select *from Activity
row number bn
--task 3 Sizga sales jadvali berilgan. Har bir moliyaviy hafta uchun hudud bo‘yicha haftadan haftaga sotuvlar foizini 
--hisoblang. Har bir hafta uchun jami sotuvlar 100% deb olinadi, va haftaning har bir kuni uchun foiz sotuvlar 
--shu hafta hudud sotuvlariga nisbatan hisoblanadi. (WeekPercentagePuzzle)

select *from WeekPercentagePuzzle
