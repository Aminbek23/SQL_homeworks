--task 1
select min(Price) as Min_price from Products

--task 2
select max(salary) as max_salary from Employees

--task 3
select count(*) as Customer_count from Customers

--task 4
select distinct Category from Products

--task 5
select sum(SaleAmount) as Total from Sales 
where ProductID = 7

--task 6
select avg(Age) as avg_age from Employees

--task 7
select  DepartmentName, count (*) total_employees from Employees
group by DepartmentName


--task 8
select  Category, min(price) as min_price, max(price) as max_price from Products
group by Category

--task 9
select CustomerID, sum (SaleAmount) as Total_sale from Sales
group by CustomerID

--task 10
select DepartmentName ,count (*) as Total_employes from Employees
group by DepartmentName
having count (*)>5

--task 11
select ProductID , sum(SaleAmount) as sum_sale_amount, avg(SaleAmount) as avg_ale_amount from Sales
group by ProductID

--task 12
select DepartmentName, count(*) as sum_employees from Employees
where DepartmentName ='HR'
group by DepartmentName

--task 13 
select DepartmentName, max(Salary) as max_salary, min(Salary) as min_salary from Employees
group by DepartmentName

--task 14
select DepartmentName , avg(Salary) as avg_salary from Employees
group by DepartmentName

--task 15 
select DepartmentName , avg(Salary) as avg_salary, count(*) as count_employee  from Employees
group by DepartmentName

--task 16
select Category, avg(price) as avg_price 
from Products
group by Category
having avg(price)>400

--task 17
select year(SaleDate) as Sale_year , sum(SaleAmount) as total_sales 
from Sales
group by year(SaleDate) 

--task 18
select CustomerID, count (ProductID) as Total from Sales
group by CustomerID
having count (ProductID)>=3

--task 19 
select DepartmentName , avg(salary) as avg_salary from Employees
group by DepartmentName
having avg(salary)>60000

--task 20
select Category , avg(price) as avg_price from Products
group by Category
having  avg(price) >150

--task 21
select CustomerID, sum (SaleAmount) as total from Sales
group by CustomerID
having  sum (SaleAmount)>1500

--task 22
select DepartmentName, sum(salary) as sum_salary, avg(salary) as avg_salary from Employees
group by DepartmentName
having avg(salary)>65000

--task 23
select custid sum(case when freight > 50 then freight else 0 end) as sum freight ,  min(freight) as min_freight from sales.orders 
group by custid


--task 24
select month(OrderDate) as month_OrderDate ,sum(TotalAmount) as Sum_TotalAmount, sum(Quantity) as sum_quantity from Orders
group by month(OrderDate)
having sum(Quantity)>=2

--task 25
select year(OrderDate) as year_OrderDate, min(TotalAmount) as min_TotalAmount, max(TotalAmount) as max_TotalAmount from Orders
group by year(OrderDate)
