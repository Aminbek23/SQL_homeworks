--task 1
select ProductName as Name
from Products

--task 2
select*from Customers as Client

--task 3
select ProductName from Products
union
select ProductName from Products_Discounted

--task 4
select  ProductName from Products
intersect
select ProductName from Products_Discounted  

--task 5
select distinct FirstName, LastName , Country
from Customers                             

--task 6
 select*,
 case when price>1000 then 'High'
      when price<1000 then 'Low' end as PriceCategory
from Products

--task 7
select *, 
iif (stockquantity>100, 'Yes' , 'No') as IsAvaible
from Products_Discounted

--task 8
select ProductName from Products
union
select ProductName from Products_Discounted

--task 9
select ProductName from Products
except
select ProductName from Products_Discounted

--task 10
select*,
iif (price>1000, 'Expensive', 'Affordable') as PriceLevel
from Products

--task 11
select*from Employees
where age < 25 or Salary>60000

--task 12
 select * ,
 salary * 1.1 as NewSalary
 from Employees
where DepartmentName='HR' or EmployeeID = 5

--task 13
select*,
case 
when SaleAmount>500 then 'Top Tier'
when SaleAmount between 200 and 500 then 'Mid Tier'
 else 'Low Tier'  end as  PriceLevel
 from Sales

 --task 14
 select CustomerID from Orders
 except
 select CustomerID from Sales

 --task 15
 select CustomerID, Quantity,
 case when Quantity=1 then '3%' 
 when Quantity between 1 and 3 then '5%' 
 else '7%' end as DiscountPercentage
 from Orders
