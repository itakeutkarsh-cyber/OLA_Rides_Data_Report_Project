CREATE database Ola;
USE Ola;

#1.Retrieve all susccesful bookings:
CREATE view Succesful_Bookings As
SELECT * FROM bookings
WHERE Booking_Status = 'Success';
#1.Retrieve all susccesful bookings:
SELECT * FROM Succesful_Bookings;

#2. Find the average ride distance for each vehicle type:
CREATE view average_ride_distance_for_each_vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance 
FROM bookings 
GROUP BY Vehicle_Type;
#2. Find the average ride distance for each vehicle type:
SELECT * FROM average_ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
CREATE view cancelled_rides_by_customers As
SELECT COUNT(*) FROM bookings 
WHERE Booking_Status = 'cancelled by Customer';
#3. Get the total number of cancelled rides by customers:
SELECT * FROM cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
CREATE view top_5_customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides 
FROM bookings 
GROUP BY Customer_ID 
ORDER BY total_rides DESC LIMIT 5;
#4. List the top 5 customers who booked the highest number of rides:
SELECT * FROM top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE view Rides_canceled_by_drivers_P_C_issues As
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE view Max_Min_Driver_Ratings As 
SELECT MAX(Driver_Ratings) As max_rating,
MIN(Driver_Ratings) As min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
CREATE view UPI_payment As
SELECT * FROM bookings 
WHERE Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
CREATE view AVG_cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
CREATE view total_successful_rides_value As
SELECT SUM(Booking_Value) as total_successful_value 
FROM bookings 
WHERE Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
CREATE view Incomplete_Rides_With_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings 
WHERE Incomplete_Rides = 'Yes';