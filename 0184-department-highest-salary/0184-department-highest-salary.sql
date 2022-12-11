/* Write your T-SQL query statement below */


select distinct data.Department as Department, E1.name as Employee, data.salary as Salary
from (
    select D.name as Department, max(E.salary) as salary, D.id as id
    from Employee E, Department D where E.departmentId = D.id group by D.name, D.id
    ) data, Employee E1
where E1.salary = data.salary and data.id = E1.departmentId