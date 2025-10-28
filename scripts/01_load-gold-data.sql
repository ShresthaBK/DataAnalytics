--conntect to database using cmd
psql -h localhost -U postgress -d DataWarehouseAnalytics

Load-dim-customer
\copy gold.dim_customers(
    customer_key,
    customer_id,
    customer_number,
    first_name,
    last_name,
    country,
    marital_status,
    gender,
    birthdate,
    create_date
) FROM '/Users/balkrishnashrestha/Data/DataAnalytics/datasets/gold.dim_customers.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');


----load products
\copy gold.dim_products(
    product_key,
    product_id,
    product_number,
    product_name,
    category_id,
    category,
    subcategory,
    maintenance,
    cost,
    product_line,
    start_date
) FROM '/Users/balkrishnashrestha/Data/DataAnalytics/datasets/gold.dim_products.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

--load facts-sales

\copy gold.fact_sales(
    order_number,
    product_key,
    customer_key,
    order_date,
    shipping_date,
    due_date,
    sales_amount,
    quantity,
    price
) FROM '/Users/balkrishnashrestha/Data/DataAnalytics/datasets/gold.fact_sales.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');



