DROP TABLE IF EXISTS pizza_sales;
CREATE TABLE pizza_sales (
    pizza_id INT,
    order_id INT,
    pizza_name_id VARCHAR(100),
    quantity INT,
    order_date VARCHAR(100),
    order_time TIME,
    unit_price DECIMAL(5,2),
    total_price DECIMAL(5,2),
    pizza_size VARCHAR(10),
    pizza_category VARCHAR(50),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(100)
);

-- DATA ANALYSIS 
---------------------------------
-- SALES KPIS
--------------------------------

-- Q1 Find the Total revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

--Q2 Find the total Orders 
SELECT Count(order_id) AS total_orders FROM pizza_sales;
SELECT Count(DISTINCT order_id) AS total_orders FROM pizza_sales;

--Q3 Find the total pizza sold
SELECT SUM(quantity) AS total_pizzas_sold FROM pizza_sales;

--Q4 Find Average order value 
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;

--Q5 Find Average Pizzas Per Order 
SELECT ROUND(SUM(quantity) * 1.0 / COUNT(DISTINCT order_id),2) AS avg_pizzas_per_order
FROM pizza_sales;


--Q6 Top 5 Best-Selling Pizzas
SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

--Q7 TOP 5 Highest Revenue Generating Pizza
SELECT pizza_name, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 5;

--Q8 Highest Revenue Contributing Category
SELECT pizza_category, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Revenue DESC;


---------------------------------
-- Time Analysis
--------------------------------
--Q1 Find Hourly Trend
SELECT EXTRACT(HOUR FROM order_time) AS hour,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY hour
ORDER BY total_orders DESC;

--Q2 Find Daily Trend for Total Orders
SELECT EXTRACT(DAY FROM TO_DATE(order_date,'DD-MM-YYYY')) AS day,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY day
ORDER BY day;

--Q3 Find Monthly Sales Trend
SELECT EXTRACT(MONTH FROM TO_DATE(order_date,'DD-MM-YYYY')) AS month,
       SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY month
ORDER BY month;


---------------------------------
-- Product Analysis
--------------------------------
--Q1 Sales by Pizza size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

--Q2 sales by Pizza category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue
FROM pizza_sales
GROUP BY pizza_category
ORDER BY pizza_category;

