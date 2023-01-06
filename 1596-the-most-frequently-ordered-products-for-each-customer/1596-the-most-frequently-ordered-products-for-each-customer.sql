/* Write your T-SQL query statement below */

-- SELECT customer_id,product_id,product_name FROM 
-- (
-- SELECT 
-- o.customer_id,p.product_id,p.product_name,
-- MAX(COUNT(order_id)) OVER(PARTITION BY o.customer_id,p.product_id) Product_Count,
-- DENSE_RANK() OVER(PARTITION BY o.customer_id,p.product_id ORDER BY COUNT(order_id) DESC) AS DR
-- FROM Orders O LEFT JOIN Customers C
-- ON O.customer_id=C.customer_id
-- LEFT JOIN  Products P ON P.product_id=O.product_id
-- GROUP BY o.customer_id,p.product_id,p.product_name
-- ) AS A
-- WHERE 


-- SELECT 
-- o.customer_id,p.product_id,p.product_name,
-- COUNT(order_id) AS ORDERS
-- FROM Orders O LEFT JOIN Customers C
-- ON O.customer_id=C.customer_id
-- LEFT JOIN  Products P ON P.product_id=O.product_id
-- GROUP BY o.customer_id,p.product_id,p.product_name

SELECT customer_id, product_id, product_name
FROM (
    SELECT O.customer_id, O.product_id, P.product_name, 
    RANK() OVER (PARTITION BY O.customer_id ORDER BY COUNT(O.product_id) DESC) AS rnk
    FROM Orders O
    JOIN Products P
    ON O.product_id = P.product_id  
    GROUP BY O.customer_id,O.product_id,P.product_name
) temp
WHERE rnk = 1 
ORDER BY customer_id,product_id


