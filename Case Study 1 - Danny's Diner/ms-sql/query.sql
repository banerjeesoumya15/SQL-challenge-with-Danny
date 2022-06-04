use DataWithDanny;

-- 1. What is the total amount each customer spent at the restaurant?

SELECT s.customer_id, SUM(m.price) AS total_sales
FROM dannys_diner.sales s INNER JOIN dannys_diner.menu m ON s.product_id=m.product_id
GROUP BY s.customer_id;

-- 2. How many days has each customer visited the restaurant?

SELECT s.customer_id, COUNT(DISTINCT s.order_date) AS total_days
FROM dannys_diner.sales s
GROUP BY s.customer_id
ORDER BY 1