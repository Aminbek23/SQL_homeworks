--task 1 
select*from employees
where salary=(select min(salary) from employees)

--task 2
select* from products
where price>(select avg(price)from products)

--task 3
 select name from  employees
 where department_id in (select id from departments where department_name='sales')
 
 --task 4
select name from customers
where customer_id  not in(select customer_id from orders where customers.customer_id=orders.customer_id)

--task 5
select p1.* from products as p1
join ( select category_id, max(price) as max_p from products
group by category_id) p2
on p1.category_id=p2.category_id and p1.price=p2.max_p


--task 6
select e.id,e.name,e.salary,d.department_name from employees  as e
join departments as d
on e.department_id=d.id
 join(  
 -- har bir bulim uchun urtacha maoshni topaman
 select department_id, avg(salary) as avg_salary from employees 
 group by department_id
 ) as dept_avg
 on e.department_id=dept_avg.department_id
 --eng yuqori urtacha maoshni topaman
 where dept_avg.avg_salary=(
 select max(avg_salary) from (select avg(salary) as  avg_salary from employees
 group by department_id)t)

----task 7
select*from employees as e1
where e1.salary>(select avg(e2.salary) from employees as e2 where e1.department_id=e2.department_id)

--task 8
 select*from  students as st
  join  grades as gr
  on st.student_id=gr.student_id
where grade = (select max(gr2.grade) from grades as gr2 where gr.course_id=gr2.course_id)

--task 9
-- Har bir kategoriya ichida uchinchi eng qimmat mahsulotlarni olish.
select*from products  p1
where price = (select  max(p2.price) from products as p2 where p1.category_id=p2.category_id)

--task 10
select*from  employees e1
where salary>(select avg(e2.salary) from employees  e2  )  and
 e1.salary<(select max(e2.salary)from  employees  e2 where e2.department_id=e1.department_id )
