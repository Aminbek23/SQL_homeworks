--Easy 
--tasks 1
	;with cte as
	(
	select 1 as n
	union all
	select n+1 from cte
	where n <100
	)
	select*from cte

--task 2
 select firstname ,lastname, sum_sales from Employees
 join ( select EmployeeID,sum(salesamount) as sum_sales  from sales
  group by EmployeeID) as sum_sales_employee 
  on sum_sales_employee.EmployeeID=Employees.EmployeeID

--task 3
;with cte as
(
select  avg(salary) avg_salary from employees
)  
select avg_salary  from cte

--task 4
select productname,max_sale from Products
join(select productid, max(salesamount) as max_sale from Sales group by productid) as max_saleamount
on max_saleamount.productid=Products.productid

--task 5
 declare @my_num int=1
 while @my_num<1000000
 begin
 print @my_num  
 set @my_num =@my_num * 2 
 end 
  
--task 6
;with cte as
(
select EmployeeID, count(productid) as cnt_product from Sales 
group by EmployeeID
having count(productid)>5
)
select FirstName,LastName,cnt_product from cte
inner join Employees
on cte.EmployeeID=Employees.EmployeeID

--task 7
;with cte as
(
select ProductID, sum(SalesAmount) as sum_sales from Sales
group by ProductID
having sum(SalesAmount)>500
)
select ProductName  from cte
inner join Products
on Products.ProductID=cte.ProductID
--task 8
;with cte as
(
select avg(salary) as avg_salary from Employees
)
select FirstName,LastName,Salary from cte
 cross join Employees
where Employees.Salary>cte.avg_salary

--Medium Tasks
--task 1
select top 5 FirstName,LastName,cnt_product from Employees
join (select EmployeeID, count(productid) as cnt_product from Sales
group by EmployeeID) as count_product
on Employees.EmployeeID=count_product.EmployeeID
order by cnt_product desc

--task 2
--Hosila jadval yordamida mahsulot kategoriyasi bo‘yicha savdolarni toping. (Sales, Products) deyilgan savolda
--shu uchun men kategoriyalar buyicha savdo sonini topganman
select CategoryID, sum(cnt_p) as c_p_t from Products
join (select Productid, count(productid) as cnt_p from Sales
group by Productid) as count_p
on Products.ProductID=count_p.ProductID
group by CategoryID

--task 3
;WITH CTE AS
(
    SELECT Number AS n, Number AS fact, Number AS ct
    FROM Numbers1
    UNION ALL
    SELECT n, fact * (ct - 1), ct- 1
    FROM CTE
    WHERE ct > 1
)
SELECT n, MAX(fact) AS Factorial
FROM CTE
GROUP BY n
ORDER BY n;

--task 4
--Rekursiya yordamida satrni belgilar bo‘yicha bo‘lib, har bir belgini alohida qator sifatida chiqaruvchi skript yozing.(Example)
select *from Example

--task 5
;with cte1 as
(
select sum(Salesamount) as sum_sales, MONTH(saledate) as months from Sales
group by MONTH(saledate)
having MONTH(saledate)=8  
)  
,cte2 as
(
select sum(Salesamount) as sum_sales, MONTH(saledate) as months from Sales
group by MONTH(saledate)
having MONTH(saledate)=7
)
 select (cte1.sum_sales-cte2.sum_sales) as months_difference from cte1,cte2

--task 6
  select FirstName ,quarter_date,sum_sales from Employees
  join(
  select Employeeid, DATEPART(quarter,SaleDate)  as quarter_date, sum(salesamount) as sum_sales from Sales
 group by Employeeid,DATEPART(quarter,SaleDate)
 having sum(salesamount)>45000
 ) as cnt
 on Employees.EmployeeID=cnt.EmployeeID

--Difficult Tasks
--task 1
declare @N int = 20;
;with Fib as
(
    select 0 as idx, 0 as f1, 1 as f2
    union all
    select idx + 1,
           f2,
           f1 + f2
    from Fib
    where idx + 1 < @N   
)
select idx, f1 as Fibonacci
from Fib
order by idx
option (MAXRECURSION 0)

--task 2
select vals
from FindSameCharacters
where len(vals) > 1 and vals = replicate(substring(vals,1,1), len(vals))

--task 3
declare @n int = 5;

;with Numbers as (
    select 1 as num, cast('1' as varchar(100)) as seq
    UNION ALL
    select num + 1, cast(seq + cast(num + 1 as varchar(10)) as varchar(100))
    from Numbers
    where num < @n
)
select seq
from Numbers

--task 4
select Employees.EmployeeID, Employees.FirstName, Employees.LastName, s.total_sales
from Employees 
join (
    select EmployeeID, SUM(SalesAmount) as total_sales
    from Sales
    where SaleDate >= DATEADD(MONTH, -6, GETDATE())
    group by EmployeeID
) s
    on Employees.EmployeeID = s.EmployeeID
order by s.total_sales desc

--task 5
--Satr ustunidagi takroriy butun son qiymatlarini olib tashlaydigan va bir martalik bitta butun sonni ham 
--o‘chirib tashlaydigan T-SQL so‘rov yozing. (RemoveDuplicateIntsFromNames)

select*from RemoveDuplicateIntsFromNames


