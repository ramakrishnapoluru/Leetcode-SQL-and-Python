/* Write your T-SQL query statement below */


-- (SELECT
-- C.customer_id,C.customer_name
-- FROM Customers C JOIN Orders O
-- ON C.customer_id=O.customer_id
-- WHERE O.product_name IN ('A')
-- INTERSECT
-- SELECT
-- C.customer_id,C.customer_name
-- FROM Customers C JOIN Orders O
-- ON C.customer_id=O.customer_id
-- WHERE O.product_name IN ('B'))
-- EXCEPT
-- SELECT
-- C.customer_id,C.customer_name
-- FROM Customers C JOIN Orders O
-- ON C.customer_id=O.customer_id
-- WHERE O.product_name IN ('C')

-- select cs.customer_id, cs.customer_name from Orders ord 
-- join Customers cs
-- on ord.customer_id = cs.customer_id
-- group by cs.customer_id, cs.customer_name
-- having sum(case when product_name='A' then 1 else 0 end)>0 and
-- sum(case when product_name='B' then 1 else 0 end)>0 and
-- sum(case when product_name='C' then 1 else 0 end)=0
-- order by cs.customer_id

SELECT customer_id,customer_name
FROM 
( SELECT c.customer_id as customer_id,c.customer_name as customer_name, STRING_AGG(product_name,',') as list
FROM
Orders o
JOIN Customers c
ON c.customer_id = o.customer_id
 GROUP BY c.customer_id,c.customer_name
)as t
WHERE list LIKE '%A,B%' AND LIST NOT LIKE '%C%'
ORDER BY customer_id
