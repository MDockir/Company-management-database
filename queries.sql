USE company_management;

-- Query 1
-- Shows which employees are assigned to which projects
-- and how many hours per week they are assigned.

SELECT employees.first_name,
       employees.last_name,
       projects.project_name,
       employee_projects.hours_per_week
FROM employees
INNER JOIN employee_projects
    ON employees.employee_id = employee_projects.employee_id
INNER JOIN projects
    ON employee_projects.project_id = projects.project_id;


-- Query 2
-- Calculates the total assigned hours per week for each employee.

SELECT employees.first_name,
       employees.last_name,
       SUM(employee_projects.hours_per_week) AS total_hours
FROM employees
INNER JOIN employee_projects
    ON employees.employee_id = employee_projects.employee_id
GROUP BY employees.employee_id,
         employees.first_name,
         employees.last_name
ORDER BY total_hours DESC;


-- Query 3
-- Shows customers and their projects ordered by budget from highest to lowest.

SELECT customers.customer_name,
       projects.project_name,
       projects.budget
FROM customers
INNER JOIN projects
    ON customers.customer_id = projects.customer_id
ORDER BY projects.budget DESC;


-- Query 4
-- Shows how many employees are assigned to each project.

SELECT projects.project_name,
       COUNT(employee_projects.employee_id) AS employee_count
FROM projects
INNER JOIN employee_projects
    ON projects.project_id = employee_projects.project_id
GROUP BY projects.project_id,
         projects.project_name
ORDER BY employee_count DESC;


-- Query 5
-- Calculates the total assigned hours per week for each project.

SELECT projects.project_name,
       SUM(employee_projects.hours_per_week) AS total_hours
FROM projects
INNER JOIN employee_projects
    ON projects.project_id = employee_projects.project_id
GROUP BY projects.project_id,
         projects.project_name
ORDER BY total_hours DESC;


-- Query 6
-- Calculates the average salary for each department.

SELECT departments.department_name,
       AVG(employees.salary) AS average_salary
FROM departments
INNER JOIN employees
    ON departments.department_id = employees.department_id
GROUP BY departments.department_id,
         departments.department_name
ORDER BY average_salary DESC;


-- Query 7
-- Shows employees earning more than the company average salary.

SELECT employees.first_name,
       employees.last_name,
       employees.salary
FROM employees
WHERE employees.salary > (
    SELECT AVG(employees.salary)
    FROM employees
);


-- Query 8
-- Shows customers that have more than one project.

SELECT customers.customer_name,
       COUNT(projects.project_id) AS project_count
FROM customers
INNER JOIN projects
    ON customers.customer_id = projects.customer_id
GROUP BY customers.customer_id,
         customers.customer_name
HAVING COUNT(projects.project_id) > 1;


-- Query 9
-- Shows employees assigned to more than one project.

SELECT employees.first_name,
       employees.last_name,
       COUNT(employee_projects.project_id) AS project_count
FROM employees
INNER JOIN employee_projects
    ON employees.employee_id = employee_projects.employee_id
GROUP BY employees.employee_id,
         employees.first_name,
         employees.last_name
HAVING COUNT(employee_projects.project_id) > 1;


-- Query 10
-- Finds the project or projects with the highest budget.

SELECT projects.project_name,
       projects.budget
FROM projects
WHERE projects.budget = (
    SELECT MAX(projects.budget)
    FROM projects
);


-- Query 11
-- Uses a CTE to find employees earning above the company average.

WITH company_average AS (
    SELECT AVG(employees.salary) AS average_salary
    FROM employees
)
SELECT employees.first_name,
       employees.last_name,
       employees.salary
FROM employees
CROSS JOIN company_average
WHERE employees.salary > company_average.average_salary;


-- Query 12
-- Ranks employees by salary using ROW_NUMBER.

SELECT employees.first_name,
       employees.last_name,
       employees.salary,
       ROW_NUMBER() OVER (
           ORDER BY employees.salary DESC
       ) AS salary_rank
FROM employees;


-- Query 13
-- Ranks employees by salary using RANK.

SELECT employees.first_name,
       employees.last_name,
       employees.salary,
       RANK() OVER (
           ORDER BY employees.salary DESC
       ) AS salary_rank
FROM employees;


-- Query 14
-- Ranks employees by salary using DENSE_RANK.

SELECT employees.first_name,
       employees.last_name,
       employees.salary,
       DENSE_RANK() OVER (
           ORDER BY employees.salary DESC
       ) AS salary_rank
FROM employees;


-- Query 15
-- Uses EXPLAIN to analyse a salary search query.

EXPLAIN
SELECT *
FROM employees
WHERE salary > 50000;