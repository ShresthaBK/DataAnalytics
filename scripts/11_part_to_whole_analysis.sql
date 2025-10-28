/*
===============================================================================
Part-to-Whole Analysis - PostgreSQL
===============================================================================
Purpose:
    - Compare performance or metrics across dimensions or time periods.
    - Evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.
===============================================================================
*/

-- Which categories contribute the most to overall sales?
WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.category
)
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    ROUND((total_sales::FLOAT / SUM(total_sales) OVER ()) * 100, 2) AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;
