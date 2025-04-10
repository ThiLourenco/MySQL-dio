#### Backup do Banco de Dados com mysqldump

###### Passo 1: 
Abrir o CMD como administrador, inserir o caminho do diretório MySQL.

`
 cd C:\Program Files\MySQL\MySQL Server 8.0\bin\
`

###### Passo 2: 

**O mysqldump é a ferramenta usada para criar backups de bases de dados MySQL. O backup pode ser feito de um banco de dados inteiro ou de tabelas específicas.**

*Criar o backup do banco de dados*

Execute o seguinte comando no terminal para realizar o backup do banco de dados inteiro:

`
mysqldump -u root -p mydb > backup_ecommerce.sql
`

*-u root:* Especifica o usuário do MySQL .
*-p:* Solicita a senha para o usuário do MySQL.
*mydb:* O nome do banco de dados de onde será feito o backup.
*> backup_ecommerce.sql:* Especifica o arquivo de saída onde o backup será armazenado.

###### Passo 3: 

*Backup de apenas uma tabela específica*

Execute o seguinte comando no terminal:

`
mysqldump -u root -p mydb Produto > backup_produto.sql
`

###### Passo 4: 

*Backup de várias tabelas*

Caso precise fazer backup de várias tabelas, pode especificá-las após o nome do banco de dados:

`
mysqldump -u root -p mydb Produto Pedido Estoque > backup_produto_pedido_estoque.sql
`
#### Backup de Procedures e Eventos


Para garantir que as procedures, funções e eventos sejam incluídos:

`
mysqldump -u root -p --routines --triggers mydb > backup_ecommerce_procedures_functions.sql
`

*--routines:* Inclui procedures e funções no backup.
*--triggers:* Inclui os gatilhos no backup.

##### Recovery do Banco de Dados com mysql

###### Passo 1: 
*Restaurar o banco de dados inteiro:*

`
mysql -u root -p mydb < backup_ecommerce.sql
`

###### Passo 2: 
*Restaurar apenas uma tabela específica:*

`
mysql -u root -p mydb < backup_produto.sql
`
Este comando irá restaurar a tabela Produto do arquivo backup_produto.sql.

###### Passo 3: 
*Restaurar o banco de dados para um novo banco de dados:*

Para restaurar o backup em um banco de dados diferente, primeiro crie o novo banco de dados e depois execute a restauração:

`
CREATE DATABASE mydb_new;
`

###### Passo 4: 
Execute a restauração do backup:

`
mysql -u root -p mydb_new < ecommerce_backup.sql
`