--task 1
select top 5 *  from Employees

--task 2
select distinct Category from  Products

--task 3
select * from Products
where Price >100

--task 4
 select * from Products
 where FirstName like 'A%'

 --task 5
 select*from Products
 order by Price asc
 
 --task 6
 select* from Employees
 where  salary > 60000 and DepartmentName ='HR'

 --task 7
alter table Employees
add constraint  DF_Employees_Email default 'noemail@example.com' for email

 --task 8
 select*from Products
 where Price between 50 and 100

 --task 9
select distinct Category, ProductName from Products

--task 10
select distinct Category, ProductName from Products
order by  ProductName desc

--task 11
 select top 10 *from  Products
 order by Price desc

--task 12
select coalesce ( FirstName, LastName) as Fullname 
from Employees

--task 13
select distinct category, price from Products

--task 14
 select* from Employees
 where age between 30 and 40  or DepartmentName ='Marketing'

 --task 15
 select * from Employees
 order by salary desc offset 10 rows  fetch next 10 rows only

 --task 16
 select*from Products
 where Price<=1000 and StockQuantity>50
 order by StockQuantity asc 
 
 --task 17
 select*from Products
 where ProductName like '%e%'

 --task 18
 select* from Employees
 where DepartamentName in ('HR', 'IT', 'Finance')

 --task 19
 select*from Customers 
 order by City asc, PostalCode desc

 --task 20
 select top 5 * SalesAmount  from Sales
 order by SalesAmount desc

 --task 21
 select FirstName + ' ' + LastName as Fullname
 from Employees
 
 --task 22
 select distinct Category, ProductName, Price  from Products
 where Price > 50

 --task 23
 select*from Products
 where Price < 0.1*(select(avg(Price) from Products)

 --task 24
 select* from Employees 
 where age < 30 and  DepartamentName in ( 'HR' , 'IT')

 --task 25
 select*from Customers
 where Email like '%@hmail.com'

 --task 26
 select * from Employees
 where Salary> all(select Salary from Employees where DepartamentName ='Sales'

 --task 27
 select * from Orders
 where Orderdate between   --oxirgacha tuldirilmagan
