--Create Retirement Titles Table
SELECT em.emp_no, 
        em.first_name, 
        em.last_name,
	    ti.title, 
        ti.from_date, 
        ti.to_date
	INTO retirement_titles
	FROM employees AS em
	LEFT JOIN titles as ti
	ON (em.emp_no = ti.emp_no)
	WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	ORDER BY em.emp_no
	;
	
	
SELECT * FROM retirement_titles;
	
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retiring_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- retrieve the number of retiring employees by their most recent job title -- 

SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

Select * FROM retiring_titles;




-- Find Employees Eligible for the Mentorship Program --
SELECT DISTINCT ON (em.emp_no) em.emp_no, 
	em.first_name, em.last_name, em.birth_date, 
	de.from_date, de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as em
LEFT JOIN dept_emp as de
ON em.emp_no = de.emp_no
LEFT JOIN titles AS ti
ON em.emp_no = ti.emp_no
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY em.emp_no;
