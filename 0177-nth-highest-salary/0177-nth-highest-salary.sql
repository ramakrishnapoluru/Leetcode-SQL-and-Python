CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
   SELECT Salary FROM 
        (
            SELECT
                row_number() OVER (ORDER BY salary DESC) AS row_num,            
                emp.salary
            FROM (SELECT DISTINCT Salary FROM Employee) emp
        ) result
        WHERE row_num = @N
        
    );
END