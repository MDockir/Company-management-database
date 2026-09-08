# Company Management Database

A MySQL database project designed to simulate a company management system.

The project manages employees, departments, customers, projects, and employee project assignments. It also contains SQL queries for analysing company data.

## Technologies

- MySQL
- SQL
- MySQL Workbench
- Git
- GitHub

## Database Structure

The database currently contains five tables:

- `departments`
- `employees`
- `customers`
- `projects`
- `employee_projects`

The `employee_projects` table creates a many-to-many relationship between employees and projects.

## Features

The project currently demonstrates:

- Primary and foreign keys
- One-to-many relationships
- Many-to-many relationships
- INNER JOIN
- Aggregate functions
- GROUP BY
- ORDER BY
- Sample company data

More analytical queries and database features will be added as the project develops.

## Project Structure

```text
company-management-database/
├── README.md
├── database_schema.sql
├── sample_data.sql
└── queries.sql