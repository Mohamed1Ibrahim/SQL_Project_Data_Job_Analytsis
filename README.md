# 📌Introduction
 

This project is a deep dive into the Data Analyst job market, with the goal of understanding what the market is really looking for. 🔎📊

Throughout this project, I explored the job market to answer a few key questions:

- 💰 Which Data Analyst roles offer the highest salaries?
- 📈 Which skills are most in demand across Data Analyst job postings?
- 🚀 Which skills are associated with higher salaries?
- 🎯 Which skills provide the best balance between demand and earning potential?

The goal is not just to look at job numbers, but to turn real job-market data into insights that can help guide my career and identify the skills worth investing in.

🔎 SQL Queries? check them out 
here : [project_sql folder](/project_query/)

# Background



💰 I wanted to explore which Data Analyst roles offer the highest salaries, which skills are most in demand, and which skills are associated with better-paying opportunities.

🎯 The ultimate goal was to turn this analysis into practical insights that can help identify the right skills to focus on and make smarter career decisions in the Data Analytics field.

The dataset for this project comes from [Luke Barousse's SQL Course](https://lukebarousse.com/sql), covering job postings, salaries, locations, and required skills.


# Tools I Used

I used a simple set of tools to build and document this project:

- **PostgreSQL** — Used to store and work with the job market dataset.
- **SQL** — Used to explore the data, filter job postings, compare salaries, and identify the most relevant skills.
- **Visual Studio Code** — My main workspace for writing and running SQL queries.
- **Git & GitHub** — Used to manage the project, track changes, and publish the analysis.

# The Analysis

This analysis explores the Data Analyst job market through a series of SQL queries, with each query focusing on a specific question about salaries, job opportunities, and in-demand skills.

### 1. Top Paying Data Analyst Jobs

To identify the highest-paying opportunities, I looked at Data Analyst roles with reported annual salaries, focusing on remote positions. The results are ranked by salary to highlight the roles offering the strongest earning potential in the market.

```sql
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_dim

FROM job_postings_fact
LEFT JOIN company_dim on company_dim.company_id = job_postings_fact.company_id
WHERE job_title_short = 'Data Analyst' AND
job_location = 'Anywhere' AND
salary_year_avg IS NOT NULL 
ORDER BY salary_year_avg DESC
LIMIT 10;
```
The highest-paying role reaches $650K annually, making it a clear outlier compared with the rest of the top 10.

Senior positions such as Director and Principal Data Analyst also show strong earning potential, with several roles exceeding $180K.

Specialized roles, such as Marketing Data Analyst, can also command high salaries.

![top_paying_roles](assets\top_paying_data_analyst_jobs_clean.png)
*Bar graph visualizing the salary for the top 10 salaries for data analysts; ChatGPT generated this graph from my SQL query results*

### 2. Top_Paying_Job_Skills 

To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles. 

```sql 
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
```
- Databricks, PySpark, Jupyter, and PowerPoint are associated with the highest average salary at around $255.8K, but each appears in only 1 job, so the result should be interpreted cautiously.
- Hadoop follows at $232.4K, while AWS, Azure, and Power BI are associated with average salaries above $220K.
- More common skills such as SQL (8 jobs), Tableau (6), R (4), Excel (3), and Pandas (3) still show strong average salaries, making them more reliable signals than one-off skills.
- Key Note: A high average salary does not necessarily mean a skill itself causes higher pay; rare skills may appear in only a few highly paid roles.

![top_paying_skills](assets\top_paying_job_skills.png)

*Bar graph visualizing the average salaries associated with the top-paying skills for Data Analyst positions; ChatGPT generated this visualization from my SQL query results.*

### 3. Top_Demanded_Skills
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
SELECT 
    skills,
    count(job_postings_fact.job_id) AS demand_count,
    job_location

FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE job_title_short = 'Data Analyst'
GROUP BY skills,job_location
ORDER BY demand_count DESC
LIMIT 5
```
Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in 2023:

* **SQL** is leading with a bold count of 8.
* **Python** follows closely with a bold count of 7.
* **Tableau** is also highly sought after, with a bold count of 6. Other skills like **R**, **Snowflake**, **Pandas**, and **Excel** show varying degrees of demand.

| Skills | Demand Count |
|---|---:|
| SQL | 7291 |
| Excel | 4611 |
| Python | 4330 |
| Tableau | 3745 |
| Power BI | 2609 |

### 4. Skills Based on Salary

Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0 )AS avg_salary,
    count(skills_dim.skill_id) as skill_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY skill_count DESC
LIMIT 25
```

Here's a breakdown of the results for top paying skills for Data Analysts:


- Specialized skills such as **SVN, Solidity, Couchbase, Datarobot, and Golang** are associated with very high average salaries, but appear in relatively few Data Analyst job postings.
- More established skills like **Kafka, PyTorch, Perl, and TensorFlow** also show strong salary potential while appearing more frequently across job postings.
- This highlights an important trade-off: **high salary does not always mean high demand**. Some niche skills can command higher salaries precisely because fewer analysts have them.
- The `skill_count` helps put the salary figures into context, showing which high-paying skills are niche opportunities versus skills with broader market demand.


| Skills | Avg Salary | Skill Count |
|---|---:|---:|
| SQL | 96435 | 3083 |
| Excel | 86419 | 2143 |
| Python | 101512 | 1840 |
| Tableau | 99798 | 1659 |
| R | 98708 | 1073 |
| Power BI | 92324 | 1044 |
| SAS | 93707 | 1000 |
| Word | 82941 | 527 |
| PowerPoint | 88316 | 524 |
| SQL Server | 96191 | 336 |

### 5. Optimal_Skills

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0 )AS avg_salary,
    count(job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL AND
      job_work_from_home = TRUE
GROUP BY skills
HAVING count(job_postings_fact.job_id) > 10
ORDER BY avg_salary DESC,
    demand_count DESC
LIMIT 25
```

| Skills | Avg Salary | Demand Count |
|---|---:|---:|
| Go | 115320 | 27 |
| Confluence | 114210 | 11 |
| Hadoop | 113193 | 22 |
| Snowflake | 112948 | 37 |
| Azure | 111225 | 34 |
| BigQuery | 109654 | 13 |
| AWS | 108317 | 32 |
| Java | 106906 | 17 |
| SSIS | 106683 | 12 |
| Jira | 104918 | 20 |

Here's a breakdown of the most optimal skills for Data Analysts in 2023:

* **High-Demand Programming Languages:** Python and R stand out for their high demand, with demand counts of 236 and 148 respectively. Despite their high demand, their average salaries are around $101,397 for Python and $100,499 for R, indicating that proficiency in these languages is highly valued but also widely available.
* **Cloud Tools and Technologies:** Skills in specialized technologies such as Snowflake, Azure, AWS, and BigQuery show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
* **Business Intelligence and Visualization Tools:** Tableau and Looker, with demand counts of 230 and 49 respectively, and average salaries around $99,288 and $103,795, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
* **Database Technologies:** The demand for skills in traditional and NoSQL databases (Oracle, SQL Server, NoSQL) with average salaries ranging from $97,786 to $104,534, reflects the enduring need for data storage, retrieval, and management expertise.

# What I Learned

Throughout this project, I strengthened my SQL skills and developed a more analytical approach to solving real-world problems:

- **🧩 Smart Query Building:** Learned how to choose the right SQL functions and techniques for each problem, while writing complex queries in a clean and readable way.

- **📊 Data-Driven Analysis:** Improved my ability to analyze job-market data and extract specific insights about salaries, job roles, and in-demand skills.

- **💡 Analytical Thinking:** Learned how to approach problems like a Data Analyst — breaking down questions, identifying what the data can tell me, and turning raw data into meaningful insights.



# Conclusion

This was my first SQL project, and honestly, seeing everything I learned come together and produce real, correct results was a great feeling. 🚀

More importantly, this project changed the way I approach problems. Instead of thinking only about how to write a query, I started thinking about **what question I need to answer, what data I need, and how I can turn that data into a meaningful insight.**

It was a great first step toward thinking more like a Data Analyst — from learning SQL syntax to using it as a tool for **problem-solving, analysis, and decision-making.** 📊
