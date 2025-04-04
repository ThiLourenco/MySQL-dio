--CRIAÇÃO DA TABELA DE HISTÓRICO 
CREATE TABLE IF NOT EXISTS Historico_Usuarios (
    idHistorico INT AUTO_INCREMENT PRIMARY KEY,
    idPessoa INT NOT NULL,
    Nome VARCHAR(45),
    cpf_cnpj VARCHAR(45),
    email VARCHAR(45),
    data_remocao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TRIGGER REMOÇÃO
-- Deverá registrar quando um usuário excluir sua conta, suas informações são registradas em uma tabela de histórico antes da remoção.
DELIMITER //
CREATE TRIGGER before_delete_pessoa
BEFORE DELETE ON Pessoa
FOR EACH ROW
BEGIN
    INSERT INTO Historico_Usuarios (idPessoa, Nome, cpf_cnpj, email)
    VALUES (OLD.idPessoa, OLD.Nome, OLD.cpf_cnpj, OLD.email);
END;
//
DELIMITER ;


-- Tabela de Histórico
CREATE TABLE IF NOT EXISTS Historico_Salarios (
    idHistorico INT AUTO_INCREMENT PRIMARY KEY,
    idPessoa INT NOT NULL,
    Nome VARCHAR(45),
    Salario_Antigo DECIMAL(10,2),
    Salario_Novo DECIMAL(10,2),
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de registro de funcionário
CREATE TABLE funcionario (
    idPessoa INT PRIMARY KEY,
    Nome VARCHAR(100),
    Salario DECIMAL(10,2)
);

-- Trigger para Atualização

-- Deve Atualizar o salário de um colaborador e manter um histórico das mudanças
-- Criar a Trigger
DELIMITER //
CREATE TRIGGER before_update_salario
BEFORE UPDATE ON funcionario
FOR EACH ROW
BEGIN
    IF OLD.Salario <> NEW.Salario THEN
        INSERT INTO Historico_Salarios (idPessoa, Nome, Salario_Antigo, Salario_Novo)
        VALUES (OLD.idPessoa, OLD.Nome, OLD.Salario, NEW.Salario);
    END IF;
END;
//
DELIMITER ;

DESC funcionario;

