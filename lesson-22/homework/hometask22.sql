-- task 1 
select*, sum(total_amount) over (order by order_date) as runnning_total_amount from sales_data

--task 2
select   product_category,sum(quantity_sold) over(partition by product_category) total_product_category from sales_data

--task 3 
select*,max(total_amount) over (partition by product_category) as max_total_amount from sales_data

--task 4  
select*,min(unit_price) over (partition by product_category) as max_price from sales_data

--task 5 
select*, avg(total_amount) over(order by order_date
rows between 1 preceding and 1 following ) as avg_prev_current_next
from sales_data

--task 6
select*,sum(total_amount) over(partition by region) Region_Total_Sales from sales_data

--task 7 
select*,sum(total_amount) over(partition by customer_id) Customers_Total_Sales from sales_data

--task 8 
;with cte as(
select*,LAG(total_amount) over(partition by customer_id  order by  order_date) as prev_sales 
from sales_data)
select*,total_amount-prev_sales  as current_prev_diff  from cte

--task 9 
;with cte as(
select*,row_number() over(partition by product_category order by unit_price desc ) as rnk_unit_price  from sales_data)
select*from cte
where rnk_unit_price<=3

--task 10
select*, sum(total_amount) over(partition by region order by order_date) as Running_Total_Sales_Region from sales_data

--task 11
select*,sum(total_amount) over(partition by product_category order by order_Date) 
as Running_Total_Sales_product_category from sales_data

--task 12
CREATE TABLE Numbers (
    ID INT
);
INSERT INTO Numbers (ID)
VALUES (1), (2), (3), (4), (5);

select *, sum(ID) over(order by ID) as SumPreValues  from numbers 

--task 13
CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);

select *, sum(Value ) over(order by Value 
rows between  1 preceding and current row
) as SumPreValues  from OneColumn 

--task 14
select customer_id, count(distinct product_category) as cnt from sales_data
group by customer_id
having count(distinct product_category)>1

--task 15
;with cte as(
select*, avg(total_amount) over (partition by region) avg_total_amount_region from sales_data)
select*from cte
where total_amount>avg_total_amount_region

--task 16
select customer_id, region,
    sum(total_amount) AS total_spending,
    DENSE_RANK() over (partition by  region order by sum(total_amount) desc) as spending_rank
from sales_data
group by  region, customer_id

--task 17 
select*, sum(total_amount) over(partition by customer_id order by order_date) as Running_total_amount_customer_id 
from sales_data

--task 18 Har bir oy uchun oldingi oyga nisbatan savdo o‘sish sur’atini (growth_rate) hisoblang.  jadval verilmaganligi sababli ishlamadim

--task 19
;with cte as(
select*,LAG(total_amount) over(partition by  customer_id order by order_date) as prev_date from  sales_data)
select* from cte
where total_amount> prev_date

--task 20
;with cte as(
select*,avg(unit_price) over() as avg_unit_price from sales_data)
select*from cte
where total_amount>avg_unit_price

--task 21
select *,
case when  row_number() over (partition by Grp order by Id) = 1 
then  sum(Val1 + Val2) over (partition by Grp) end as Tot
from MyData
order by  Id 

--task 22
select Id, sum(Cost) as Total_Cost, sum( distinct Quantity) as Total_Quantity from TheSumPuzzle
group by Id

--task 23 
;with cte as (
select 
SeatNumber,
lead(SeatNumber) over(order by SeatNumber) as next_seat
from Seats)
select 
SeatNumber + 1 as Gap_Start, next_seat - 1 as Gap_End
from cte
where next_seat - SeatNumber > 1

