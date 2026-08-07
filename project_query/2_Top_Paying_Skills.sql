/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
  helping job seekers understand which skills to develop that align with top salaries
*/ 

WITH top_jobs_paying AS(

SELECT 
    job_id,
    job_title,
    job_schedule_type,
    salary_year_avg,
    name AS company_dim

FROM job_postings_fact
LEFT JOIN company_dim on company_dim.company_id = job_postings_fact.company_id
WHERE job_title_short = 'Data Analyst' AND
job_location = 'Anywhere' AND
salary_year_avg IS NOT NULL 
ORDER BY salary_year_avg DESC
limit 10
)

SELECT 
    top_jobs_paying.*,
    skills AS skills
FROM top_jobs_paying
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_jobs_paying.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC
;

/*
## 2. Skills Required for the Top 10 Highest-Paying Data Analyst Jobs

This analysis examines the skills associated with the top 10 highest-paying remote Data Analyst jobs.

### Most Common Skills

1. SQL — 9 out of 10 jobs
2. Python — 8 out of 10 jobs
3. Tableau — 6 out of 10 jobs
4. R — 4 out of 10 jobs
5. Excel — 4 out of 10 jobs
6. Azure — 3 out of 10 jobs
7. Power BI — 3 out of 10 jobs
8. Pandas — 3 out of 10 jobs
9. Go — 3 out of 10 jobs
10. Snowflake — 3 out of 10 jobs

### Insights

- SQL is the most common skill among the top 10 highest-paying Data Analyst jobs, appearing in 9 out of 10 positions. This reinforces SQL as a core skill even for high-paying Data Analyst roles.

- Python appears in 8 out of the 10 highest-paying positions, showing that programming skills become particularly valuable in advanced and higher-paying analytics roles.

- Tableau appears in 6 out of 10 positions, indicating that data visualization remains an important requirement even among high-paying Data Analyst jobs.

- R and Excel each appear in 4 out of 10 positions. While they are less common than SQL and Python in this group, they remain relevant skills for high-paying analytics roles.

- Cloud and data-platform technologies such as Azure, Snowflake, AWS, and Databricks also appear among the top-paying positions. This suggests that higher-level Data Analyst roles can require skills beyond traditional analysis and visualization.

- The skill requirements of these top-paying positions show a combination of core analytics skills (SQL, Excel, Tableau) and more advanced technical skills (Python, cloud platforms, Databricks, Snowflake, and Pandas).

- The results suggest that developing SQL alone may be enough to enter the Data Analyst field, but combining SQL with Python, visualization, and modern data-platform technologies can help target more advanced and higher-paying opportunities.

### Career Takeaway

For someone aiming to become a Data Analyst, the results suggest a practical progression:

SQL → Excel → Python → Data Visualization → Cloud & Modern Data Platforms

=======RESULTS TOP10=======
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_dim": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_dim": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_dim": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_dim": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_dim": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_dim": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_dim": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_dim": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_dim": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_dim": "AT&T",
    "skills": "excel"
  }
]*/