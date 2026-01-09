create database Railway_management;
use Railway_management;
create table train(train_id int primary key,train_name varchar(200),start_place varchar(200),
destination varchar(200),train_time time,ending_time time,seat int,price float,train_status varchar(300));


INSERT INTO train (train_id, train_name, start_place, destination, train_time, ending_time, seat, price, train_status)
VALUES
    (12345, 'Sunrise Express', 'CityA', 'CityB', '08:00:00', '10:30:00', 45, 500.00, 'On time'),
    (67890, 'Coastal Mail', 'CityC', 'CityD', '06:15:00', '08:45:00', 12, 750.00, 'Delayed 30 min'),
    (23456, 'Valley Express', 'TownX', 'TownY', '09:30:00', '11:00:00', 0, 620.00, 'Waitlisted'),
    (34567, 'Highland Special', 'StationP', 'StationQ', '07:45:00', '10:00:00', 25, 400.00, 'On time'),
    (45678, 'Riverine Passenger', 'StationR', 'StationS', '05:30:00', '08:00:00', 60, 300.00, 'Cancelled');
    
create table user(user_id int primary key,user_name varchar(200),train_id int,no_of_seat int,user_status varchar(300));
insert into user(user_id, user_name, train_id, no_of_seat, user_status)
values
    (1, 'Alice', 12345, 2, 'Confirmed'),
    (2, 'Bob', 67890, 1, 'Pending'),
    (3, 'Charlie', 23456, 3, 'Cancelled'),
    (4, 'David', 34567, 4, 'Confirmed'),
    (5, 'Eve', 45678, 2, 'Pending');
update user set user_status='confirmed' where user_id=2;
update user set user_status='cancelled' where user_id=4;
select train_name,price from train;
use Railway_management;
select train_name,user_status from train inner join user on train.train_id=user.train_id;
select * from train inner join user on train.train_id=user.train_id;




