-- Questions
-- 1) What is the gender breakdown of employees in the company?
		SELECT gender , count(*) AS cnt
		FROM human_resources
		WHERE termdate is NULL OR termdate > curdate()
		GROUP BY gender
		ORDER BY cnt DESC;

-- 2) What is the race/ethnicity breakdown of employees in the company?
		SELECT race , count(*) AS cnt
		FROM human_resources
		WHERE termdate is NULL OR termdate > curdate()
		GROUP BY race
		ORDER BY cnt DESC;

-- 3) What is the age distribution of employees in the company?
		SELECT 
        CASE
			WHEN age < 20 THEN '19-'
			WHEN age BETWEEN '20' AND '29' THEN '20-29'
			WHEN age BETWEEN '30' AND '39' THEN '30-39'
			WHEN age BETWEEN '40' AND '49' THEN '40-49'
			WHEN age BETWEEN '50' AND '59' THEN '50-59'
			ELSE '60+'
            END AS distribution_gender, gender
            , count(*) AS cnt
		FROM human_resources
		WHERE termdate is NULL OR termdate > curdate()
		GROUP BY distribution_gender, gender
		ORDER BY distribution_gender;

-- 4) How many employees work at headquarters versus remote locations?
		SELECT location, count(*) AS cnt
		FROM human_resources
		WHERE termdate is NULL OR termdate > curdate()
		GROUP BY location
		ORDER BY cnt DESC;

-- 5) What is the average length of employment for employees who have been terminated?
		SELECT round(AVG(datediff(termdate, hire_date)) / 365) AS avrage
        FROM human_resources
		WHERE termdate is NULL OR termdate <= curdate();
        
-- 6) How does the gender distribution vary across departments and job titles?
		SELECT department, gender, count(*) AS cnt
        FROM human_resources
		WHERE termdate is NULL OR termdate > curdate()
		GROUP BY department, gender
        ORDER BY department;
        
-- 7) What is the distribution of job titles across the company?
		SELECT jobtitle, count(*) AS cnt
        FROM human_resources
		WHERE termdate is NULL OR termdate > curdate()
		GROUP BY jobtitle
        ORDER BY jobtitle;
        
-- 8) Which department has the highest turnover rate?
		SELECT department,
        total_emp,
        terminated_emp,
        terminated_emp / total_emp AS termnation_rate
        FROM (
			SELECT department,
			count(*) AS total_emp,
			sum(CASE
					WHEN termdate is not null and termdate <= curdate()
						THEN 1 ELSE 0 END) AS terminated_emp
			FROM human_resources
			GROUP BY department
        ) AS sq
		ORDER BY termnation_rate DESC;
        
-- 9) What is the distribution of employees across locations by state?
		SELECT location_state, count(*) AS cnt
		FROM human_resources
        WHERE termdate IS NULL OR termdate > curdate()
        GROUP BY location_state
        ORDER BY cnt DESC;

-- 10) How has the company's employee count changed over time based on hire and term dates?
		SELECT year, hires, terminations,
        hires - terminations AS net_change,
        round((hires - terminations)/ hires *100, 2) AS net_change_percent
		FROM (
			SELECT 
            YEAR(hire_date) AS year,
            count(*) AS hires,
            sum(CASE WHEN termdate IS NOT NULL AND termdate <= curdate()
				THEN 1 ELSE 0 END) AS terminations
            FROM human_resources
			GROUP BY YEAR(hire_date)) AS subq
		ORDER BY year ;

-- 11) What is the tenure distribution for each department?
		SELECT department,
        round(AVG(datediff(termdate, hire_date)/365),0) AS avg_tenure
        FROM human_resources
		WHERE termdate is NULL OR termdate <= curdate()
		GROUP BY department;
        
