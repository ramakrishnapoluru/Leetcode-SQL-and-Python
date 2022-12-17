/* Write your T-SQL query statement below */


SELECT DISTINCT viewer_id as id
FROM (
	SELECT viewer_id
		,COUNT(article_id) OVER (PARTITION BY view_date,viewer_id) AS cnt
	FROM (
		SELECT DISTINCT article_id
			,author_id
			,viewer_id
			,view_date
		FROM VIEWS
		) V
	) AS a
WHERE cnt > 1 order by 1