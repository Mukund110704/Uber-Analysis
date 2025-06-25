Create Database Uber;
Use Uber;

#1. Retrieve all successful bookings.
Select * FROM bookings
WHERE booking_status = "Success";

#2. Count the total number of bookings per day
SELECT Date, COUNT(*) AS total_bookings
FROM bookings
GROUP BY Date
ORDER BY Date;

#3. Find the average ride distance for each vehicle type.
SELECT vehicle_type, ROUND(AVG(ride_distance), 2) AS avg_distance
FROM bookings
WHERE booking_status = 'Success'
GROUP BY vehicle_type;

#4. Get the total number of customer cancellations.
SELECT COUNT(*) AS customer_cancellations
FROM bookings
WHERE booking_status = 'Cancelled by Customer';

#5. List all bookings made with UPI as the payment method.
SELECT *
FROM bookings
WHERE payment_method = 'UPI';

#6. Get the count and percentage of each booking status.
SELECT booking_status,
COUNT(*) AS status_count,
ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM bookings), 2) AS percentage
FROM bookings
GROUP BY booking_status;

#7. Find the top 3 vehicle types based on total ride distance.
SELECT vehicle_type, ROUND(SUM(ride_distance), 2) AS total_distance
FROM bookings
WHERE booking_status = 'Success'
GROUP BY vehicle_type
ORDER BY total_distance DESC
LIMIT 3;

#8. Find the maximum and minimum driver ratings for Prime SUV bookings
SELECT 
  MAX(driver_ratings) AS max_rating,
  MIN(driver_ratings) AS min_rating
FROM bookings
WHERE vehicle_type = 'Prime SUV'
  AND booking_status = 'Success';

#9. Count of customer cancellations by reason.
SELECT Reason_for_cancelling_by_Customer, COUNT(*) AS count
FROM bookings
WHERE booking_status = 'Cancelled by Customer'
GROUP BY Reason_for_cancelling_by_Customer
ORDER BY count DESC;

#10. Revenue breakdown by each payment method.
SELECT payment_method, ROUND(SUM(booking_value), 2) AS total_revenue
FROM bookings
WHERE booking_status= 'success'
GROUP BY payment_method;

#11. List top 5 customers based on total booking value.
SELECT Customer_ID, ROUND(SUM(booking_value), 2) AS total_spent
FROM bookings
WHERE booking_status = 'Success'
GROUP BY Customer_ID
ORDER BY total_spent DESC
LIMIT 5;

#12. Compare average customer and driver ratings by vehicle type.
SELECT vehicle_type,
  ROUND(AVG(customer_rating), 2) AS avg_customer_rating,
  ROUND(AVG(driver_ratings), 2) AS avg_driver_rating
FROM bookings
WHERE booking_status = 'Success'
GROUP BY vehicle_type;

#13. Show average ride distance per day:
SELECT Date, ROUND(AVG(ride_distance), 2) AS avg_distance
FROM bookings
WHERE booking_status = 'Success'
GROUP BY Date
ORDER BY Date;

#13.Find the top pickup-drop pairs (routes) with highest total revenue, but only for pairs with more than 20 rides.
SELECT 
  pickup_location, drop_location,
  COUNT(*) AS total_rides,
  ROUND(SUM(booking_value), 2) AS total_revenue
FROM bookings
WHERE booking_status = 'Success'
GROUP BY pickup_location, drop_location
HAVING COUNT(*) > 20
ORDER BY total_revenue DESC
LIMIT 10;

#14. Analyze Avg VTAT and CTAT During Peak vs Non-Peak Hours
SELECT 
  CASE 
    WHEN HOUR(`Time`) BETWEEN 8 AND 11 THEN 'Morning Peak'
    WHEN HOUR(`Time`) BETWEEN 17 AND 20 THEN 'Evening Peak'
    ELSE 'Non-Peak'
  END AS time_slot,
  ROUND(AVG(avg_VTAT), 2) AS avg_vtat,
  ROUND(AVG(avg_CTAT), 2) AS avg_ctat
FROM bookings
WHERE booking_status = 'Success'
GROUP BY time_slot
ORDER BY 
  CASE time_slot
    WHEN 'Morning Peak' THEN 1
    WHEN 'Evening Peak' THEN 2
    ELSE 3
  END;

