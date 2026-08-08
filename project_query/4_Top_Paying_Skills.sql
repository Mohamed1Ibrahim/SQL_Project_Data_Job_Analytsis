/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve
*/

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



/*

### Insights

- SVN has the highest average salary among the analyzed skills at $400,000, followed by Solidity at $179,000 and Couchbase at $160,515.

- Several specialized skills, including Databot, Golang, MXNet, Dplyr, VMware, and Terraform, are associated with average salaries above $140,000.

- The results show that highly specialized technical skills can be associated with significantly higher salaries compared with common Data Analyst skills such as SQL, Excel, and Python.

- Among the more commonly demanded skills, Python stands out with an average salary of $101,512, while SQL has the highest demand with 3,083 job postings and an average salary of $96,435.

- This suggests that there is a difference between the skills associated with the highest salaries and the skills most frequently requested by employers. Specialized skills may offer higher earning potential, while core skills such as SQL and Python provide broader job opportunities.

### Important Note

- The average salary for some of the highest-paying skills is based on a very small number of job postings. For example, SVN, Solidity, Couchbase, Databot, and VMware each appear in only 1 posting in this result.

- Therefore, these extremely high average salaries should be interpreted with caution and do not necessarily represent the typical salary for professionals with these skills.

- Skills with both a high average salary and a larger number of job postings provide a more reliable indication of market value than skills appearing in only a few postings.

[
  {
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skills": "notion",
    "avg_salary": "118092"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387"
  },
  {
    "skills": "scala",
    "avg_salary": "115480"
  }
] */