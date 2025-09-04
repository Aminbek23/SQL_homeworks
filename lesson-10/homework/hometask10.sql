
--task 1
select emp.Name, dep.DepartmentName , emp.Salary from Employees as emp
inner join Departments as dep
on emp.DepartmentID=dep.DepartmentID
where emp.Salary>50000

--task 2
select Customers.FirstName,Customers.LastName, Orders.OrderDate from Customers
inner join Orders
on Customers.CustomerID=Orders.CustomerID
where Orders.OrderDate like '2023%'

--task 3
select emp.Name,dep.DepartmentName from Employees as emp
left join Departments as dep
on emp.DepartmentID=dep.DepartmentID

--task 4
select pro.ProductName,sup.SupplierName  from Products as pro
right join  Suppliers as sup
on pro.SupplierID=sup.SupplierID

--task 5
select*from Orders as ord
full join  Payments as pay
on ord.OrderID=pay.OrderID

--task 6
select 
e.Name as EmployeeName,
m.Name as ManagerName
from Employees e
left join Employees m
on e.ManagerID = m.EmployeeID

--task 7
select st.Name, cour.CourseName from Enrollments as enr
inner join Students as st
on enr.StudentID=st.StudentID
inner join Courses as cour
on cour.CourseID= enr.CourseID
where cour.CourseName ='Math 101'

--task 8
select Customers.FirstName, Customers.LastName,Orders.Quantity from Customers
inner join  Orders
on Customers.CustomerID=Orders.CustomerID
where Orders.Quantity > 3

--task 9
select Employees.Name, Departments.DepartmentName from Employees
inner join Departments
on Employees.DepartmentID=Departments.DepartmentID
where Departments.DepartmentName = 'Human Resources'

--task 10
select dep.DepartmentName,count(emp.DepartmentID) as EmployeeCount from Employees as emp
inner join Departments as dep
on emp.DepartmentID=dep.DepartmentID
group by dep.DepartmentName
having count(emp.DepartmentID)>5

--task 11
select Products.ProductID, Products.ProductName from Products
left join  Sales
 on Products.ProductID=Sales.ProductID
 where Sales.ProductID is null

 --task 12
 select Customers.FirstName,Customers.LastName , sum(orders.quantity) as TotalOrders from Customers
 inner join Orders
 on Customers.CustomerID=Orders.CustomerID
 group by Customers.FirstName,Customers.LastName 
 having sum(orders.quantity)>=1

 --task 13
select Employees.Name, Departments.DepartmentName from Employees
inner join Departments
on Employees.DepartmentID=Departments.DepartmentID

--task 14
select 
    e1.Name as Employee1,
    e2.Name as Employee2,
    e1.ManagerID
from Employees e1
join Employees e2
    on e1.ManagerID = e2.ManagerID
    and e1.EmployeeID < e2.EmployeeID

--task 15
select Orders.OrderID, Orders.OrderDate, Customers.FirstName,Customers.LastName from Orders
inner join customers
on Orders.CustomerID=Customers.CustomerID
where Orders.OrderDate like '2022%'

--task 16
select Employees.Name, Employees.Salary, Departments.DepartmentName from Employees
inner join Departments
on Employees.DepartmentID=Departments.DepartmentID
where Employees.Salary > 60000 and 
Departments.DepartmentName = 'Sales'

--task 17 
select Orders.OrderID, Orders.OrderDate, Payments.PaymentDate,Payments.Amount from Orders
inner join Payments
on Orders.OrderID=Payments.OrderID

--task 18
select Products.ProductID,Products.ProductName from Products
left join Orders
on Products.ProductID=Orders.ProductID
where Orders.ProductID is null  

--task 19
select 
    name  as EmployeeName,
    Salary
from Employees e
where Salary > (
    select avg(Salary)
    from Employees
    where DepartmentID = e.DepartmentID
)

--task 20 
select Orders.OrderID,  year(Orders.OrderDate) as year_data from Orders
left join Payments
on Orders.OrderID=Payments.OrderID
where Payments.OrderID is null and
 year(Orders.OrderDate) <2020

 --task 21
 select Products.ProductID, Products.ProductName from Products
 left join Categories
on Products.Category=Categories.CategoryID
where Categories.CategoryID is null

--task 22
select 
    e1.Name as Employee1,
    e2.Name as Employee2,
    e1.ManagerID,
    e1.Salary
from Employees e1
join Employees e2
    on e1.ManagerID = e2.ManagerID
    and e1.EmployeeID < e2.EmployeeID 
where e1.Salary > 60000
  and e2.Salary > 60000

  --task 23
select Employees.Name, Departments.DepartmentName from Employees
inner join Departments
on Employees.DepartmentID=Departments.DepartmentID
where Departments.DepartmentName like 'M%'

--task 24
select Sales.SaleID,Products.ProductName, Sales.SaleAmount from Products
inner join Sales
on Products.ProductID=Sales.ProductID
where Sales.SaleAmount>500

--task 25
select st.StudentID, st.Name from Enrollments as enr
inner join Students as st
on enr.StudentID=st.StudentID
inner join Courses as cour
on cour.CourseID= enr.CourseID
where cour.CourseName !='Math 101'

--task 26
select Orders.OrderID, Orders.OrderDate,Payments.PaymentID from Orders
left join Payments
on  Orders.OrderID=Payments.OrderID
where Orders.ProductID is null

--task 27
select*from Products
inner join Categories
on Products.Category=Categories.CategoryID
where Categories.CategoryName = 'Furniture' or
Categories.CategoryName = 'Electronics'
