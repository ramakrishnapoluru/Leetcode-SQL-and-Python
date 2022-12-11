CREATE FUNCTION getUserIDs(@startDate DATE, @endDate DATE, @minAmount INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        
SELECT COUNT(DISTINCT user_id) AS user_cnt
FROM Purchases
WHERE amount >= @minAmount
	AND time_stamp BETWEEN @startDate
		AND @endDate
    );
END