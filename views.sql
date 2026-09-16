USE company_management;

-- View 1
-- Shows employees, their projects and assigned weekly hours.

CREATE VIEW employee_project_overview AS
SELECT employees.first_name,
       employees.last_name,
       projects.project_name,
       employee_projects.hours_per_week
FROM employees
INNER JOIN employee_projects
    ON employees.employee_id = employee_projects.employee_id
INNER JOIN projects
    ON employee_projects.project_id = projects.project_id;


-- View 2
-- Provides salary statistics for each department.

CREATE VIEW department_salary_summary AS
SELECT departments.department_name,
       COUNT(employees.employee_id) AS employee_count,
       AVG(employees.salary) AS average_salary,
       MAX(employees.salary) AS highest_salary,
       MIN(employees.salary) AS lowest_salary
FROM departments
INNER JOIN employees
    ON departments.department_id = employees.department_id
GROUP BY departments.department_id,
         departments.department_name;