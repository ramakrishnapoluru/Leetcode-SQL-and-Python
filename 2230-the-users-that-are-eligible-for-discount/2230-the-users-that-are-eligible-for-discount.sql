CREATE PROCEDURE getUserIDs(@startDate DATE, @endDate DATE, @minAmount INT) AS
BEGIN
    /* Write your T-SQL query statement below. */
    
        SELECT DISTINCT user_id
        FROM Purchases
        WHERE amount >= @minAmount
	    AND time_stamp BETWEEN @startDate
		AND @endDate
    
END