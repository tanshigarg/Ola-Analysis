select count(*) from data;

-- Retrieve all sucessful bookings.
create view successful_bookings as 
select * from data
where booking_status = 'success';

select * from successful_bookings;

-- Find the average ride distance for each vehicle type.
create view ride_distance_for_each_vehicle_type as
select vehicle_type, round(avg(ride_distance),1) as avg_ride_distance
from data
group by vehicle_type;

-- Get the total number of cancelled rides by customers.
create view cancelled_rides_by_customers as 
select count(booking_status) as total_customer_cancellation
from data
where booking_status = "canceled by customer";

-- List the top 5 customers who booked the highest number of rides. 
create view top_5_customers as 
select customer_id, count(booking_id) as total_bookings
from data
group by customer_id
order by total_bookings desc
limit 5;

-- Get the number of rides canceled by driver due to personal and car-related issues.
create view canceled_by_driver_pncissue as 
select count(canceled_rides_by_driver) as total_cancellation_by_driver
from data
where canceled_rides_by_driver = "Personal & Car related issue";

-- Find the maximum and minimum driver ratings for Prime Sedan bookings.
create view max_min_primesedan_ratings as 
select max(driver_ratings) as max_driver_rating, min(driver_ratings)as min_driver_rating
from data
where vehicle_type = "prime sedan";

-- Retrieve all rides where payments was made using upi.
create view upi_payment_enteries as 
select * from data
where payment_method = "upi";

-- Find the average customer rating per vehicle type. 
create view avg_customer_rating as 
select vehicle_type, avg(customer_rating) as avg_customer_rating
from data
group by vehicle_type;

-- Calculate the total booking value of rides completed successfully.
create view total_booking_value as 
select sum(booking_value) as total_booking_value
from data 
where booking_status = "success";

-- List all incomplete rides along with reasons.
create view incomplete_ride_reason as
select booking_id, incomplete_rides_reason
from data
where incomplete_rides = "yes";



