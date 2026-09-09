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