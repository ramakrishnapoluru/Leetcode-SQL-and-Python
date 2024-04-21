<h2><a href="https://leetcode.com/problems/find-candidates-for-data-scientist-position/">3051. Find Candidates for Data Scientist Position</a></h2><h3>Easy</h3><hr><div class="sql-schema-wrapper__3VBi"><a class="sql-schema-link__3cEg">SQL Schema<svg viewBox="0 0 24 24" width="1em" height="1em" class="icon__1Md2"><path fill-rule="evenodd" d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg></a></div><div><p>Table: <font face="monospace"><code>Candidates</code></font></p>

<pre>+--------------+---------+ 
| Column Name  | Type    | 
+--------------+---------+ 
| candidate_id | int     | 
| skill        | varchar |
+--------------+---------+
(candidate_id, skill) is the primary key (columns with unique values) for this table.
Each row includes candidate_id and skill.
</pre>

<p>Write a query to find the <strong>candidates</strong> best suited for a Data Scientist position. The candidate must be proficient in <strong>Python</strong>, <strong>Tableau</strong>, and <strong>PostgreSQL</strong>.</p>

<p>Return <em>the result table ordered by </em><code>candidate_id</code> <em>in <strong>ascending order</strong></em>.</p>

<p>The result format is in the following example.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre><strong>Input:</strong> 
Candidates table:
+---------------+--------------+
| candidate_id  | skill        | 
+---------------+--------------+
| 123           | Python       |
| 234           | R            | 
| 123           | Tableau      | 
| 123           | PostgreSQL   | 
| 234           | PowerBI      | 
| 234           | SQL Server   | 
| 147           | Python       | 
| 147           | Tableau      | 
| 147           | Java         |
| 147           | PostgreSQL   |
| 256           | Tableau      |
| 102           | DataAnalysis |
+---------------+--------------+
<strong>Output:</strong> 
+--------------+
| candidate_id |  
+--------------+
| 123          |  
| 147          | 
+--------------+
<strong>Explanation:</strong> 
- Candidates 123 and 147 possess the necessary skills in Python, Tableau, and PostgreSQL for the data scientist position.
- Candidates 234 and 102 do not possess any of the required skills for this position.
- Candidate 256 has proficiency in Tableau but is missing skills in Python and PostgreSQL.
The output table is sorted by candidate_id in ascending order.
</pre>
</div>