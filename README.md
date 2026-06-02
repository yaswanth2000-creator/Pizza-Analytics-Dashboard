# Pizza-Analytics-Dashboard
Pizza Data Analysis Dashboard built using Power BI with data cleaning, transformation, and interactive visualizations.

# Project Overview
The main objective of this project is to transform raw pizza sales data into meaningful business insights through interactive Power BI dashboards.

This project analyzes pizza sales performance, customer ordering behavior, revenue trends, and product performance using SQL and Power BI.

The project covers the complete analytics workflow including:
Data Analysis using SQL
Data cleaning and Transformation
KPI Calculation
Trend Analysis
Dashboard Development
Business Insights Generation


## Dataset Information
We’re using the publicly available dataset from Kaggle:
- Dataset Format: CSV File

Dataset contains information related to:
- Order ID
- Pizza ID
- Pizza Name
- Pizza Category
- Pizza Size
- Quantity Sold
- Order Date
- Order Time
- Unit Price
- Total Price

## Tools Used
- Power BI
- SQL (PostgreSQL)
- Power Query
- DAX
- CSV Dataset



# 1. Data Cleaning & Transformation
The dataset was cleaned and transformed using Power Query in Power BI.

- Replaced pizza size abbreviations (L, M, S) with Large, Medium, Small.
- Converted order_date from Text to Date datatype.
- Created Hour, Day Name, and Month Name columns from order_date.
- Created a Sales_by_Month column using conditional logic.
  Sales_by_months = UPPER(LEFT('public pizza_sales'[Month name],3))
- Created Sales_by_Day column to display day abbreviations (MON, TUE, WED, etc.).
  Sales_by_day = UPPER(LEFT('public pizza_sales'[Day Name],3)) 
- Created a Day_Number column to sort day-wise visualizations correctly.



# 2. DATA  ANALYSIS

## SALES KPIS
### Q1 Find the Total revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

### Q2 Find the total Orders 
SELECT Count(order_id) AS total_orders FROM pizza_sales;
SELECT Count(DISTINCT order_id) AS total_orders FROM pizza_sales;

### Q3 Find the total pizza sold
SELECT SUM(quantity) AS total_pizzas_sold FROM pizza_sales;

### Q4 Find Average order value 
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;

### Q5 Find Average Pizzas Per Order 
SELECT ROUND(SUM(quantity) * 1.0 / COUNT(DISTINCT order_id),2) AS avg_pizzas_per_order
FROM pizza_sales;

### Q6 Top 5 Best-Selling Pizzas
SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

### Q7 TOP 5 Highest Revenue Generating Pizza
SELECT pizza_name, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 5;

### Q8 Highest Revenue Contributing Category
SELECT pizza_category, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Revenue DESC;


## Time Analysis
### Q1 Find Hourly Trend
SELECT EXTRACT(HOUR FROM order_time) AS hour,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY hour
ORDER BY total_orders DESC;

### Q2 Find Daily Trend for Total Orders
SELECT EXTRACT(DAY FROM TO_DATE(order_date,'DD-MM-YYYY')) AS day,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY day
ORDER BY day;

### Q3 Find Monthly Sales Trend
SELECT EXTRACT(MONTH FROM TO_DATE(order_date,'DD-MM-YYYY')) AS month,
       SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY month
ORDER BY month;


## Product Analysis
### Q1 Sales by Pizza size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

### Q2 sales by Pizza category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue
FROM pizza_sales
GROUP BY pizza_category
ORDER BY pizza_category;

# Dashboard Pages
## 🏠 Home Page
KPI Cards
Total Revenue
Total Orders
Total Pizzas Sold
Average Order Value
Average Pizzas Per Order

### Visualizations
### Daily Trend for Total Orders
Insight: Orders are highest during weekends, especially Friday and Saturday.
### Monthly Trend for Total Orders
Insight: Sales peak during July and remain strong throughout the summer season.

### Sales by Pizza Size
Insight: Large pizzas contribute the highest percentage of sales.

### Sales by Pizza Category
Insight: Classic pizzas generate the largest share of revenue and orders.

### Hourly Trend for Orders
Insight: Customer orders peak during lunch and dinner hours.

## 🏆 Best & Worst Sellers Page
### Top 5 Pizzas by Quantity
Insight: The Classic Deluxe Pizza is the most ordered pizza by quantity.

### Top 5 Pizzas by Revenue
Insight: The Thai Chicken Pizza generates the highest revenue.

### Top 5 Pizzas by Total Orders
Insight: Classic Deluxe Pizza consistently appears among the most frequently ordered pizzas.

### Bottom 5 Pizzas by Quantity
Insight: The Brie Carre Pizza has the lowest sales volume.

### Bottom 5 Pizzas by Revenue
Insight: The Brie Carre Pizza contributes the least revenue.

### Bottom 5 Pizzas by Orders
Insight: These pizzas have limited customer demand compared to other menu items.

## Business Insights
### Revenue Analysis
Total Revenue generated: $817.86K
Average Order Value: $38.31
### Customer Ordering Behavior
Fridays and Saturdays are the busiest days.
Peak ordering hours occur during lunch and dinner periods.
### Product Performance
Classic category dominates overall sales.
Large-sized pizzas are the most preferred by customers.
Thai Chicken Pizza generates the highest revenue.
### Sales Opportunities
Underperforming pizzas can be re-evaluated through promotions or menu redesign.
High-performing pizzas can be highlighted in marketing campaigns.

## 3. Dashboard Features
The dashboard includes:
- Interactive slicers
- Dynamic filtering
- KPI Cards
- Revenue Analysis
- Product Performance Tracking
- Daily & Monthly Trends
- Category-wise Analysis
- Size-wise Analysis
- Best & Worst Seller Identification
  

## 4. Dashboard Preview
Home page : <img width="1145" height="642" alt="Home page " src="https://github.com/user-attachments/assets/f0d0877c-9888-46be-9bc5-3050ebf3f911" />

Best & Worst Sellers Page : <img width="1145" height="642" alt="Best -Worst sellers page" src="https://github.com/user-attachments/assets/aa350f0c-9e61-4b3c-81f8-d44aa678db61" />


## Repository includes:
- Dataset
- Power BI Dashboard (.pbix)
- Dashboard Screenshots
- README Documentation

## Final Thoughts & Next Steps
This project demonstrates:
- SQL Data Analysis
- Data cleaning and preprocessing
- DAX calculations
- Dashboard development
- Business insight generation using Power BI
The dashboard enables stakeholders to quickly identify sales trends, customer preferences, and product performance, helping drive data-driven business decisions.

Author
Yaswanth
Aspiring Data Analyst | Power BI Enthusiast | Business Intelligence Learner
