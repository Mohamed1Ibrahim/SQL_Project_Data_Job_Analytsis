/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment op...
*/

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

/*

### Results


## 1. Top-Paying Data Analyst Jobs

This query identifies the top 10 highest-paying Data Analyst job postings that:
- Are fully remote (job_location = 'Anywhere')
- Have a listed annual salary
- Are ordered from highest to lowest salary



1. Data Analyst — Mantys
   Annual Salary: $650,000
   Location: Anywhere
   Schedule: Full-time

2. Director of Analytics — Meta
   Annual Salary: $336,500
   Location: Anywhere
   Schedule: Full-time

3. Associate Director – Data Insights — AT&T
   Annual Salary: $255,829.50
   Location: Anywhere
   Schedule: Full-time

4. Data Analyst, Marketing — Pinterest Job Advertisements
   Annual Salary: $232,423
   Location: Anywhere
   Schedule: Full-time

5. Data Analyst (Hybrid/Remote) — Uclahealthcareers
   Annual Salary: $217,000
   Location: Anywhere
   Schedule: Full-time

6. Principal Data Analyst — SmartAsset
   Annual Salary: $205,000
   Location: Anywhere
   Schedule: Full-time

7. Director, Data Analyst — Inclusively
   Annual Salary: $189,309
   Location: Anywhere
   Schedule: Full-time

8. Principal Data Analyst, AV Performance Analysis — Motional
   Annual Salary: $189,000
   Location: Anywhere
   Schedule: Full-time

9. Principal Data Analyst — SmartAsset
   Annual Salary: $186,000
   Location: Anywhere
   Schedule: Full-time

10. ERM Data Analyst — Get It Recruit - Information Technology
    Annual Salary: $184,000
    Location: Anywhere
    Schedule: Full-time

### Insights

- The highest-paying posting is a Data Analyst position at Mantys with an annual salary of $650,000. This is a significant outlier compared with the other postings and should be treated cautiously when interpreting the data.

- Senior and leadership positions appear frequently among the highest-paying roles, including Director of Analytics, Associate Director, and Principal Data Analyst positions.

- Remote Data Analyst roles can offer very high salaries, with all 10 positions in this analysis offering more than $184,000 annually.

- The results suggest that advancing toward senior, principal, or leadership-level analytics roles can significantly increase earning potential.
*/