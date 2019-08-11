-- Getting started with Burning Glass
-- Code developed by Danielle Lynch
-- March 17, 2019

-- Breakdown by Skills
SELECT Occupations.Occupation_Name, Skills.Skill_Name, Count(Jobs.JobID) as job_count
FROM Occupations
   INNER JOIN Jobs ON Occupations.Occupation_Code = Jobs.Occupation_Code
   INNER JOIN Jobs_Skills ON Jobs_Skills.JobID = Jobs.JobID
   INNER JOIN Skills ON Jobs_Skills.Skill_ID = Skills.Skill_ID
WHERE (Occupations.Occupation_Name Like "%Business / Management Analyst%" OR
    Occupations.Occupation_Name Like "%Business Intelligence Analyst%")
GROUP BY Occupations.Occupation_Name, Skills.Skill_Name
HAVING job_count >= 10
ORDER BY Occupations.Occupation_Name, job_count desc;

-- Breakdown by Exp. Level
-- Outputs the distribution of experience level for BMA
SELECT count(a.Exp_ID), Occupation_Name, Experience_Level from Jobs as a
   INNER JOIN Occupations as b on a.Occupation_Code = b.Occupation_Code
   INNER JOIN Exp_Levels as c on a.Exp_ID = c.Exp_ID
where Occupation_Name = "Business / Management Analyst"
group by a.Exp_ID;

-- Breakdown by Degree/Major
SELECT Occupations.Occupation_Name, Degrees.Degree_Level, Count(Jobs.JobID) AS job_count,
    Round(100*Count(Jobs.JobID)/
        (CASE WHEN Occupations.Occupation_Name = "Business Intelligence Analyst" THEN 1249 ELSE 1798 END),1) AS Proportion
FROM Occupations
   INNER JOIN Jobs ON Occupations.Occupation_Code = Jobs.Occupation_Code
   INNER JOIN Jobs_Degrees ON Jobs_Degrees.JobID = Jobs.JobID
   INNER JOIN Degrees ON Jobs_Degrees.Degree_ID = Degrees.Degree_ID
WHERE (Occupations.Occupation_Name Like "%Business / Management Analyst%" OR
    Occupations.Occupation_Name Like "%Business Intelligence Analyst%")
GROUP BY Occupations.Occupation_Name, Degrees.Degree_Level
HAVING job_count >= 10
ORDER BY Degrees.Degree_Level, Occupations.Occupation_Name;

-- Top 10 Occupations by State (limiting the number of rows for each state)
(
  SELECT Occupation_Code, Posting_Duration, State_ID
  FROM   Jobs 
  WHERE  State_ID = 9
  ORDER BY Posting_Duration DESC
  LIMIT 10
)
UNION
(
  SELECT Occupation_Code, Posting_Duration, State_ID
  FROM   Jobs 
  WHERE  State_ID = 9
  ORDER BY Posting_Duration DESC
  LIMIT 10
);
