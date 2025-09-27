
--task 1 
select*from #RegionSales as rs 

--task 2
select m.id, m.name, count(e.id) cnt  from Employee m
join Employee e
on e.managerId=m.id
group by  m.id, m.name
having count(e.id)>=5

--task 3
select product_name, total_unit from Products
join (select product_id,sum(unit) total_unit from Orders
where month(order_date) =2
group by product_id
having sum(unit) >=100) as  ord
on Products.product_id=ord.product_id

--task 4  bajarilmagan
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');

select*from Orders


 --task 5
  declare @Check_Prime int=91
  if @Check_Prime%1=0  and @Check_Prime%@Check_Prime=0
  print 'This number is prime'
  else print 'This number is not prime'
 
 --task 6 bajarilmagan
 CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');

select*from Device

--task 7
select*from Employee as emp1
where salary >(select  avg(salary) from Employee as emp2 where emp1.DeptID=emp2.DeptID)

--task 8
;with cte as
(
select Tickets.TicketID, count(numbers.number) as cnt_number from Tickets
left join Numbers
on Tickets.Number=Numbers.Number
group by Tickets.TicketID
)
 select sum(
 case when cnt_number = 3 then '100'
 when cnt_number between 1 and 3 then '10'
 else 0 end) as  jami_yutuq
 from cte

 --task 9
;with cte as
(
select spend_Date,user_id,
sum(case when platform='mobile' then amount else 0 end) as mobilespend,
sum(case when platform='deskopt' then amount else 0 end) as deskoptspend
from spending
group by spend_Date,user_id
), 
cte2 as
(
select spend_Date,user_id,
case when mobilespend>0 and deskoptspend>0 then 'both'
when mobilespend>0  then 'mobile' 
else 'deskopt' end as checked,
(mobilespend+deskoptspend) as total
from cte
)
select Spend_date, checked,
sum(total) as total_amount,
count(distinct user_id) as total_users
from cte2
group by  spend_date,checked
order by spend_date,
case checked
when 'mobile' then 1
when 'deskopt' then 2
when 'both' then 3 end



--task 10
;WITH MaxQ AS (
    SELECT MAX(Quantity) AS max_q
    FROM Grouped
),
Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers, MaxQ
    WHERE n < MaxQ.max_q
)
SELECT 
    g.Product,
    1 AS Quantity
FROM Grouped g
JOIN Numbers n 
  ON n <= g.Quantity
ORDER BY g.Product
OPTION (MAXRECURSION 0);
