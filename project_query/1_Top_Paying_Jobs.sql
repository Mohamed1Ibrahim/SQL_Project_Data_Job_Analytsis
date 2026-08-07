
WITH Q1 AS (
SELECT * 
FROM january_jobs

UNION ALL

SELECT *
FROM february_jobs

UNION ALL 

SELECT * 
FROM march_jobs 
)
SELECT 
    Q1.job_id,
    Q1.job_title_short,
    skills.skills,
    skills.type

FROM Q1
LEFT JOIN skills_job_dim as skills_job
ON skills_job.job_id = Q1.job_id
LEFT JOIN skills_dim as skills
ON skills.skill_id = skills_job.skill_id

WHERE salary_year_avg > 70000

