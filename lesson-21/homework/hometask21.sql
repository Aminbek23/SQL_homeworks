--task 1
select*, ROW_NUMBER() over (order by SaleDate ) as date_rank from ProductSales

--task 2
select*, dense_rank() over (order by quantity ) as qnt_rank from ProductSales

--task 3
;with cte as(
select*, dense_rank() over (partition by customerid order by SaleAmount desc ) as sale_rank from ProductSales
)
select *from cte
where sale_rank=1

--task 4 
select *,LEAD(SaleAmount) over(order by saledate) as NextSaleAmount from ProductSales 

--task 5 
select *,lag(SaleAmount) over(order by saledate) as AfterSaleAmount from ProductSales 

--task 6 
;with cte as(
select *,lag(SaleAmount) over(order by saledate) as PrevSaleAmount from ProductSales 
)
select*from cte
where SaleAmount>PrevSaleAmount

--task 7 
;with cte as(
select *,lag(SaleAmount) over(partition by ProductName order by saledate) as PrevSaleAmount from ProductSales 
)
select*,(SaleAmount-PrevSaleAmount) as difference from cte

--task 8 
;with cte as(
select *,lag(SaleAmount) over(order by saledate) as PrevSaleAmount from ProductSales 
)
select*,
case when PrevSaleAmount is null then  null
else convert(decimal (5,2), ((SaleAmount-PrevSaleAmount)/PrevSaleAmount)*100) end as difference_percentage
from cte 

--task 9 
;with cte as(
select*,lag(SaleAmount) over (partition by productname order by saledate ) as PrevSaleAmount  from ProductSales)
select*,
case when PrevSaleAmount is null then null
else convert(decimal (5,2), ((SaleAmount-PrevSaleAmount)/PrevSaleAmount)*100) end as difference_percentage
from cte

--task 10 
;with cte as(
select *,first_value(SaleAmount)over(partition by productname order by saledate) as FirstSaleAmount from ProductSales)
select*,(SaleAmount-FirstSaleAmount) DifferenceFromFirst from cte

--task 11 
;with cte as(
select*,lag(SaleAmount) over (partition by productname order by saledate ) as prevSaleAmount  from ProductSales)
select*from cte
where SaleAmount>PrevSaleAmount

--task 12 
select*,sum(SaleAmount) over (partition by ProductName order by SaleDate
        rows between unbounded preceding and current row 
) as closing_balance
from ProductSales


--task 13 
;with cte as(
select*,row_number() over (partition by productname order by saledate desc) as rnk from ProductSales)
select ProductName, convert (decimal(5,2),avg(saleamount)) avg_s from cte
where rnk<=3
group by ProductName

--task 14 
select*, saleamount-avg(SaleAmount) over() as DifferenceFromAvg from ProductSales

--task 15 
;with cte as(
select*,dense_rank() over(order by salary) rnk from Employees1 )
select*from cte
where rnk in(select rnk from cte group by rnk having count(rnk)>1)

--task 16 
;with cte as(
select*,dense_rank() over(partition by department order by salary desc) rnk from Employees1 )
select*from cte
where rnk<=2

--task 17 
;with cte as(
select*,dense_rank() over(partition by department order by salary ) rnk from Employees1 )
select*from cte
where rnk=1

--task 18 
select*,sum (salary) 
over( partition by department order by salary
rows between unbounded preceding  and current row) running_total
from Employees1 

--task 19 
select*,sum(salary) over (partition by department  ) as TotalSalaryDept from Employees1

--task 20 
select*,convert(decimal(10,2), avg(salary) over (partition by department)) as AvgSalaryDept from Employees1

--task 21 
;with cte as(
select*,convert(decimal(10,2), avg(salary) over (partition by department)) as AvgSalaryDept from Employees1)
select*, (salary-AvgSalaryDept) as Salary_minus_AvgSalary from cte

--task 22 
select*,avg(salary) over(order by hiredate rows between 1 preceding and 1 following)  as avg_3
from Employees1

--task 23
;with cte as(
select*,row_number()over(order by hiredate desc) as rnk from Employees1)
select sum(salary) Last_3_Salary_Sum from cte
where rnk<=3
