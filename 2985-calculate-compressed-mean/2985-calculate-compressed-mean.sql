/* Write your T-SQL query statement below */





SELECT 

ROUND(
SUM(item_count * order_occurrences)*1.00/
SUM(order_occurrences) , 2
)
AS average_items_per_order

FROM Orders

