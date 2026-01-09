create database Restaurant_Management;
use Restaurant_Management;
create table customers(customer_id int primary key,customer_name varchar(200),phone varchar(900),email varchar(100),address varchar(300));
insert into customers(customer_id,customer_name,phone,email,address)
values
(1,'Rahul Sharma',' 9876543210', 'rahul.sharma@email.com', 'Delhi, India'),
(2,'Priya Nair', '9123456780', 'priya.nair@email.com', 'Kochi, Kerala'),
(3,'Arjun Mehta', '9988776655', 'arjun.mehta@email.com', 'Mumbai, Maharashtra'),
(4,'Sneha Patel', '9012345678', 'sneha.patel@email.com', 'Ahmedabad, Gujarat'),
(5,'Vikram Reddy', '9345678901', 'vikram.reddy@email.com', 'Hyderabad, Telangana');

create table Employees(employee_id int primary key,employee_name varchar(200),employee_role varchar(300),salary decimal(10,2),phone varchar(400));
insert into Employees(employee_id,employee_name, employee_role, salary, phone) 
values
(11,'Ramesh Kumar', 'Manager', 45000.00, '9811122233'),
(12,'Anita Verma', 'Chef', 30000.00, '9822233344'),
(13,'Suresh Singh', 'Waiter', 15000.00, '9833344455'),
(14,'Pooja Sharma', 'Cashier', 20000.00, '9844455566'),
(15,'Arvind Rao', 'Chef', 32000.00, '9855566677'),
(16,'Kiran Patel', 'Waiter', 16000.00, '9866677788');

create table Menu (item_id int primary key,item_name varchar(100),category varchar(300),price int,availability varchar(200));
insert into Menu(item_id,item_name, category, price, availability) 
VALUES
(1,'Tomato Soup', 'Starter', 120.00, 'Yes'),
(2,'Chicken Tikka', 'Starter', 250.00, 'Yes'),
(3,'Paneer Butter Masala', 'Main Course', 300.00, 'Yes'),
(4,'Veg Biryani', 'Main Course', 220.00, 'Yes'),
(5,'Butter Naan', 'Main Course', 40.00, 'Yes'),
(6,'Chocolate Brownie', 'Dessert', 150.00, 'Yes'),
(7,'Gulab Jamun', 'Dessert', 90.00, 'No'),
(8,'Cold Coffee', 'Drinks', 120.00, 'Yes'),
(9,'Fresh Lime Soda', 'Drinks', 80.00, 'Yes'),
(10,'Mango Milkshake', 'Drinks', 140.00, 'No');

create table Tables(table_id int primary key,capacity int,table_status varchar(200));
INSERT INTO Tables (table_id,capacity, table_status) 
VALUES
(1,2, 'Available'),
(2,4, 'Occupied'),
(3,6, 'Reserved'),
(4,2, 'Available'),
(5,4, 'Available'),
(6,8, 'Occupied');
create table Orders(order_id int primary key,customer_id int,table_id int ,employee_id int,order_date datetime,orders_status varchar(100));

INSERT INTO Orders (order_id,customer_id, table_id, employee_id, order_date, orders_status) 
VALUES
(11, 1, 2,3, '2025-09-29 12:30:00', 'Pending'),
(12, 2, 3,4, '2025-09-29 13:00:00', 'Preparing'),
(13, 4, 5,5, '2025-09-29 14:00:00', 'Paid'),
(14, 5, 4,6, '2025-09-29 14:30:00', 'Preparing'),
(15, 3, 1,7, '2025-09-29 13:15:00', 'Served');

create table Order_Details(order_detail_id int primary key,order_id int,item_id int,quantity int,subtotal int);
INSERT INTO Order_Details (order_detail_id,order_id, item_id, quantity, subtotal) 
VALUES
(21,11, 2, 1, 250.00), 
(22,11, 5, 2, 80.00), 
(23,12, 3, 1, 300.00), 
(24,12, 8, 2, 240.00),
(25,13, 4, 1, 220.00),
(26,13, 6, 1, 150.00),  
(27,14, 1, 2, 240.00);

create table Billing(bill_id int primary key,order_id int,total_amount decimal (10,2),payment_mode varchar(200),payment_status varchar(200),bill_date date);

insert into Billing(bill_id,order_id, total_amount, payment_mode, payment_status, bill_date)
values
(1,11, 330.00, 'Cash', 'Paid', '2025-09-29'),
(2,12, 540.00, 'Card', 'Unpaid', '2025-09-29'),
(3,13, 370.00, 'UPI', 'Paid', '2025-09-29'),
(4,14, 320.00, 'Wallet', 'Unpaid', '2025-09-29'),
(5,15, 290.00, 'Cash', 'Paid', '2025-09-29');

-- Daily Sales Report → Total revenue generated per day.

select sum(total_amount) as Total_Revenue from Billing where bill_date ='2025-09-29';
use Restaurant_Management;
select menu.item_name , count(Order_Details.item_id)
from 
Order_Details 
inner join Menu on Order_Details.item_id=Menu.item_id
group by menu.item_id;
select bill_date,sum(total_amount) as total_revenue from billing
group by bill_date;

select employee_id,count(order_id) as total_orders from orders
group by employee_id;

select table_id,count(order_id) as frequently_usedtable from orders 
group by table_id;

select item_id,quantity,count(order_id) as inventory from Order_Details
where quantity < 2
group by item_id,quantity;

select * from orders where customer_id=3;



