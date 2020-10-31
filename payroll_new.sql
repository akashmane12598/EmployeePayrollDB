/* UC2 */
create table employee_payroll(
id int not null identity(1,1) primary key,
name varchar(50) not null,
salary decimal(10,2) not null,
start_date DateTime not null
);

insert into employee_payroll values
('Akash', 50000, '2020-09-18'),
('Tanmay', 25000, '2021-02-03'),
('Parth', 23000, '2019-05-26');

insert into employee_payroll values
('SH', 80000, '2020-07-18','F'),
('Alexa', 35000, '2021-05-03','F');

/* UC4 */
select * from employee_payroll;

/* UC5 */
select salary from employee_payroll where name='Tanmay';
select * from employee_payroll where start_date between cast('01-01-2019' as date) and GETDATE();

/* UC6 */
alter table employee_payroll
add gender char;

update employee_payroll
set gender='M'
 where name = 'Akash' or name='Tanmay' or name='Parth';

 /* UC7 */
 select sum(salary) as sum from employee_payroll where gender='F';
 select gender, ROUND(AVG(salary),2) as average from employee_payroll group by gender;
 select gender, COUNT(name) as total_emp from employee_payroll group by gender;
 select name from employee_payroll where salary in (select max(salary) from employee_payroll);


 /* UC8 & UC9 */
 /* Create New Table */
create table emp_payroll(
EmpId int identity(1,1) primary key,
EmpName varchar(50),
EmpPhoneNumber varchar(50),
EmpAddress varchar(50),
Department varchar(50) not null,
Gender char(1),
BasicPay float,
Deductions float,
TaxablePay float,
Tax float,
NetPay float,
StartDate Date,
City varchar(50),
);

/* alter table */
alter table emp_payroll
add Country varchar(50) default(' ');

/* Drop column  */
ALTER TABLE emp_payroll DROP CONSTRAINT DF__emp_payro__Pinco__267ABA7A ;
alter table emp_payroll
drop column Pincode;


select * from emp_payroll;


/* UC10 */
/* Insert values */
insert into emp_payroll(EmpName,Department, Gender, BasicPay, StartDate) values
('Terisa','Analyst','F',80000,'2019-11-13'),
('Charlie','Finance','M', 50000, '2020-09-18'),
('Bill','Testing','M', 25000, '2021-02-03'),
('Mark','Support','M', 23000, '2019-05-26');

/* insert another record of same name*/
insert into emp_payroll values
('Terisa','123456789','Mumbai','HR','F',30000,5000, 2000, 1000, 20000,'2018-06-26','Mumbai','IN');

select * from emp_payroll where EmpName ='Terisa';

/* Describe tables */
exec sp_columns emp_payroll;
Select * From INFORMATION_SCHEMA.COLUMNS Where TABLE_NAME = 'emp_payroll'

/* show databases */
exec sp_databases;
