CREATE DATABASE Company;

use Company;
select * from company_name;
select * from salaries; 
			/**here we have imported two dataset.Let's at first look into the salaries dataset**/
 
 select * from salaries;
select count(*) from salaries;  -- there are total 3755 record in the dataset

select count(distinct job_title) as types_of_jobs from salaries; -- there 93 types of jobs in the dataset

 -- select 


SELECT 
    ROUND(AVG(salary)) AS average_salary
FROM
    salaries;  -- the average salary is 190696 

SELECT 
    job_title, MAX(salary) AS highest_salary
FROM
    salaries
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5; -- the highest salary is earned by Data Scientist and the salary is 30400000


select round(avg(salary)) as avg_salary from salaries where company_location='US' and job_title='Data Scientist';  -- the average salary of a data scientist in US is 162548


select  job_title, count(*) as  number_of_employee from salaries group by job_title order by 2 desc; -- Here most of the employee are for the Data Engineer post (1040) and the top five are Data Scientist(840), Data Analyst(612),Machine Learning Engineer(289) and Analytics Engineer(103)
 
 select sum(salary) as salary_paid from salaries where company_location='DE' and job_title='Data Analyst'; -- In Denmark total salary paid for the data analyst is 54000

select job_title, round(avg(salary)) as average_salary_paid from salaries group by 1 order by 2 desc limit 5; -- the top 5 paying jobs are Head of Machine Learning(6000000),Principal Data Analyst(3000000), Lead Machine Learning Engineer(2548667), Lead Data Scientist(928485) and Data Analyst Lead(922500)

select company_location, count(*) as number_of_employee from salaries group by 1 order by 2 desc; -- Most of the jobs are in the location US(3040) and then in GB(172)

select round(avg(salary)) from salaries where job_title='Data Engineer' 
  and company_location='US'; -- in US the average salary for data engineer is 152794
  
  select company_location, employee_residence, round(avg(salary)) as avg_sal from salaries group by 1 ,2 order by 3 desc limit 3;  -- the top 3 paying company residence is CL, US & HU and for the employee residence the top 3 places are CL,HU & HU 
  
  
select job_title, round(avg(salary)) as  avg_sal, count(*) as number_of_jobs  from salaries group by 1 order by 2 desc; -- the average salary is highest for Head of Machine Learning(6000000) as it has only one post and the lowest is for the post Product Data Scientist(8000)

select job_title, sum(salary)  as total_paid from salaries group by 1 order by 2 desc limit 5;  -- the company has to pay most for the Data Scientist positions 


select job_title, count(job_title) as number_of_jobs , round((count(*)/(select count(*) from salaries))*100,2) as percentage from salaries group by 1 order by 2 desc; -- almost 28% jobs are Data Engineer and 22% are Data Scientist

select company_location, count(job_title) as number_of_employee, round((count(*)/(select count(*) from salaries))*100,2) as percentage from salaries group by 1 order by 2 desc limit 5; -- almost 81% jobs are US  based

select work_year ,count(job_title) as number_of_jobs from salaries
group by 1 order by 2 desc; -- the highest number of jobs is available in the year 2023 and it was 1785 while it was least at the year 2020
 
 
 select work_year, round(avg(salary))  as avg_sal from salaries group by 1 order by 2 desc;  -- the average salary was highest in the year 2021 and it is least in the year 2023
 
 select experience_level, count(job_title) as number_of_jobs, 
 round(avg(salary))  as avg_sal from salaries group by 1 order by 3 desc; -- the average salary is highest for mid and intermediate level workers and it is lowest for senior  level workers
 
 select employment_type,  round(avg(salary))  as avg_sal from salaries group by 1 
 order by 2 desc; -- the average salary is highest for FL type employee and lowest for PT type employee
 
 select job_title,  company_name , max(salary) as max_salary
 from company inner join salaries on salaries.id=company.id
 group by job_title , company_name
 order by max_salary desc limit 5;-- yz company offers the highest salary for the Data Scientist role
 
 
 select  company_location,company_name , round(avg(salary))  as avg_sal
 from salaries inner join company on salaries.id=company.id
 group by 1,2
 order by 3 desc limit 5; 
 
 select company_name, count(job_title) as number_of_employee
 from company inner join salaries on company.id=salaries.id
 group by 1 order by 2 desc; -- ghi and yz company has the highest number of employee
 
 
 select job_title, company_name , round(avg(salary))  as avg_sal,
 rank() over( partition by company_name order by avg(salary) desc ) as salary_rank
 from salaries inner join company on salaries.id=company.id
 group by 1,2;
 
 
select company_size, round(avg(salary)) as avg_salary,
count(job_title) as number_of_employee
from salaries group by company_size order by 3 desc; -- the average salary is highest in company which is large and the average salary is lowest in the medium  size comapany
   -- Medium size company has the  highest number of employees
   

select company_name, round(avg(salary)) as avg_salary,
rank() over(order by avg(salary) desc) as salary_rank
from salaries inner join company on salaries.id=company.id
group by 1 order by 2 desc; -- average salary is highest for yz company and it is lowest for abc company


select company_name, work_year, count(job_title) as yearly_employee,
rank() over(partition by  work_year order by count(job_title) desc) as ranking
from company inner join salaries on company.id=salaries.id
group by 1,2 order by 3 desc;  -- in 2023 pqr company has the highest number of people,in 2022 it was yz and in 2021 it was mno




 
 
 
 
 
 





       
