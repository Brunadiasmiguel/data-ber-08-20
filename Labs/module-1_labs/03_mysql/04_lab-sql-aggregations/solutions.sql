-- 1. From the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by district_id in ascending order.

SELECT
	district_id,
	COUNT(client_id)
FROM bank.client
WHERE district_id<10
GROUP BY
district_id
ORDER BY district_id ASC
LIMIT 10;

-- 2. From the card table, how many cards exist for each type? Rank the result starting with the most frequent type.

SELECT 
	type,
    COUNT(*) AS frequency
FROM bank.card
GROUP BY type
ORDER BY COUNT(type) DESC
LIMIT 10;

-- 3. Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.

SELECT 
	account_id,
	SUM(amount)
FROM bank.loan
GROUP BY account_id
ORDER BY SUM(amount) DESC
LIMIT 10;

-- 4. From the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order

SELECT
	date,
	COUNT(loan_id)
FROM bank.loan
WHERE date<930907
GROUP BY date
ORDER BY date DESC
LIMIT 5;

-- 5. From the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.


SELECT
	date,
    duration,
    COUNT(*)
FROM bank.loan
WHERE (date>=971201 and date <=971231)
GROUP BY duration,
			date
ORDER BY date ASC,
	count(duration) ASC
LIMIT 31;

-- 6. From the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.

SELECT
account_id,
type,
SUM(amount) AS total_amount
FROM bank.trans
WHERE account_id=396
GROUP BY type,
amount
ORDER BY type DESC
LIMIT 2;

-- 7. From the previous output, translate the values for type to English, rename the column to transaction_type, round total_amount down to an integer

SELECT *
FROM
LIMIT

-- 8. From the previous result, modify you query so that it returns only one row, with a column for incoming amount, outgoing amount and the difference

-- 9. Continuing with the previous example, rank the top 10 account_ids based on their difference
