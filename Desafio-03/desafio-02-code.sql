-- Procedure Update salary departament

-- debug excluir a procedure
drop procedure update_salary_department;

-- Criar a procedure
DELIMITER //
CREATE PROCEDURE update_salary_department(IN dept_id INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        ROLLBACK; -- Em caso de erro, a transação será revertida

    -- Iniciar a transação
    START TRANSACTION;
    
    -- Consultar e atualizar os salários
    UPDATE company_constraint.employee
    SET Salary = Salary * 1.10
    WHERE Dno = dept_id;
    
    -- Verificar se a atualização foi realizada
    SELECT * FROM company_constraint.employee WHERE Dno = dept_id;
    
    -- Confirmar a transação se tudo estiver certo
    COMMIT;
END//

-- Executar a procedure para atualizar salários no departamento de TI 
call update_salary_department(2);
