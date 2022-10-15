--Task 19
CREATE DATABASE ORG;

use ORG;

--worker table
CREATE TABLE Worker (
	WORKER_ID INT PRIMARY KEY ,
	FIRST_NAME VARCHAR(25),
	LAST_NAME VARCHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT VARCHAR(25)
);

--INSERT
INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES

(001, 'Monika', 'Arora', 100000, '2022-02-20 09:00:00', 'HR'),

(002, 'Niharika', 'Verma', 80000, '2017-06-11 05:30:00', 'Admin'),

(003, 'Vishal', 'Singhal', 300000, '2021-05-22 07:20:00', 'HR'),

(004, 'Amitabh', 'Singh', 500000, '2017-04-20 11:00:00', 'Admin'),

(005, 'Vivek', 'Bhati', 500000, '2020-06-29 02:15:00', 'Admin'),

(006, 'Vipul', 'Diwan', 200000, '2015-06-21 09:30:00', 'Account'),

(007, 'Satish', 'Kumar', 75000,'2019-01-20 01:00:00', 'Account'),

(008, 'Geetika', 'Chauhan', 90000, '2017-12-23 04:45.00','Admin');

SELECT * FROM Worker;

--BONUS TABLE
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

--INSERT
INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000,'2016-02-20'),
(002, 3000, '2017-06-11'),
(003, 4000, '2016-05-20'),
(001, 4500, '2018-02-25'),
(002, 3500, '2020-08-13');

SELECT * FROM Bonus

--TITLE
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001,'Manager','2016-02-20 04:00:00'),
(002, 'Executive', '2016-06-11 12:00:00'),
(008, 'Executive', '2018-09-21 11:30:00'),
(005, 'Manager', '2016-06-11 02:15:00'),
(004, 'Asst. Manager', '2014-06-21 00:00:00'),
(007, 'Executive', '2020-08-11 00:00:00'),
(006, 'Lead', '2016-09-21 00:00:00'),
(003, 'Lead', '2016-06-23 05:00:00');

SELECT * FROM Worker;
SELECT * FROM Bonus;
SELECT * FROM Title;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as'WORKER_NAME'.
SELECT FIRST_NAME AS WORKER_NAME FROM Worker 

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) AS FIRST_NAME  FROM Worker;

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM Worker

--Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
SELECT SUBSTRING(FIRST_NAME,1,3) FROM Worker; 

--Q-5. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select  distinct DEPARTMENT, len(DEPARTMENT) as Count from worker;

--Q-6. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
SELECT CONCAT(first_name, ' ', last_name) AS COMPLETE_NAME FROM worker;

--Q-7. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM worker WHERE FIRST_NAME ='Vipul' OR FIRST_NAME='Satish';

--Q-8. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT * FROM worker WHERE department= 'Admin';

--Q-9. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM worker WHERE FIRST_NAME like '%a';

--Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM worker WHERE FIRST_NAME like '%a%';