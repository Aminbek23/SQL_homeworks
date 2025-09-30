--task 1
create proc sp_createemployeebonus
as
begin

create table #EmployeeBonus(
EmployeeID int,
FullName varchar(100),
Department nvarchar(50),
Salary decimal(10,2),
BonusAmount decimal(10,2)
);

insert into #EmployeeBonus(EmployeeID, FullName, Department, Salary,BonusAmount)

 select emp.EmployeeID,
 CONCAT_WS(' ',FirstName,LastName) as FullName,
 emp.Department,
 emp.Salary,
 (emp.Salary*dep.BonusPercentage/100) as BonusAmount 
 from Employees emp
 join  DepartmentBonus dep
 on emp.Department=dep.Department;

 select * from #EmployeeBonus;
 
 end

 --task 2
  select * from Employees
  select * from DepartmentBonus

  alter  proc get_dep_name_and_bonus
  @department varchar(20),
  @bonuspercentage  float
  as
  begin
  update Employees 
  set Salary=Salary+(Salary*@bonuspercentage/100)
  where Department=@department;


  select emp.EmployeeID,
  CONCAT_WS(' ',FirstName,LastName) as FullName,
  emp.Department,
  emp.Salary
  from Employees emp
  where Department=@department;

  end

--task 3
 MERGE INTO Products_Current as Target
 USING Products_New As Source
 ON Target.productid=source.productid

 WHEN MATCHED AND Target.price<>Source.price then
 UPDATE SET Target.price=SOURCE.price

 when NOT MATCHED by Target then
 INSERT (productid, productname, price) values 
 (source.productid, source.productname,source.price)

 WHEN NOT MATCHED by Source then
 delete;

 --task 4
select id,
case
when p_id is null then 'Root'
when id in (select p_id from Tree where p_id is not null) then 'Inner'
else 'Leaf'
end as type
from Tree;


--task 5
SELECT s.user_id,
       IFNULL(ROUND(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) 
                    / COUNT(c.user_id), 2), 0) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
       ON s.user_id = c.user_id
GROUP BY s.user_id
ORDER BY s.user_id;

--task 6
select*from Employees
where Salary=(select min(salary) from Employees) 

--task 7
create proc GetProductSalesSummary @ProductID int
as
begin
select p.ProductName,
sum(s.Quantity) as Total_Quantity_Sold,
sum(s.Quantity*p.Price) as Total_sale_amount,
max(saledate) as First_Sale_Date,
min(saledate) as Last_Sale_Date
from Products p
join Sales s
on p.ProductID=s.ProductID
where p.productid=@ProductID
group by p.ProductName
end

