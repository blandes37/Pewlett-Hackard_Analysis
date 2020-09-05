DROP TABLE retirement_titles
DROP TABLE unique_titles

SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_titles 
FROM employees as e
LEFT JOIN titles as tt
ON e.emp_no = tt.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

  
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

SELECT title,
	COUNT (title)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC

--Deliverable 2
SELECT DISTINCT ON(tt.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_table
FROM employees as e
	INNER JOIN dept_emp as de
		ON e.emp_no = de.emp_no
	INNER JOIN titles as tt
		ON e.emp_no = tt.emp_no

WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31');

	