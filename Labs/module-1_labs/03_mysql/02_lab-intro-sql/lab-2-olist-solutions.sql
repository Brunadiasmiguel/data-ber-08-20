-- 1. From the marketing_qualified_leads table, find the earliest and latest first_contact_date.

SELECT 
	MIN(DATE(first_contact_date)) AS earliest_date,
    MAX(DATE(first_contact_date)) AS latest_date
FROM olist.marketing_qualified_leads
LIMIT 1000;

-- 2. From the marketing_qualified_leads table, find the top 3 most frequent origin types for all first_contact_date entries in 2018.

SELECT
	origin,
    count(*)
FROM olist.marketing_qualified_leads
GROUP BY origin
ORDER BY COUNT(origin) DESC
LIMIT 3;

-- or from solutions:

SELECT
    COUNT(first_contact_date),
    origin
FROM olist.marketing_qualified_leads
WHERE first_contact_date >= 2018-01-01
GROUP BY origin
ORDER BY COUNT(first_contact_date) DESC
LIMIT 3;

-- 3. From the marketing_qualified_leads table, find the first_contact_date with the highest number of mql_id entries and state the number of entries on that date.

-- ASK

SELECT
    first_contact_date,
    COUNT(mql_id)
FROM olist.marketing_qualified_leads
GROUP BY first_contact_date
ORDER BY COUNT(mql_id) DESC
LIMIT 1;



-- 4. From the products table, find the name and count of the top 2 product category names.

SELECT
	product_category_name,
	COUNT(*)
FROM olist.products
GROUP BY product_category_name
ORDER BY COUNT(product_category_name) DESC
LIMIT 2;

-- 5 From the products table, find the product_category_name with the highest recorded product weight in grams.

SELECT
	product_category_name,
	product_weight_g
FROM olist.products
GROUP BY product_category_name,
		product_weight_g 
ORDER BY product_weight_g DESC
LIMIT 1;

-- 6. From the products table, find the product_category_name with the greatest sum of dimensions including length, height and width in centimeters.

SELECT
    product_category_name,
    product_length_cm + product_height_cm + product_width_cm AS total
FROM olist.products
ORDER BY total DESC
LIMIT 1;

-- 7. From the order_payments table, find the payment_type with the greatest number of order_id entries and the count of that payment type.
SELECT
    payment_type,
    COUNT(*)
FROM olist.order_payments
GROUP BY
    payment_type
ORDER BY
    COUNT(order_id) DESC
LIMIT 1;
-- 8. From the order_payments table, find the highest payment value for an individual order_id.

SELECT
    payment_value
FROM olist.order_payments
GROUP BY
    payment_value,
    order_id
ORDER BY payment_value DESC
LIMIT 1;

-- 9. From the sellers table, find the 3 seller states with the greatest number of distinct seller cities.

SELECT
    seller_state,
    COUNT(DISTINCT seller_city)
FROM olist.sellers
GROUP BY seller_state
ORDER BY COUNT(DISTINCT seller_city) DESC
LIMIT 3;