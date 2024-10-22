
CREATE DATABASE PROJ;

USE PROJ;

-- RETRIEVE THE WHOLE-DATA

SELECT * 
FROM   PROJ_DATA;


-- QUES 1  RETRIEVE TH DATA TO FIND THE AVERAGE PRICE PER ROOM--

SELECT AVG(AVG_PRICE_PER_ROOM)
from PROJ_DATA;
 
-- OBSERVATION: calculates the overall average of the average prices per room from the PROJ_DATA table. 

-- INSIGHTS: We found that if the overall average is high, it may indicate a predominance of premium or luxury accommodations, while a lower average suggests more budget-friendly options.  



--  QUES 2 RETRIEVE THE DATA TO FIND BOOKING STATUS IS CANCELED OF THE HOTEL)--

SELECT BOOKING_STATUS
FROM PROJ_DATA
WHERE BOOKING_STATUS = 'CANCELED';

-- OBSERVATION: We got an idea to know that this particular output gives a clear view of the proportion of cancellations.

-- INSIGHTS: We find that high number of cancellations might indicate problems such as customer dissatisfaction, pricing issues etc..

-- QUES 3 RETRIEVE THE DATA TO FIND  MEAL-PLAN -2 IS ORDERED IN THE ROOM-- 

SELECT TYPE_OF_MEAL_PLAN
FROM PROJ_DATA 
WHERE TYPE_OF_MEAL_PLAN = 'MEAL PLAN 2';
 
 -- OBSERVATION: This result indicates the instances where this specific meal plan has been ordered.
-- INSIGHTS: We found that "MEAL PLAN 2" shows a significant number of orders, it suggests that this plan is well-received or preferred by guests.


-- QUES 4  WRITE A SQL QUERY TO FIND NUMBER OF GUESTS REPEATED --
SELECT count(REPEATED_GUEST) AS NO_OF_GUESTS_REPEATED 
FROM PROJ_DATA;

--  OBSERVTION: We observe that how many guests have stayed more than once.
 
--  INSIGHTS: A high count of repeated guests indicates strong customer retention and satisfaction, suggesting that your services are valued and effective in encouraging return visits.  
 
 
 -- QUES 5  Write a query to find more than 2 adults and more than 2 children.--
 SELECT NO_OF_ADULTS,NO_OF_CHILDREN
 FROM PROJ_DATA
 WHERE no_of_adults < 2
 AND NO_OF_CHILDREN <2;
 
-- OBSERVATION: It aims to retrieve records where the number of adults and children both exceed 2. 
 
 --  INSIGHTS: The records in the PROJ_DATA table where there are more than two adults and more than two children. The use of the WHERE clause ensures that only rows satisfying both conditions (adults greater than two and children greater than two) are returned.
   
   -- QUES 6 Write a query to delete all bookings that have been canceled.--
   
DELETE FROM PROJ_DATA WHERE booking_status = 'Canceled';

--  OBSERVATION: To delete all canceled bookings from a table,We  should use a DELETE query with a WHERE clause that targets rows marked as canceled.

--  INSIGHTS: This operation is crucial for maintaining data cleanliness by removing unnecessary records, which can optimize database performance and storage. 


  -- QUES 7 WRITE A SQL QUERY  TO FIND market segment type (e.g., Online, Offline) has the highest booking rate? --
  SELECT 
    market_segment_type, 
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN booking_status = 'Canceled' THEN 1 ELSE 0 END) AS total_cancellations,
    (SUM(CASE WHEN booking_status = 'Canceled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS cancellation_rate
FROM PROJ_DATA
GROUP BY market_segment_type
ORDER BY cancellation_rate DESC
LIMIT 1;

--  OBSERVATION: This query groups the bookings by market segment, counts the total bookings for each, and orders the results to identify the segment with the highest booking rate.

-- INSIGHTS: This insight helps businesses understand which channels are most effective, allowing them to focus marketing efforts and resources on the most successful segments.
 
 
 
 -- QUES 8 WRITE A SQL QUERY TO FIND THE the average number of adults per booking by market segment. --
 
 SELECT MARKET_SEGMENT_TYPE, AVG(NO_OF_ADULTS) AS AVERAGE_ADULTS
 FROM PROJ_DATA
 GROUP BY MARKET_SEGMENT_TYPE;
 
 -- OBSERVATION: We observe that this SQL query groups the data by MARKET_SEGMENT_TYPE and calculates the average number of adults (NO_OF_ADULTS) for each segment.   
 
 --  INSIGHTS: This analysis allows you to observe trends in group sizes within each segment, providing insights into customer behavior.
 
 
 -- QUES 9 WRITE A SQL QUERY TO FIND THE  the most frequently reserved room type --
 
 SELECT ROOM_TYPE_RESERVED, count(*) AS TOTAL_RESERVED_ROOMS
 FROM PROJ_DATA 
 GROUP BY ROOM_TYPE_RESERVED
 ORDER BY count(*) DESC
LIMIT 1; 

--  OBSERVATION: It helps to identify the most frequently reserved room type by counting and grouping reservations based on ROOM_TYPE_RESERVED. By ordering the results in descending order and limiting the output to the top result, the query pinpoints the room type with the highest number of bookings.

--  INSIGHTS : This insight is valuable for hotel management as they reveal customer preferences, enabling better inventory management, pricing strategies, and marketing efforts focused on promoting the most in-demand room types. 

 -- QUES 10 WRITE A SQL QUERY TO FIND the room type that generates the highest revenue --
 SELECT ROOM_TYPE_RESERVED, sum(AVG_PRICE_PER_ROOM *(NO_OF_WEEKEND_NIGHTS + NO_OF_WEEK_NIGHTS)) AS TOTAL_REVENUE
 FROM PROJ_DATA
 GROUP BY ROOM_TYPE_RESERVED
 order by TOTAL_REVENUE DESC
 LIMIT 1;
 
 
 --  OBSERVATION: This query calculates the total revenue generated by each room type by summing up the product of the average price per room and the total number of nights (weekend and weekday) stayed. It then groups the results by ROOM_TYPE_RESERVED and orders them in descending order to identify the room type with the highest revenue. By limiting the result to the top entry, the query reveals which room type is the most lucrative.
 
 
 --  INSIGHTS: These insights are vital for revenue management, as they highlight which room type contributes most significantly to the hotel's income, guiding decisions on pricing, promotions, and inventory management to maximize profitability.
 
 

