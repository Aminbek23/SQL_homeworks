--task 1
  select*from #sales
  where  exists (select 1 from #Sales as s where  #Sales.CustomerName=s.CustomerName 
  and  month(saledate)=3 and year(saledate)=2024)

--task 2
select  Product, SUM(Quantity * Price) AS TotalAmount FROM #Sales
group by Product having SUM(Quantity * Price)=
(select MAX(TotalAmount) from
( select Product, SUM(Quantity * Price) as TotalAmount
from #Sales
group  by Product ) as Sub 
)

--task 3
select top 1  Product, SUM(Quantity * Price) AS TotalAmount FROM #Sales
group by Product having SUM(Quantity * Price)<
(select MAX(TotalAmount) from
( select Product, SUM(Quantity * Price) as TotalAmount
from #Sales
group  by Product ) as Sub 
)
order by SUM(Quantity * Price) desc

--task 4
select Month, sum(TotalQuantiy) as TotalQuantiy  FROM
(select month(saledate) as Month, Quantity as  TotalQuantiy from #Sales) as  s
group by Month

--task  5
select distinct s1.CustomerName from #Sales s1 
where exists (select 3 from #Sales as s2 where s1.CustomerName<>s2.CustomerName and s1.Product=s2.Product)

--task 6
select name,apple,orange,banana from (select name, fruit from fruits) as src
pivot(count(fruit) for fruit in([apple],[orange],[banana])
) as pvt

--task 7
;with cte as(
select ParentId, ChildID from Family
union all
select cte.ParentId,f.ChildID from cte
join Family f
on cte.ChildID=f.ParentId
where cte.ParentId < f.ChildID
)
select*from cte
order by ParentId,ChildID

--task 8   
;WITH cte AS (
    SELECT DISTINCT CustomerID
    FROM #Orders
    WHERE DeliveryState = 'CA'
)
SELECT o.*
FROM #Orders o
JOIN cte 
    ON o.CustomerID = cte.CustomerID
WHERE o.DeliveryState = 'TX';

--task 9 Aholi nomlari yo‘q bo‘lsa, ularni qo‘shing.

select*from  #residents

--task 10  Write a query to return the route to reach from Tashkent to Khorezm.
--The result should include the cheapest and the most expensive routes
select*from #routes


--task 11 Mahsulotlarni ularning qo‘shilish tartibiga ko‘ra reytinglang.
select*from #RankingPuzzle

--task 12
;with cte as(
 select department,avg(salesamount) as avg_sale from #EmployeeSales 
 group by department
)
select emp.*from cte
join #EmployeeSales emp
on emp.department=cte.department
where salesamount>avg_sale

--task 13
select emp1.EmployeeID,emp1.EmployeeName,emp1.SalesMonth,emp1.SalesAmount from #EmployeeSales emp1
where exists (
select 1 from #EmployeeSales emp2 
where emp1.SalesMonth=emp2.SalesMonth
group by emp2.SalesMonth
having emp1.SalesAmount=max(emp2.SalesAmount)
)


--task 14 Find employees who made sales in every month using NOT EXISTS
select*from #EmployeeSales


--task 15
select*from Products
where Price>(select avg(price) from Products)

--task 16
select*from Products
where stock<(select max(stock) from Products)

--task 17
select*from Products
where category = 'electronics'

--task 18
select*from Products
where price>(select min(price) from Products where category = 'electronics')

--task 19
;with cte as(
select category, avg(price) as avg_p from Products
group by category)
select p.*from cte
join products p
on p.category=cte.category
where p.price>avg_p

--task 20
select distinct p.productid,p.Name
from products p
join orders o on p.productid=o.productid

--task 21
;with cte as(
select*from orders 
where quantity>(select avg(quantity) avg_q from orders) )
select name ,quantity from cte
join products p
on p.productid=cte.productid

--task 22
select p.productid,p.name   from products p
where not exists(select 1 from orders o where o.productid=p.productid)

--task 23
select top 1 p.ProductID, p.Name, SUM(o.Quantity) AS TotalOrdered
from Products p
join Orders o 
on p.ProductID = o.ProductID
group by p.ProductID, p.Name
order by TotalOrdered desc
