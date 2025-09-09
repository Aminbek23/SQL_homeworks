--task 1
select Person.firstName,Person.lastName,Address.city,Address.state from Person
left join  Address
on Person.personId=Address.personId

--task 2
select emp1.name from Employee as emp1
left join Employee as emp2
on emp1.managerId=emp2.id
where emp1.salary>emp2.salary

--task 3  
select email
from Person
group by email
having count(*) > 1

--task 4
 delete from person
 where id not in (
 select min(id)
 from person 
 group by email)

--task 5
select   girls.Parentname from girls
left join boys
on girls.Parentname=boys.parentname
where boys.id is null

--task 6
select sal_ord2.custid,sum(sal_ord1.qty) as sum_qty,  
sum(sal_ord1.qty*(sal_ord1.unitprice-sal_ord1.discount)) as total_amount, 
min(sal_ord2.freight) as min_freight
from Sales.OrderDetails as sal_ord1
join  Sales.Orders as sal_ord2
on sal_ord1.orderid=sal_ord2.orderid
group by sal_ord2.custid
having sum(sal_ord1.qty)>50

--task 7
select isnull(Cart1.item ,' ')as Table1 ,
isnull(Cart2.item,' ')as Table2
from Cart1
full join Cart2
on cart1.item=cart2.item

--task 8
select Customers.name from Customers
left join Orders
on Customers.id=Orders.customerId
where Orders.customerId is null

--task 9
select st.student_id,
st.student_name,
sub.subject_name, count(exm.subject_name) as attend_exams 
from Students as st
cross join subjects as sub
left join examinations as exm
on exm.student_id=st.student_id
and sub.subject_name = exm.subject_name
group by st.student_id,st.student_name,sub.subject_name

