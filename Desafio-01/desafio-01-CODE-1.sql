-- 1. Número de empregados por departamento e localidade
create view employees_by_department_and_location_view as
SELECT d.Dname AS Departamento, dl.Dlocation AS Localidade, COUNT(e.Ssn) AS Num_Empregados
FROM employee e
INNER JOIN departament d ON e.Dno = d.Dnumber
INNER JOIN dept_locations dl ON d.Dnumber = dl.Dnumber
GROUP BY d.Dname, dl.Dlocation
ORDER BY Num_Empregados DESC;

select * from employees_by_department_and_location_view;

-- 2. Lista de departamentos e seus gerentes
create or replace view employee_departments_managers_view as
SELECT d.Dname AS Departamento, concat(e.Fname, ' ', e.Minit, ' ', e.Lname) AS Gerente, d.mgr_start_date AS Data_Inicio_Gerente
FROM departament d
JOIN employee e ON d.Mgr_ssn = e.Ssn
ORDER BY d.Dname;

select * from employee_departments_managers_view;

create view projects_with_highest_number_employees_view as
-- 3. Projetos com maior número de empregados
SELECT p.Pname AS Projeto, COUNT(w.Essn) AS Num_Empregados
FROM works_on w
JOIN project p ON w.Pno = p.Pnumber
GROUP BY p.Pname
ORDER BY Num_Empregados DESC;

select * from projects_with_highest_number_employees_view;

create or replace view list_of_projects_departments_and_managers_view as
-- 4. Lista de projetos, departamentos e gerentes
SELECT p.Pname AS Projeto, d.Dname AS Departamento, concat(e.Fname, ' ', e.Minit, ' ', e.Lname) AS Gerente
FROM project p
JOIN departament d ON p.Dnum = d.Dnumber
JOIN employee e ON d.Mgr_ssn = e.Ssn
ORDER BY p.Pname;

select * from list_of_projects_departments_and_managers_view;

-- 5. Quais empregados possuem dependentes e se são gerentes
create or replace view dependent_employees_managers_view as
SELECT concat(e.Fname, ' ', e.Minit, ' ', e.Lname) AS Empregado, 
       d.Dname AS Departamento, 
       CASE 
           WHEN e.Ssn = dept.Mgr_ssn THEN 'Sim' 
           ELSE 'Não' 
       END AS Gerente
FROM employee e
JOIN dependent dep ON e.Ssn = dep.Essn
LEFT JOIN departament dept ON e.Ssn = dept.Mgr_ssn
JOIN departament d ON e.Dno = d.Dnumber
GROUP BY e.Ssn, e.Fname, e.Lname, d.Dname, dept.Mgr_ssn
ORDER BY e.Fname, e.Lname;

--  Criação dos Usuários
CREATE USER 'gerente'@localhost IDENTIFIED BY 'sem_senha';
CREATE USER 'employee'@localhost IDENTIFIED BY 'sem_senha';

--  Criação das Views para Controle de Acesso

-- View para Gerentes (Acesso a Empregados e Departamentos)

CREATE OR REPLACE VIEW view_gerente AS
SELECT e.Ssn, e.Fname, e.Lname, e.Salary, e.Dno, d.Dname, d.Mgr_ssn
FROM employee e
JOIN departament d ON e.Dno = d.Dnumber;

select * from view_gerente;

-- View para Employees (Acesso Restrito Apenas aos Próprios Dados)
CREATE OR REPLACE VIEW view_employee AS
SELECT Ssn, Fname, Lname, Salary, Dno
FROM employee;

select * from view_employee;

-- Permissões para o Usuário gerente
GRANT SELECT ON view_gerente TO gerente;

-- Permissões para o Usuário employee
GRANT SELECT ON view_employee TO employee;