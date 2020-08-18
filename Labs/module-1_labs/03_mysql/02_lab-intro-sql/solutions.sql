-- 1: From the order_items table, find the price of the highest priced order item and lowest price order item.

SELECT 
	MIN(price) AS Minimum_price,
    MAX(price) AS Maximum_price
FROM olist.order_items
LIMIT 1000;

-- 2: From the order_items table, what is range of the shipping_limit_date of the orders?

SELECT shipping_limit_date
FROM olist.order_items
ORDER BY shipping_limit_date DESC
LIMIT 1;

SELECT shipping_limit_date
FROM olist.order_items
ORDER BY shipping_limit_date ASC
LIMIT 1;

-- OR

SELECT
    MIN(shipping_limit_date)  AS min_shipping_date,
    MAX(shipping_limit_date) AS max_shipping_date
FROM olist.order_items;

-- 3. From the customers table, find the 3 states with the greatest number of customers


SELECT
	customer_state,
    COUNT(customer_state)
    FROM olist.customers
    GROUP BY customer_state
	ORDER BY COUNT(customer_state) DESC
    LIMIT 3;


-- 4. From the customers table, within the state with the greatest number of customers, find the 3 cities with the greatest number of customers.

SELECT
	customer_city,
	COUNT(1)
FROM olist.customers
WHERE (customer_state='SP')
GROUP BY customer_city,
		customer_state
ORDER BY COUNT(customer_city) DESC
LIMIT 3;

-- 5. From the closed_deals table, how many distinct business segments are there (not including null)?

SELECT
	COUNT(DISTINCT business_segment) AS distinct_business
FROM olist.closed_deals;

-- 6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).

SELECT business_segment,
   SUM(declared_monthly_revenue) AS total_declared_monthly_revenue
FROM olist.closed_deals
GROUP BY business_segment
ORDER BY total_declared_monthly_revenue DESC
LIMIT 3;

-- 7. From the order_reviews table, find the total number of distinct review score values

SELECT
	count( DISTINCT review_score)
FROM olist.order_reviews;

-- 8. In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 - 5.

#SOLUTION FROM TA, didn´t understand the question

SELECT
       review_score,
    IF(review_score = 1, 'very dissatisfied',
    IF(review_score = 2, 'moderately dissatisfied',
    IF(review_score = 3, 'neutral',
    IF(review_score = 4, 'moderately satisfied',
    IF(review_score = 5, 'very satisfied','undefined'))))) AS review_category
FROM olist.order_reviews;

SELECT
	review_score,
	CASE
		WHEN review_score = 1 THEN 'very dissatisfied'
        WHEN review_score = 2 THEN 'moderately dissatisfied'
        WHEN review_score = 3 THEN 'neutral'
        WHEN review_score = 4 THEN 'moderately satisfied'
        WHEN review_score = 5 THEN 'very satisfied'
        ELSE 'undefined'
	END 										AS review_category
FROM olist.order_reviews;

-- 9. From the order_reviews table, find the review score occurring most frequently and how many times it occurs.
SELECT
    review_score,
    count(review_score)
FROM olist.order_reviews
GROUP BY review_score
ORDER BY count(review_score) DESC
LIMIT 1;
