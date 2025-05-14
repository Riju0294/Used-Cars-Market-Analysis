create database car_sales;

use car_sales;

select *
from car;

/* 1. Most Expensive Used Car Model
Which used car is listed at the highest price? */

SELECT Model_Name, Price 
FROM car 
ORDER BY Price DESC 
LIMIT 1;

/* 2. Least Expensive Used Car Model
Which used car is the cheapest? */

SELECT Model_Name, Price 
FROM car
ORDER BY Price ASC 
LIMIT 1;

/* 3. Average Price of Used Cars by Brand
What is the average price of used cars for each brand? */

SELECT Model_Name, round(AVG(Price),2) AS Avg_Price 
FROM car 
GROUP BY Model_Name 
ORDER BY Avg_Price DESC;

/* 4. Cars with the Highest Resale Value
Which cars have the highest price compared to their manufacturing year? */

SELECT Model_Name, Manufacturing_year, Price 
FROM car 
ORDER BY Price DESC, Manufacturing_year DESC 
LIMIT 5;

/* 5. Effect of Ownership on Price
How does the number of previous owners affect the price of the car? */

SELECT Ownership, round(AVG(Price),2) AS Avg_Price 
FROM car 
GROUP BY Ownership 
ORDER BY Ownership ASC;

/* 6. Impact of KM Driven on Resale Value
Do higher mileage cars have lower resale prices? */

SELECT Model_Name, KM_driven, round(AVG(Price),2) AS Avg_Price 
FROM car 
GROUP BY Model_Name, KM_driven 
ORDER BY KM_driven DESC;

/* 7. Most Popular Fuel Type in Used Cars
Which fuel type is most common in the used car market? */

SELECT Fuel_Type, COUNT(*) AS Count 
FROM car 
GROUP BY Fuel_Type 
ORDER BY Count DESC;

/* 8. Best Value-for-Money Used Cars
Which cars have the best price-to-engine-capacity ratio? */

SELECT Model_Name, Price, Engine_capacity, (Price / Engine_capacity) AS Price_Per_CC 
FROM car 
ORDER BY Price_Per_CC ASC 
LIMIT 5;

/* 9. Transmission Preference in Used Cars
Are automatic cars priced higher than manual ones? */

SELECT Transmission, round(AVG(Price),2) AS Avg_Price 
FROM car 
GROUP BY Transmission 
ORDER BY Avg_Price DESC;

/* 10. Cars with the Fewest Imperfections
Which cars have the least number of imperfections? */

SELECT Model_Name, Imperfections 
FROM car 
ORDER BY Imperfections ASC 
LIMIT 5;

/* 11. Average Price of Used Cars by Manufacturing Year */

SELECT Manufacturing_year, round(AVG(Price),2) AS Avg_Price 
FROM car 
GROUP BY Manufacturing_year 
ORDER BY Manufacturing_year DESC;

/* 12. Cars with the Most Repainted Parts */

SELECT Model_Name, Repainted_Parts 
FROM car 
ORDER BY Repainted_Parts DESC 
LIMIT 5;

/* 13. Cars with the Highest Depreciation Rate
Which models have the lowest resale value compared to their new price? */

SELECT Model_Name, Manufacturing_year, Price, 
       round((Price / (2024 - Manufacturing_year)),2) AS Depreciation_Rate 
FROM car 
ORDER BY Depreciation_Rate ASC 
LIMIT 5;

/* 14. Most Affordable Cars with Automatic Transmission */

SELECT Model_Name, Price, Manufacturing_year, Transmission 
FROM car 
WHERE Transmission = 'Automatic' 
ORDER BY Price ASC 
LIMIT 5;

/* 15. Fuel Type with the Best Resale Value
Which fuel type holds the highest resale value? */

SELECT Fuel_Type, round(AVG(Price),2) AS Avg_Resale_Value 
FROM car 
GROUP BY Fuel_Type 
ORDER BY Avg_Resale_Value DESC;

/* 16. Cars with Lowest KM Driven and High Resale Price */

SELECT Model_Name, KM_driven, Price 
FROM car 
WHERE KM_driven < 20000 
ORDER BY Price DESC 
LIMIT 5;

/* 17. Cars Aged Over 10 Years but Still High in Price */

SELECT Model_Name, Manufacturing_year, Price 
FROM car 
WHERE (2024 - Manufacturing_year) > 10 
ORDER BY Price DESC 
LIMIT 5;

/* 18. Cars with Highest Imperfections but Still Expensive */

SELECT Model_Name, Imperfections, Price 
FROM car 
ORDER BY Imperfections DESC, Price DESC 
LIMIT 5;

/* 19. Price Trend Analysis Over Manufacturing Years */

SELECT Manufacturing_year, round(AVG(Price),2) AS Avg_Price 
FROM car 
GROUP BY Manufacturing_year 
ORDER BY Manufacturing_year ASC;

/* 20. Price Comparison Between Manual and Automatic Transmission */

SELECT Transmission, round(AVG(Price),2) AS Avg_Price 
FROM car 
GROUP BY Transmission;

/* 21. Cars with Best Price-to-KM Ratio */

SELECT Model_Name, Price, KM_driven, (Price / KM_driven) AS Price_Per_KM 
FROM car 
WHERE KM_driven > 0 
ORDER BY Price_Per_KM ASC 
LIMIT 5;

/* 22. Oldest Used Cars Still in Demand */

SELECT Model_Name, Manufacturing_year, COUNT(*) AS Listings 
FROM car 
GROUP BY Model_Name, Manufacturing_year 
ORDER BY Manufacturing_year ASC, Listings DESC 
LIMIT 5;

/* 23. Most Common Ownership Type in Used Cars */

SELECT Ownership, COUNT(*) AS Count 
FROM car 
GROUP BY Ownership 
ORDER BY Count DESC;