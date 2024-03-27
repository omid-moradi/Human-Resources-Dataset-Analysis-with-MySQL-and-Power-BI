# Human-Resources-Dataset-Analysis-with-MySQL-and-Power-BI
![dashboard](https://github.com/theomid80/Human-Resources-Dataset-Analysis-with-MySQL-and-Power-BI/assets/164475131/afecce90-3133-44e6-b28f-9c6a0d85f5ec)
# Data
Human Resources Data with over 22000 rows from the year 2000 to 2020.
## Dataset Column Descriptions

The Human Resources dataset is structured into 13 columns, each capturing essential employee information:


- **id**: A unique identifier for each employee within the dataset.
- **first_name**: The given name of the employee.
- **last_name**: The family or surname of the employee.
- **birthdate**: The date of birth of the employee, providing age demographics.
- **gender**: The gender identity of the employee.
- **race**: The race or ethnicity of the employee.
- **department**: The department within the organization where the employee works.
- **jobtitle**: The official title or position held by the employee.
- **location**: The primary work location or office where the employee is based.
- **hire_date**: The date the employee started working at the organization.
- **termdate**: If applicable, the date the employee's term ended with the organization.
- **location_city**: The city of the employee's work location.
- **location_state**: The state of the employee's work location.

This structure allows for a multifaceted analysis of the workforce, including demographic studies, departmental breakdowns, and location-based insights.


# steps

1. Data Cleaning: Ensuring the dataset's integrity by removing inconsistencies.
2. Query Execution: Utilizing MySQL Workbench to run complex queries for deeper insights.
3. Visualization: Creating intuitive dashboards in PowerBI to represent the data visually.

By following these steps, we can extract meaningful patterns and make data-driven decisions to improve HR strategies.

# Questions
1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age distribution of employees in the company?
4. How many employees work at headquarters versus remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. What is the distribution of job titles across the company?
8. Which department has the highest turnover rate?
9. What is the distribution of employees across locations by state?
10. How has the company's employee count changed over time based on hire and term dates?
11. What is the tenure distribution for each department?
# Summary of Findings
- There are more male employees
- White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
- The youngest employee is 20 years old and the oldest is 57 years old
- 4 age groups were created (20-29, 30-39, 40-49, 50-59). A large number of employees were between 20-29 while the smallest group was 50-59.
- A large number of employees work at the headquarters versus remotely.
- The average length of employment for terminated employees is around 8 years.
- The gender distribution across departments is fairly balanced but there are generally more male than female employees.
- The Marketing department has the highest turnover rate followed by Training. The least turn over rate are in the Research and development, Support and Legal departments.
- A large number of employees come from the state of Ohio.
- The net change in employees has increased over the years.
- The average tenure for each department is about 8 years with Legal and Auditing having the highest and Services, Sales and Marketing having the lowest.
# Limitations
- Some records had negative ages and these were excluded during querying(967 records). Ages used were 18 years and above.
- Some termdates were far into the future and were not included in the analysis(1441 records). The only term dates used were those less than or equal to the current date.
