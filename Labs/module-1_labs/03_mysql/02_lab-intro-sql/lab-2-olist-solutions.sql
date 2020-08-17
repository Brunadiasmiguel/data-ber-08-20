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

-- 3. From the marketing_qualified_leads table, find the first_contact_date with the highest number of mql_id entries and state the number of entries on that date.

SELECT 
    first_contact_date,
    SUM(mql_id)
FROM olist.marketing_qualified_leads
GROUP BY first_contact_date,
		mql_id
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

SELECT *
FROM olist.products
LIMIT 1;
