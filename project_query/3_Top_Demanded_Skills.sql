/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
  providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    count(job_postings_fact.job_id) AS demand_count

FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE job_title_short = 'Data Analyst' AND
      job_work_from_home = TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;




/*

### Insights

- SQL is the most in-demand skill for remote Data Analyst jobs, with 7,291 job postings requiring SQL.

- Excel is the second most demanded skill with 4,611 postings, followed closely by Python with 4,330 postings.

- Tableau is also highly demanded among remote Data Analyst roles, appearing in 3,745 job postings.

- The results show that SQL has a clear lead over the other skills, indicating that SQL is a fundamental requirement for Data Analyst positions.

- Excel and Python have very similar demand levels, suggesting that both spreadsheet analysis and programming skills are important parts of the Data Analyst skill set.

- SQL is also the most demanded skill among Data Analyst jobs in Singapore, with 3,635 postings. This reinforces the importance of SQL across different job markets.

- Overall, the results suggest that SQL, Excel, Python, and Tableau form a strong core skill set for Data Analysts, with SQL being the most essential skill to develop first.



======RESULTS======
[
  {
    "skills": "sql",
    "demand_count": "7291",
    "job_location": "Anywhere"
  },
  {
    "skills": "excel",
    "demand_count": "4611",
    "job_location": "Anywhere"
  },
  {
    "skills": "python",
    "demand_count": "4330",
    "job_location": "Anywhere"
  },
  {
    "skills": "tableau",
    "demand_count": "3745",
    "job_location": "Anywhere"
  },
  {
    "skills": "sql",
    "demand_count": "3635",
    "job_location": "Singapore"
  }
]







