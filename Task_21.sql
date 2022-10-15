USE ORG

create table salesman(
salesman_id int not null Primary Key,
name varchar(25),
city varchar(25),
commission float
)

create table customer(
customer_id int not null Primary Key,
cust_name varchar(20),
city varchar(25),
grade int,
salesman_id int references salesman(salesman_id)
)
INSERT INTO salesman
(salesman_ID, name, city, commission) VALUES
	(5001, 'James Hoog', 'New York', 0.15),
	(5002, 'Nail Knite', 'Paris', 0.13),
	(5005, 'Pit Alex', 'London', 0.11),
	(5006, 'Mc Lyon', 'Paris', 0.14),
	(5007, 'Paul Adam', 'Rome', 0.13),
	(5003, 'Lauson Hen', 'San Jose', 0.12)

select * from salesman

---1. create a view for those salespeople who belong to the city of New York.-----
create view Salesman_City 
as
select * from salesman where city='New York'

select * from Salesman_City

---2.From the following table, create a view for all salespersons. Return salesperson ID, name, and city.
create view sperson_details
as
select salesman_id, name , city from salesman

select * from sperson_details

---3. From the following table, create a view to count the number of salespeople in each city. Return city, number of salespersons.

create view count_salesperson
as
select city, COUNT(DISTINCT salesman_id)as count from salesman GROUP BY city;

select * from count_salesperson

--4. From the following table, create a view that counts the number of customers in each grade.

insert into customer
(customer_id, cust_name, city, grade, salesman_id) values
(3002, 'Nick Rimando', ' New York', 100, 5001),
(3007, 'Brad Davis' ,'New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007)

--view--
create view customeringrade(grade, number_of_customers)
as 
select grade, COUNT(*) from customer GROUP BY grade;

select * from customeringrade

---5. From the following tables, create a view to get the salesperson and customer by name. Return order name, purchase amount, salesperson ID, name, customer name.
create table orders(
order_no int Primary Key IDENTITY(1,1),
purch_amt float(50),
ord_date Date,
customer_id int FOREIGN KEY(customer_id) references customer(customer_id) ON DELETE CASCADE,
salesman_id int FOREIGN KEY(salesman_id) references salesman(salesman_id) ON DELETE  CASCADE
);

insert into orders
(order_no, purch_amt, ord_date,customer_id,salesman_id) values
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001)

SET IDENTITY_INSERT orders ON
---ERROR CONFLICTED ON ADDING VALUES TO ORDERS
alter table orders drop constraint [FK__orders__customer__75A278F5]

select * from orders;

create view ordersdetails
as
select order_no,purch_amt, o.salesman_id,name,cust_name 
from orders o, customer c, salesman s
where
o.customer_id= c.customer_id
AND o.salesman_id=s.salesman_id

select * from ordersdetails
