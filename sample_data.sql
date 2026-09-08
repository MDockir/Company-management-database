USE company_management;

INSERT INTO departments (department_name, location)
VALUES
('Data & Analytics', 'Copenhagen'),
('Software Development', 'Copenhagen'),
('Finance', 'Copenhagen'),
('Sales', 'Aarhus'),
('HR', 'Copenhagen');

INSERT INTO employees
(first_name, last_name, email, salary, hire_date, department_id)
VALUES
('Emma', 'Jensen', 'emma.jensen@company.dk', 48000.00, '2024-02-01', 1),
('Lucas', 'Andersen', 'lucas.andersen@company.dk', 52000.00, '2023-06-15', 2),
('Sofia', 'Nielsen', 'sofia.nielsen@company.dk', 61000.00, '2021-09-01', 3),
('Oliver', 'Larsen', 'oliver.larsen@company.dk', 46000.00, '2024-04-10', 4),
('Clara', 'Madsen', 'clara.madsen@company.dk', 44000.00, '2025-01-20', 5);

INSERT INTO customers
(customer_name, email, phone, city, created_at)
VALUES
('Nordic Retail A/S', 'contact@nordicretail.dk', '+45 33112233', 'Copenhagen', '2023-01-15'),
('Green Energy Solutions', 'info@greenenergy.dk', '+45 70102030', 'Aarhus', '2023-05-10'),
('ScanTech Industries', 'contact@scantech.dk', '+45 44556677', 'Odense', '2022-11-20'),
('Blue Ocean Logistics', 'info@blueocean.dk', '+45 70708090', 'Copenhagen', '2024-06-12'),
('Copenhagen Fitness', 'hello@cphfitness.dk', '+45 33224455', 'Copenhagen', '2024-02-01');

INSERT INTO projects
(project_name, customer_id, start_date, end_date, budget)
VALUES
('Retail Data Platform', 1, '2025-01-15', '2025-10-31', 850000.00),
('Green Energy Analytics', 2, '2025-03-01', '2026-02-28', 1200000.00),
('Fitness Mobile Platform', 5, '2025-05-01', '2025-12-31', 650000.00),
('Finance Automation System', 3, '2025-02-15', '2025-09-30', 975000.00),
('Logistics Data Warehouse', 4, '2025-06-01', NULL, 1500000.00);

INSERT INTO employee_projects
(employee_id, project_id, assigned_date, hours_per_week)
VALUES
(1, 1, '2025-01-15', 30),
(2, 1, '2025-02-01', 20),
(2, 2, '2025-03-01', 15),
(3, 4, '2025-02-15', 25),
(4, 3, '2025-05-01', 30),
(5, 5, '2025-06-01', 25),
(1, 2, '2025-04-01', 10),
(3, 5, '2025-06-15', 10);