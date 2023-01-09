/* Write your T-SQL query statement below */


select a.student_id,a.student_name,a.subject_name, count(b.subject_name) attended_exams  
    from (select student_id,student_name,subject_name from Students,Subjects ) a 
    left join examinations b 
    on a.student_id = b.student_id and a.subject_name  = b.subject_name 
group by a.student_id,a.student_name,a.subject_name