-- A. Overall Business Performance
-- 1. What is the total sales revenue generated across all transactions?
SELECT SUM(sales) AS total_revenue 
FROM supermarket_sales;

-- 2. What is the total gross income generated across all transactions?
SELECT SUM(gross_income) AS total_gross_income
FROM supermarket_sales;


-- B. Product & Customer Analysis
-- 3. How do product lines perform in terms of sales, volume, and gross income?
SELECT 
    product_line,
    SUM(quantity) AS total_quantity,
    SUM(sales) AS total_revenue,
    SUM(gross_income) AS total_gross_income,
    AVG(unit_price) AS avg_unit_price
FROM supermarket_sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- 4. How does average customer rating differ across product lines?
SELECT product_line, AVG(rating) AS average_rating
FROM supermarket_sales
GROUP BY product_line
ORDER BY average_rating DESC;

-- 5. How do total sales and average transaction value differ between Member and Normal customers?
SELECT customer_type, COUNT(invoice_id) AS transaction_count, SUM(sales) AS revenue,
AVG(sales) AS avg_transaction_value
FROM supermarket_sales
GROUP BY customer_type
ORDER BY revenue DESC;

-- 6. What percentage of total revenue is contributed by Male vs Female customers?
SELECT gender, SUM(sales) AS revenue,
CAST((SUM(sales)/(SELECT SUM(sales) FROM supermarket_sales))*100.0 AS DECIMAL (10,2)) AS percentage_contribution
FROM supermarket_sales
GROUP BY gender
ORDER BY revenue DESC;

-- 7. How does product-line revenue differ between Member and Normal customers?
SELECT product_line,
SUM(CASE WHEN customer_type = 'Member' THEN sales ELSE 0 
END) AS member_revenue,
SUM(CASE WHEN customer_type = 'Normal' THEN sales ELSE 0 
END) AS normal_revenue,
SUM(CASE WHEN customer_type = 'Member' THEN sales ELSE 0 END)
- SUM(CASE WHEN customer_type = 'Normal' THEN sales ELSE 0 END) AS revenue_difference
FROM supermarket_sales
GROUP BY product_line
ORDER BY product_line;

-- 8. Which customer segment generates the most revenue when we consider both gender and customer type?
SELECT customer_type, gender,
COUNT(*) AS transaction_count,
SUM(sales) AS revenue,
AVG(sales) AS avg_transaction,
AVG(rating) AS avg_rating
FROM supermarket_sales
GROUP BY customer_type, gender
ORDER BY revenue DESC;


-- C. Branch & Store Performance
-- 9. How do branches compare in revenue and customer satisfaction?
SELECT branch,
SUM(sales) AS revenue,
AVG(rating) AS average_rating,
COUNT(*) AS transaction_count,
AVG(sales) AS average_transaction_value
FROM supermarket_sales
GROUP BY branch
ORDER BY revenue DESC;

-- 10. Does the difference between Member and Normal customers vary by branch?
SELECT branch, customer_type, COUNT(*) AS transactions_count, SUM(sales) AS total_revenue, AVG(sales) AS average_transaction
FROM supermarket_sales
GROUP BY branch, customer_type
ORDER BY total_revenue DESC;

-- 11. What is the #1 product line within each branch?
WITH best_product_line AS(
SELECT branch, product_line, SUM(sales) AS revenue,
ROW_NUMBER() OVER (PARTITION BY branch ORDER BY SUM(sales) DESC) AS product_rank
FROM supermarket_sales
GROUP BY branch, product_line
)
SELECT branch, product_line, revenue
FROM best_product_line
WHERE product_rank=1;


-- D. Time & Operations
-- 12. How much sales revenue was generated each month?
SELECT DATENAME(MONTH, date) AS month_name,
COUNT(*) AS transaction_count,
SUM(sales) AS revenue,
AVG(sales) AS avg_transaction_value
FROM supermarket_sales
GROUP BY MONTH(date), DATENAME(MONTH, date)
ORDER BY MONTH(date);

-- 13. Which days are busiest?
SELECT DATENAME(WEEKDAY,date) AS day_name,
COUNT(*) AS transactions_count,
SUM(sales) AS revenue
FROM supermarket_sales
GROUP BY DATENAME(WEEKDAY,date)
ORDER BY transactions_count DESC;

-- 14. Which hours are busiest?
SELECT DATEPART(HOUR,time) AS hour,
COUNT(*) AS transactions_count,
SUM(sales) AS revenue
FROM supermarket_sales
GROUP BY DATEPART(HOUR,time)
ORDER BY transactions_count DESC;

-- 15. Which payment method is most popular, and which generates the most revenue?
SELECT payment, COUNT(*) AS transaction_count, SUM(sales) AS revenue, AVG(sales) AS average_transaction
FROM supermarket_sales
GROUP BY payment
ORDER BY transaction_count DESC;
