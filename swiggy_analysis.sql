-- Check total records
SELECT COUNT(*) FROM swiggy;

-- Check for missing values in key columns
SELECT 
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS null_names,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS null_ratings,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_cities
FROM swiggy;

-- Remove rows where rating is invalid ('NEW' or '--')
DELETE FROM swiggy 
WHERE rating = 'NEW' OR rating = '--';

-- Standardize rating column to numeric format
UPDATE swiggy
SET rating = CAST(rating AS DECIMAL(2,1))
WHERE rating NOT IN ('NEW', '--');
-- Q1: Top 10 cities with the most listed restaurants
SELECT city, COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY city
ORDER BY total_restaurants DESC
LIMIT 10;

-- Q2: Top 10 most popular cuisines across India
SELECT cuisine, COUNT(*) AS count
FROM swiggy
GROUP BY cuisine
ORDER BY count DESC
LIMIT 10;

-- Q3: Top 10 restaurant chains with the most branches
SELECT name, COUNT(*) AS branches
FROM swiggy
GROUP BY name
ORDER BY branches DESC
LIMIT 10;

-- Q4: Top 5 cities with highest average rating (cities with > 50 restaurants)
SELECT city, 
       ROUND(AVG(CAST(rating AS FLOAT)), 2) AS avg_rating,
       COUNT(*) AS total_restaurants
FROM swiggy
WHERE rating NOT IN ('NEW', '--')
GROUP BY city
HAVING COUNT(*) > 50
ORDER BY avg_rating DESC
LIMIT 5;

-- Q5: Top 10 cities by average cost for two
SELECT city, 
       ROUND(AVG(CAST(REPLACE(cost, '₹', '') AS INTEGER)), 0) AS avg_cost
FROM swiggy
WHERE cost IS NOT NULL
GROUP BY city
ORDER BY avg_cost DESC
LIMIT 10;

-- Q6: Cuisines with the highest average rating (> 100 restaurants)
SELECT cuisine, 
       ROUND(AVG(CAST(rating AS FLOAT)), 2) AS avg_rating,
       COUNT(*) AS restaurant_count
FROM swiggy
WHERE rating NOT IN ('NEW', '--')
GROUP BY cuisine
HAVING COUNT(*) > 100
ORDER BY avg_rating DESC
LIMIT 10;

-- Q7: Highly-rated, high-volume restaurants (> 4.5 rating & >= 1000 ratings)
SELECT name, city, rating, rating_count, cost
FROM swiggy
WHERE CAST(rating AS FLOAT) >= 4.5 
  AND CAST(REPLACE(REPLACE(rating_count, '+ ratings', ''), '+', '') AS INTEGER) >= 1000
ORDER BY rating DESC
LIMIT 20;

-- Q8: Value-for-money cities (High rating, low cost)
SELECT city, 
       ROUND(AVG(CAST(rating AS FLOAT)), 2) AS avg_rating,
       ROUND(AVG(CAST(REPLACE(cost, '₹', '') AS INTEGER)), 0) AS avg_cost
FROM swiggy
WHERE rating NOT IN ('NEW', '--')
GROUP BY city
HAVING COUNT(*) > 30
ORDER BY avg_rating DESC, avg_cost ASC
LIMIT 10;