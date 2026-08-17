# Swiggy Restaurant Data Analysis using SQL

## Project Overview
An exploratory data analysis of 150,000+ restaurant records listed on Swiggy across 600+ Indian cities. This project performs data cleaning, aggregation, and analytical querying using SQLite to derive key business insights regarding pricing dynamics, cuisine popularity, and geographic performance.

## Tech Stack & Tools
- **Database Engine:** SQLite / DB Browser for SQLite
- **Language:** SQL (Data Cleaning, Aggregations, GROUP BY, Window Functions & Filtering)

## Key Findings & Business Insights
1. **Value-for-Money Hotspots:**
   - **Mylapore, Chennai** offers top-rated culinary options with an average rating of **4.23** at an affordable average cost of **₹313**.
   - **Burrabazar, Kolkata** leads budget dining with an average cost of **₹291** while maintaining a high **4.19** average rating.
2. **Premium Locations:**
   - **Bandra West, Mumbai** exhibits higher pricing structures (average cost **₹485**) alongside strong average ratings (**4.20**).
3. **Cuisine & Density Dynamics:**
   - Indian main courses, North Indian, and Fast Food dominate national restaurant offerings.
   - High-density urban hubs account for the majority of multi-branch chain listings.

## Dataset Schema
The analysis operates on the cleaned `swiggy` table with the following schema:
- `id`: Unique identifier for each listing
- `name`: Restaurant name
- `city`: Location/City
- `rating`: Customer rating (standardized to numeric format)
- `rating_count`: Volume of ratings received
- `cost`: Average cost for two (cleaned of currency symbols)
- `cuisine`: Primary cuisine category served

## How to Run
1. Download the dataset from [Kaggle Swiggy Dataset](https://www.kaggle.com/datasets/ashishjangra27/swiggy-restaurants-dataset).
2. Open **DB Browser for SQLite** and create a new database.
3. Import `swiggy.csv` as table `swiggy`.
4. Execute the SQL queries in `swiggy_analysis.sql`.
