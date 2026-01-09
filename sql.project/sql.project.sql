create database employee;
use employee;
create table employees(employee_id int primary key,
employee_name varchar(255),department varchar(100),
position varchar(100),hire_date date,base_salary decimal(10,2));

create table attendance(attendance_id int primary key,
employee_id int,attendance_date date,status_attendance enum('present','absent','leave'));

create table salaries(salary_id int primary key,employee_id int,
base_salary decimal(10,2),bonus decimal(10,2),deductions decimal(10,2),
month_salary varchar(20),year_salary int);

create table payroll(payroll_id int primary key,employee_id int,
total_salary decimal(10,2),payment_date date);

insert into employees(employee_id,employee_name,department,position,hire_date,base_salary)
values
(1,'aiswarya','manager','IT','2022-02-22',12000),
(2,'aparna','manager','IT','2022-03-20',12500),
(3,'sona','manager','marketing','2022-04-25',13000),
(4,'surya','sales rep','marketing','2022-05-24',13500),
(5,'david','junior rep','marketing','2021-06-28',14500),
(6,'julia','HR supervisor','HR','2022-09-20',15000),
(7,'zack','office boy','HR','2020-11-29',18000),
(8,'john','technician','IT','2020-11-16',15500);

insert into attendance(attendance_id,employee_id,attendance_date,status_attendance)
values
(1,1,'2022-05-20','present'),
(2,2,'2022-05-20','absent'),
(3,3,'2022-05-20','present'),
(4,4,'2022-05-20','absent'),
(5,5,'2022-05-20','present'),
(6,6,'2022-05-20','absent'),
(7,7,'2022-05-20','absent'),
(8,8,'2022-05-20','present');

insert into salaries(salary_id,employee_id,base_salary ,bonus ,deductions ,month_salary ,year_salary)
values
(11,1,12000,500,0,'january',2021),
(12,2,12500,0,500,'march',2021),
(13,3,13000,500,0,'may',2021),
(14,4,13500,0,500,'june',2021),
(15,5,14500,500,0,'january',2021),
(16,6,15000,0,500,'may',2021),
(17,7,18000,500,0,'july',2021),
(18,8,15500,0,500,'march',2021);

insert into payroll(payroll_id,employee_id,total_salary,payment_date)
values
(21,1,12500,'2022-02-22'),
(22,2,12000,'2022-02-22'),
(23,3,13500,'2022-02-22'),
(24,4,13000,'2022-02-22'),
(25,5,15000,'2022-02-22'),
(26,6,14500,'2022-02-22'),
(27,7,18500,'2022-02-22'),
(28,8,15000,'2022-02-22');

update employees set base_salary=12500 where employee_id=1;
update employees set department='HR' where employee_id=2;
update employees set position='asst.IT' where employee_id=3;

delete from employees where employee_id=7;

insert into attendance(attendance_id,employee_id,attendance_date,status_attendance)
values
(11,1,'2022-02-01','present'),
(12,2,'2022-02-02','absent'),
(13,3,'2022-02-03','absent'),
(14,4,'2022-02-04','present'),
(15,5,'2022-02-05','absent');
select base_salary ,bonus ,deductions,(base_salary+bonus-deductions) as Total_salary from employee.salaries;
select base_salary ,bonus ,deductions,(bonus+500) as updated_bonus,(deductions+100) as updated_deductions,(base_salary+bonus+500-deductions+100) as total_salary from employee.salaries;

select employee_name,total_salary,payment_date from employee.payroll inner join employee.employees on employee.payroll.employee_id=employee.employees.employee_id;
select employee_name,bonus,deductions,salaries.base_salary,(salaries.base_salary+bonus-deductions) as Total_salary from employee.employees 
inner join employee.salaries 
on employee.employees.employee_id=employee.salaries.employee_id;

select * from (((employee.employees inner join employee.attendance
on employee.employees.employee_id=employee.attendance.employee_id )inner join employee.salaries on employee.employees.employee_id=employee.salaries.employee_id)inner join employee.payroll on employee.employees.employee_id=employee.payroll.employee_id);

use employee;
SELECT * 
FROM employees e
LEFT JOIN attendance a ON a.employee_id = e.employee_id
LEFT JOIN payroll p ON p.employee_id = e.employee_id
LEFT JOIN salaries s ON s.employee_id = e.employee_id;
