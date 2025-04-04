-- E-Commerce

DELIMITER $$

CREATE PROCEDURE ManipularProduto(
    IN p_operacao INT,  -- Define a operação: 1-SELECT, 2-INSERT, 3-UPDATE, 4-DELETE
    IN p_idProduto INT,
    IN p_Nome VARCHAR(255),
    IN p_Categoria VARCHAR(255),
    IN p_Valor DECIMAL(10,2)
)
BEGIN
    CASE p_operacao
        WHEN 1 THEN
            -- Selecionar produtos
            SELECT * FROM Produto;
        
        WHEN 2 THEN
            -- Inserir um novo produto
            INSERT INTO Produto (idProduto, Nome, Categoria, Valor)
            VALUES (p_idProduto, p_Nome, p_Categoria, p_Valor);
        
        WHEN 3 THEN
            -- Atualizar um produto existente
            UPDATE Produto
            SET Nome = p_Nome, Categoria = p_Categoria, Valor = p_Valor
            WHERE idProduto = p_idProduto;
        
        WHEN 4 THEN
            -- Remover um produto
            DELETE FROM Produto WHERE idProduto = p_idProduto;
        
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Operação inválida!';
    END CASE;
END $$

DELIMITER ;

-- Chamadas da procedure

-- Listar todos os produtos
CALL ManipularProduto(1, NULL, NULL, NULL, NULL);
-- Inserir um novo produto
CALL ManipularProduto(2, 11, 'Produto K', 'Categoria 4', 55.00);
-- Atualizar um produto existente
CALL ManipularProduto(3, 1, 'Produto A Modificado', 'Categoria 1', 60.00);
-- Deletar um produto
CALL ManipularProduto(4, 10, NULL, NULL, NULL);


-- Universidade

DELIMITER $$

CREATE PROCEDURE p_gerenciar_universidade(
    IN p_acao INT,         -- Define a operação a ser realizada (1=SELECT, 2=INSERT, 3=UPDATE, 4=DELETE)
    IN p_id INT,           -- ID do aluno/professor/curso
    IN p_nome VARCHAR(100), -- Nome
    IN p_tipo VARCHAR(50),  -- Define se é aluno, professor ou curso
    IN p_extra VARCHAR(100) -- Informações extras (como departamento, período, etc.)
)
BEGIN
    CASE p_acao
        WHEN 1 THEN -- SELECT
            IF p_tipo = 'aluno' THEN
                SELECT * FROM alunos WHERE id = p_id;
            ELSEIF p_tipo = 'professor' THEN
                SELECT * FROM professores WHERE id = p_id;
            ELSEIF p_tipo = 'curso' THEN
                SELECT * FROM cursos WHERE id = p_id;
            END IF;
        
        WHEN 2 THEN -- INSERT
            IF p_tipo = 'aluno' THEN
                INSERT INTO alunos (nome, curso) VALUES (p_nome, p_extra);
            ELSEIF p_tipo = 'professor' THEN
                INSERT INTO professores (nome, departamento) VALUES (p_nome, p_extra);
            ELSEIF p_tipo = 'curso' THEN
                INSERT INTO cursos (nome, periodo) VALUES (p_nome, p_extra);
            END IF;

        WHEN 3 THEN -- UPDATE
            IF p_tipo = 'aluno' THEN
                UPDATE alunos SET nome = p_nome, curso = p_extra WHERE id = p_id;
            ELSEIF p_tipo = 'professor' THEN
                UPDATE professores SET nome = p_nome, departamento = p_extra WHERE id = p_id;
            ELSEIF p_tipo = 'curso' THEN
                UPDATE cursos SET nome = p_nome, periodo = p_extra WHERE id = p_id;
            END IF;

        WHEN 4 THEN -- DELETE
            IF p_tipo = 'aluno' THEN
                DELETE FROM alunos WHERE id = p_id;
            ELSEIF p_tipo = 'professor' THEN
                DELETE FROM professores WHERE id = p_id;
            ELSEIF p_tipo = 'curso' THEN
                DELETE FROM cursos WHERE id = p_id;
            END IF;
    END CASE;
END$$

DELIMITER ;

-- Chamadas da procedure

-- Inserir aluno
CALL p_gerenciar_universidade(2, NULL, 'João Silva', 'aluno', 'Engenharia');  
-- Atualizar aluno
CALL p_gerenciar_universidade(3, 1, 'João Pedro Silva', 'aluno', 'Administração');  
-- Buscar aluno com ID 1
CALL p_gerenciar_universidade(1, 1, NULL, 'aluno', NULL);  
-- Deletar aluno com ID 1
CALL p_gerenciar_universidade(4, 1, NULL, 'aluno', NULL);  
