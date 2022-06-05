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

-- 3. What was the first item from the menu purchased by each customer?

SELECT s1.customer_id, s2.product_id, s1.first_order
FROM
(SELECT customer_id, MIN(order_date) AS first_order
FROM dannys_diner.sales
GROUP BY customer_id) s1 
INNER JOIN dannys_diner.sales s2 ON s1.customer_id=s2.customer_id AND s1.first_order=s2.order_date
;