-- Selecionando o banco de dados
use company_constraint;

-- Desabilitar o autocommit
SET autocommit = 0;

-- Iniciar a transação
START TRANSACTION;

-- Consultar empregados do departamento de TI
SELECT * FROM company_constraint.employee WHERE Dno = 2;

-- Atualizar salários dos empregados do departamento de TI
UPDATE company_constraint.employee 
SET Salary = Salary * 1.10 
WHERE Dno = 2;

-- Verificar se os salários foram atualizados
SELECT * FROM company_constraint.employee WHERE Dno = 2;

-- Caso ocorra um erro:
ROLLBACK;

-- Se tudo estiver correto, confirmar a transação
COMMIT;
