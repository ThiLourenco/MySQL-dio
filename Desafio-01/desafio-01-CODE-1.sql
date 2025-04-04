use company_constraint;

-- Parte 1

-- Criando índices para otimizar as consultas:
-- O índice do tipo HASH é ideal para buscas exatas (=) por isso foi utilizado nesse exemplo.

-- Índice para facilitar a contagem de funcionários por departamento
CREATE INDEX idx_employee_dno_hash ON company_constraint.employee (Dno) USING HASH;
-- Índice para melhorar a busca de departamentos por cidade
CREATE INDEX idx_dept_locations_dnumber_hash ON dept_locations (Dnumber) USING HASH;
-- Índice para acelerar a relação de empregados por departamento
CREATE INDEX idx_employee_ssn_hash ON company_constraint.employee (Ssn) USING HASH;


-- Pergunta 1: Qual o departamento com maior número de pessoas?
SELECT Dno, COUNT(*) AS total_funcionarios 
FROM company_constraint.employee 
GROUP BY Dno 
ORDER BY total_funcionarios DESC 
LIMIT 1;

-- Pergunta 2: Quais são os departamentos por cidade?
SELECT d.Dname, dl.Dlocation 
FROM departament d
JOIN dept_locations dl ON d.Dnumber = dl.Dnumber;

-- Pergunta 3: Relação de empregados por departamento
SELECT d.Dname, e.Fname, e.Lname, e.Salary 
FROM company_constraint.employee e
JOIN departament d ON e.Dno = d.Dnumber
ORDER BY d.Dname, e.Salary DESC;
