create database HR;
use HR;
create table regions (region_id int,region_name varchar(100));
insert into regions (region_id,region_name) 
values
(1, 'Asia'),
(2, 'Europe'),
(3, 'Africa'),
(4, 'Americas'),
(5, 'Oceania');
create table countries (country_id char(2),country_name varchar(100),region_id varchar(100));
insert into countries(country_id,country_name,region_id)
values
(1, 'India', 1),
(2, 'China', 1),
(3, 'Germany', 2),
(4, 'France', 2),
(5, 'Egypt', 3),
(6, 'USA', 4),
(7, 'Brazil', 4),
(8, 'Australia', 5);
create table locations(location_id int,street_address varchar(200),postal_code varchar(30),city varchar(100),state_province varchar(20),country_id char(2));
insert into locations(location_id,street_address,postal_code,city,state_province,country_id)
values
(1001, 'MG Road', '560001', 'Bengaluru', 'Karnataka', 1),
(1002, 'Nanjing Rd', '200000', 'Shanghai', 'Shanghai', 2),
(1003, 'Unter den Linden', '10117', 'Berlin', 'Berlin', 3),
(1004, 'Champs-Élysées', '75008', 'Paris', 'Île-de-France', 4),
(1005, 'Tahrir Square', '11511', 'Cairo', 'Cairo Governorate', 5),
(1006, '5th Avenue', '10001', 'New York', 'New York', 6),
(1007, 'Paulista Ave', '01310', 'São Paulo', 'São Paulo', 7),
(1008, 'George St', '2000', 'Sydney', 'New South Wales', 8);
create table departments(department_id int,department_name varchar(100),manager_id int,location_id int);
insert into departments(department_id,department_name,manager_id,location_id)
values
(10, 'Administration', 101, 1001),
(20, 'Finance', 102, 1003),
(30, 'Human Resources', 103, 1004),
(40, 'IT', 104, 1001),
(50, 'Sales', 105, 1006),
(60, 'Marketing', 106, 1007),
(70, 'Operations', 107, 1005),
(80, 'Customer Service', 108, 1008);
create table employees(employee_id int,first_name varchar(10),last_name varchar(20),email varchar(100),
phone_number varchar(100),hire_date date,job_id varchar(100),salary int,commission_pct int,manager_id int,department_id int);
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values
(101, 'John', 'Smith', 'jsmith@example.com','9876543210', '2020-01-15', 'AD_PRES', 90000, NULL, NULL, 10),
(102, 'Mary', 'Johnson', 'mjohnson@example.com','9856743210', '2021-03-10', 'FI_MGR', 75000, NULL, 101, 20),
(103, 'Robert', 'Brown', 'rbrown@example.com','9823456789', '2021-05-22', 'HR_REP', 50000, NULL, 101, 30),
(104, 'Linda', 'Davis', 'ldavis@example.com','9812345678', '2022-07-01', 'IT_PROG', 65000, NULL, 101, 40),
(105, 'James', 'Wilson', 'jwilson@example.com','9801234567', '2022-09-14', 'SA_MAN', 72000, 0.10, 102, 50),
(106, 'Patricia', 'Taylor', 'ptaylor@example.com','9790123456', '2023-01-18', 'MK_MAN', 68000, 0.05, 105, 60),
(107, 'Michael', 'Thomas', 'mthomas@example.com','9789012345', '2023-03-20', 'OP_SUP', 60000, NULL, 106, 70),
(108, 'Jennifer', 'Garcia', 'jgarcia@example.com','9778901234', '2023-05-30', 'CS_REP', 45000, NULL, 107, 80);
create table job_history(employee_id int,start_date date,end_date date,job_id varchar(100),department_id int);
insert into job_history(employee_id,start_date,end_date,job_id,department_id)
values
(102, '2021-03-10', '2023-03-10', 'FI_MGR', 20),
(103, '2021-05-22', '2023-05-22', 'HR_REP', 30),
(104, '2022-07-01', '2024-07-01', 'IT_PROG', 40),
(105, '2022-09-14', '2024-09-14', 'SA_MAN', 50),
(106, '2023-01-18', '2025-01-18', 'MK_MAN', 60),
(107, '2023-03-20', '2025-03-20', 'OP_SUP', 70),
(108, '2023-05-30', '2025-05-30', 'CS_REP', 80);

create table job(job_id varchar(100),job_title varchar(100),min_salary int,max_salary int);
insert into job(job_id,job_title,min_salary,max_salary)
values
('AD_PRES', 'President', 80000, 120000),
('FI_MGR', 'Finance Manager', 60000, 90000),
('HR_REP', 'HR Representative', 40000, 60000),
('IT_PROG', 'IT Programmer', 50000, 80000),
('SA_MAN', 'Sales Manager', 55000, 95000),
('MK_MAN', 'Marketing Manager', 50000, 85000),
('OP_SUP', 'Operations Supervisor', 45000, 70000),
('CS_REP', 'Customer Service Representative', 35000, 55000);

create table job_grades(grade_level varchar(20),lowest_sal int,highest_sal int);
insert into job_grades(grade_level,lowest_sal,highest_sal)
values
('A', 0, 30000),
('B', 30001, 50000),
('C', 50001, 70000),
('D', 70001, 90000),
('E', 90001, 110000),
('F', 110001, 130000);




