 --Easy tasks
 --task 1
 select CONCAT(employee_id,'-',FIRST_NAME,' ',LAST_NAME)  from Employees

--task 2
select replace(phone_number,124,999)  from Employees

--task 3
select first_name, len(first_name) as len_name  from Employees
where left(first_name,1) in ('a','j','m')
order by FIRST_NAME asc

--task 4
select MANAGER_ID, sum(salary) as sum_salary from  Employees
group by MANAGER_ID

--task 5
select Year1, GREATEST(max1,max2,max3) as top_ from TestMax

--task 6
select *from cinema
where  id%2=1 and description not like 'boring'

--task 7
select*from SingleOrder
order by case when id=0 then 1 else 0 end

--task 8
select id,coalesce(ssn,passportid,itin) from person

--Medium tasks
--task 1
select*,
left(fullname, CHARINDEX(' ', fullname)) as first_name,
SUBSTRING(fullname, CHARINDEX(' ', fullname, charindex(' ',fullname)+1), len(fullname)) as last_name,
SUBSTRING(FullName, charindex(' ', fullname)+1, 
CHARINDEX(' ',fullname,charindex(' ',fullname)+1)-charindex(' ', fullname)-1)   as middle_name
from Students

--task 2 
select *  from Orders
where DeliveryState ='TX' 
and CustomerID in (select CustomerID from Orders where DeliveryState ='CA')

--task 3  
select SequenceNumber,
STRING_AGG(string, ',') as qwerty 
from DMLTable
group by SequenceNumber

--task 4
select CONCAT_WS(' ', FIRST_NAME,LAST_NAME)as [Full  Name] from Employees
where len(CONCAT_WS(' ', FIRST_NAME,LAST_NAME))-len(replace(CONCAT_WS(' ', FIRST_NAME,LAST_NAME),'a',''))>=3

--task 5. 
select 
    DEPARTMENT_ID,
    count(*) as TotalEmployees,
    (select count(*) 
     from Employees e2
     where e2.DEPARTMENT_ID = e1.DEPARTMENT_ID
       and DATEDIFF(YEAR, e2.HIRE_DATE, GETDATE()) > 3
    ) * 100.0 / count(*) as PercentOver3Years
from Employees e1
group by DEPARTMENT_ID

--task 6. 
select 
   (select SpacemanID
    from Personal
    where MissionCount = (select MAX(MissionCount) from Personal)
   ) as min_SpacemanID ,

   (select SpacemanID
    from Personal
    where MissionCount = (select MIN(MissionCount) from Personal)
   ) as max_SpacemanID



--Difficult tasks

-- task 1 
 declare @str  varchar(50)='tf56sd#%OqH' ,
 @checker int= 1, @uppercase varchar(30)=' ', @lowercase varchar(30)= ' ', @integers varchar(30)=' ', @others varchar(30)=' '
  while @checker<=len(@str)
  begin
  if ascii(substring(@str,@checker,1)) between 38 and 57
	set @integers=@integers+substring(@str,@checker,1)
  else if  ascii(substring(@str,@checker,1)) between 65 and 90
  set @uppercase=@uppercase+substring(@str,@checker,1)
    else if  ascii(substring(@str,@checker,1)) between 97 and 122
  set  @lowercase=@lowercase+substring(@str,@checker,1)
  else  set @others=@others+substring(@str,@checker,1)
  set @checker=@checker+1
  end
    select @uppercase as uppercase, @lowercase as lowercase, @integers as integers , @others as others

--2. Students jadvalida har bir qatorni uning qiymati + undan oldingi barcha qatordagi
--qiymatlar yig‘indisi bilan almashtiring.
--3. Sizga berilgan jadvalda VARCHAR ustunda matematik tenglamalar bor.
--Ularni hisoblab, natijalarini chiqaring (Equations jadvali).

--task 4
select day(birthday) as day_, string_agg(Studentname,',') as students
from Student
group by day(birthday)
having COUNT(*) > 1

--task 5. 
select 
    case when PlayerA < PlayerB then PlayerA else PlayerB end as Player1,
     case when PlayerA < PlayerB then PlayerB else PlayerA end as Player2,
    sum(Score) as TotalScoreA,
    sum(Score) as TotalScoreB
from PlayerScores
group by
     case when PlayerA < PlayerB then PlayerA else PlayerB end,
     case when PlayerA < PlayerB then PlayerB else PlayerA end

