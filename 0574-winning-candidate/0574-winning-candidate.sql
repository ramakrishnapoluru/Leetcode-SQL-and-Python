/* Write your T-SQL query statement below */


SELECT TOP 1 C.name FROM Candidate C JOIN Vote V
ON C.id=V.candidateId
GROUP BY  C.name ORDER BY COUNT(V.id) DESC 