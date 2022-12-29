/* Write your T-SQL query statement below */


SELECT 
stock_name,
SUM(CASE WHEN operation='Sell' THEN price ELSE -1*price END)
 capital_gain_loss
FROM Stocks
GROUP BY stock_name