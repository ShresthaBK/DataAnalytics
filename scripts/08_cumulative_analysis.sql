/*
===============================================================================
Cumulative Analysis - PostgreSQL
===============================================================================
*/

-- Calculate the total sales per year 
-- and the running total of sales over time 
SELECT
    order_year,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_year) AS running_total_sales,
    AVG(avg_price) OVER (ORDER BY order_year) AS moving_average_price
FROM
(
    SELECT 
        DATE_TRUNC('year', order_date) AS order_year,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATE_TRUNC('year', order_date)
) t
ORDER BY order_year;
