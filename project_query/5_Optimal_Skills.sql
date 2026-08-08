/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
*/

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



/*


### Insights

- Hadoop has the highest average salary among the analyzed skills at $113,193, followed closely by Snowflake at $112,948 and Azure at $111,225.

- Other high-paying skills include BigQuery ($109,654), AWS ($108,317), Java ($106,906), and SSIS ($106,683), showing that cloud, data-platform, and technical skills are associated with strong earning potential.

- Python stands out as one of the most optimal skills because it combines a high average salary of $101,397 with strong demand, appearing in 236 job postings.

- Tableau is another strong skill, with 230 job postings and an average salary of $99,288, making it one of the most widely demanded skills while still maintaining a competitive salary.

- R, SAS, and Power BI also provide a strong balance between demand and salary, with 148, 126, and 110 job postings respectively.

- The results suggest that the most optimal skills are not necessarily the ones with the highest salaries. Skills such as Python, Tableau, R, SAS, and Power BI provide a stronger combination of demand and earning potential.

- Cloud and data-platform skills such as Snowflake, Azure, AWS, and BigQuery appear to be particularly valuable, offering high average salaries while maintaining a meaningful level of demand.

### Key Takeaway

- For someone looking to maximize both job opportunities and earning potential, Python, Tableau, R, SAS, and Power BI stand out as practical choices because they combine relatively high demand with competitive average salaries.

### Important Note

- The query filters out skills appearing in 10 or fewer job postings, which helps reduce the impact of unusually high salaries based on very small samples.

- However, demand levels still vary significantly between skills. For example, Python and Tableau appear in more than 200 postings, while some high-paying skills such as BigQuery and SSIS appear in fewer than 20 postings.

- Therefore, a skill with a slightly lower average salary but much higher demand may represent a more practical career investment than a skill with a higher salary but limited job opportunities.



=======RESULTS======

[
  {
    "skills": "go",
    "avg_salary": "115320",
    "demand_count": "27"
  },
  {
    "skills": "confluence",
    "avg_salary": "114210",
    "demand_count": "11"
  },
  {
    "skills": "hadoop",
    "avg_salary": "113193",
    "demand_count": "22"
  },
  {
    "skills": "snowflake",
    "avg_salary": "112948",
    "demand_count": "37"
  },
  {
    "skills": "azure",
    "avg_salary": "111225",
    "demand_count": "34"
  },
  {
    "skills": "bigquery",
    "avg_salary": "109654",
    "demand_count": "13"
  },
  {
    "skills": "aws",
    "avg_salary": "108317",
    "demand_count": "32"
  },
  {
    "skills": "java",
    "avg_salary": "106906",
    "demand_count": "17"
  },
  {
    "skills": "ssis",
    "avg_salary": "106683",
    "demand_count": "12"
  },
  {
    "skills": "jira",
    "avg_salary": "104918",
    "demand_count": "20"
  },
  {
    "skills": "oracle",
    "avg_salary": "104534",
    "demand_count": "37"
  },
  {
    "skills": "looker",
    "avg_salary": "103795",
    "demand_count": "49"
  },
  {
    "skills": "nosql",
    "avg_salary": "101414",
    "demand_count": "13"
  },
  {
    "skills": "python",
    "avg_salary": "101397",
    "demand_count": "236"
  },
  {
    "skills": "r",
    "avg_salary": "100499",
    "demand_count": "148"
  },
  {
    "skills": "redshift",
    "avg_salary": "99936",
    "demand_count": "16"
  },
  {
    "skills": "qlik",
    "avg_salary": "99631",
    "demand_count": "13"
  },
  {
    "skills": "tableau",
    "avg_salary": "99288",
    "demand_count": "230"
  },
  {
    "skills": "ssrs",
    "avg_salary": "99171",
    "demand_count": "14"
  },
  {
    "skills": "spark",
    "avg_salary": "99077",
    "demand_count": "13"
  },
  {
    "skills": "c++",
    "avg_salary": "98958",
    "demand_count": "11"
  },
  {
    "skills": "sas",
    "avg_salary": "98902",
    "demand_count": "126"
  },
  {
    "skills": "sql server",
    "avg_salary": "97786",
    "demand_count": "35"
  },
  {
    "skills": "javascript",
    "avg_salary": "97587",
    "demand_count": "20"
  },
  {
    "skills": "power bi",
    "avg_salary": "97431",
    "demand_count": "110"
  }
]*/