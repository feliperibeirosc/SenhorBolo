CREATE DATABASE SrBolo
DROP DATABASE SrBolo
USE SrBolo

CREATE TABLE tblFuncionarios(
	idFuncionario INT PRIMARY KEY,
	nomeFunc VARCHAR(50) NOT NULL,
	senhaFunc VARCHAR(50),
	RG VARCHAR(12),
	salario FLOAT,
	email VARCHAR(50),
	telefone VARCHAR(14),
	CEP VARCHAR (9)
)

CREATE TABLE tblVenda(
	idVenda INT PRIMARY KEY IDENTITY(1,1),
	dataVenda DATE,
	idFuncionario INT FOREIGN KEY
	REFERENCES tblFuncionarios (idFuncionario)
)

CREATE TABLE tblProduto(
	idProduto INT PRIMARY KEY,
	descProduto VARCHAR (30),
	precoProduto FLOAT,
	maisValia FLOAT
)

CREATE TABLE tblDetalheVenda(
	idVenda INT FOREIGN KEY REFERENCES tblVenda (idVenda),
	idProduto INT FOREIGN KEY REFERENCES tblProduto (idProduto),
	quantidade INT,
	valorTotal FLOAT
)

CREATE TABLE tblAdministrador (
	idAdministrador INT PRIMARY KEY,
	nomeADM VARCHAR(50),
	senhaADM VARCHAR(50)
)

CREATE TABLE tblFornecedor(
	CNPJ VARCHAR(18) PRIMARY KEY,
	descFor VARCHAR(30),
	contatoFor CHAR(30),
	enderecoFor VARCHAR(50),
	cidade VARCHAR(25)
)


insert into tblProduto values
(1, 'Abacaxi', 20.00, 8.00),
(2, 'Ameixa', 20.00, 8.00),
(3, 'Banana com Canela', 20.00, 8.00),
(4, 'Banana com Passas', 20.00, 8.00),
(5, 'Cenoura', 20.00, 8.00),
(6, 'Cenoura Mesclado', 20.00, 8.00),
(7, 'Chocolate', 20.00, 8.00),
(8, 'Coco', 20.00, 8.00),
(9, 'Formigueiro', 20.00, 8.00),
(10, 'Fubá', 20.00, 8.00),
(11, 'Fubá com Erva Doce', 20.00, 8.00),
(12, 'Fubá com Goiabada', 20.00, 8.00),
(13, 'Laranja', 20.00, 8.00),
(14, 'Limão', 20.00, 8.00),
(15, 'Maçã com Canela', 20.00, 8.00),
(16, 'Mandioca com Coco', 20.00, 8.00),
(17, 'Mesclado', 20.00, 8.00),
(18, 'Milho', 20.00, 8.00),
(19, 'Paçoca', 20.00, 8.00),
(20, 'Brigadeiro', 110.00, 60.00),
(21, 'Cocolate com Morango', 120.00, 65.00),
(22, 'Prestígio', 110.00, 60.00),
(23, 'Toalha Felpuda', 110.00, 60.00),
(24, 'Calabresa', 32.00, 15.00),
(25, 'Escarola com Bacon', 32.00, 15.00),
(26, 'Pão de Queijo', 32.00, 15.00),
(27, 'Queijo com Bacon', 32.00, 15.00),
(28, 'Brigadeiro de Colher', 3.00, 2.50)


insert into tblFuncionarios values
(1, 'Edson Bolsonaro', 'Lolicon01203', '40.661.702-8', 1200.00, 'edson.koiti@etec.sp.gov.br', '(11)95178-5329', '58428-500'),
(2, 'Edson Teruel', 'BaroesDaPisadinhaHD', '16.691.104-5', 1450.00, 'victor.shu@etec.sp.gov.br', '(11)93811-6566', '88359-325'),
(3, 'Edson Advogado', 'Ed029348504', '44.708.213-9', 1120.00, 'jotacir.barros@etec.sp.gov.br', '(11)91021-7155', '69039-641'),
(4, 'Edson Sandubinha', 'KiderOvo45', '44.342.046-4', 1200.00, 'cristina.moris@etec.sp.gov.br', '(11)96245-8316', '59620-752'),
(5, 'Edson Habbibs', 'Estanaoeminhasenhakkk', '50.003.556-8', 1450.00, 'arthus.val@etec.sp.gov.br', '(11)92940-6934', '69314-635'),
(6, 'Juanito Lhamas', '1234', '48.374.141-3', 1054.00, 'juanito.lhamas@onlyfans.bo', '(11)97016-0855', '02317-060')

insert into tblAdministrador values
(1, 'Sueli White', '221175'),
(2, 'Marisa Gouveia', 'Nicole87'),
(3, 'Mazete Ribeiro', 'Santos80'),
(4, 'Alessandra Gouveia', 'Nicole89'),
(5, 'Felipe', 'SandroSlayer21'),
(6, 'Ribas', '1234')

insert into tblFornecedor values
('90.918.875/0001-60', 'Senhor Suíno', '12835-9112', 'Rua Magno Lopes', 'João Pessoa'),
('69.962.574/0001-47', 'Açucar União', '35742-0416', 'Rua Floriano Peixoto', 'Boa Vista'),
('65.952.287/0001-03', 'Itambé', '10316-0599', 'Avenida Fernando Baggi', 'Salvador'),
('28.707.298/0001-93', 'Petrobras', '14676-8498', '2ª Travessa Sudão', 'Feira de Santana'),
('48.661.629/0001-09', 'Renner', '31914-8238', 'Travessa Menino Marcelo', 'Maceió')

insert into tblVenda values
('25/11/2020', 1)

select * from tblVenda

insert into tblDetalheVenda values 
(1, 1, 5, 100),
(1, 2, 4, 80),
(1, 3, 3, 60),
(1, 4, 2, 40),
(1, 5, 1, 20)


-- Procedimentos

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> LOGIN <<<<<<<<<<<<<<<<<<<<<<<<<<<

CREATE PROC AcessoSistema
	@userType INT,
	@login INT,
	@senha VARCHAR(50)
AS
BEGIN
	IF @userType = 0
		SELECT * FROM tblAdministrador WHERE idAdministrador = @login and senhaADM = @senha
	ELSE 
		SELECT * FROM tblFuncionarios WHERE idFuncionario = @login and senhaFunc = @senha
END

		SELECT * FROM tblAdministrador WHERE idAdministrador = 6 and senhaADM = 1234


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> FUNCIONARIO <<<<<<<<<<<<<<<<<<<<<<<<<<<

-- Listar Funcionarios, usado para mandar os funcionários para o DtGrid 

create proc ListarFuncionarios
as
Select * from tblFuncionarios 
go

-- Listar Funcionário, usado para pegar os valores do funcionário na edição 

CREATE PROC ListarFuncionario
	@idFuncionario INT
	AS
		SELECT * FROM tblFuncionarios WHERE idFuncionario = @idFuncionario
	GO

-- Cadastrar Funcionarios, o próprio nome diz
CREATE PROC CadastrarFuncionarios
	@idFuncionario INT,
	@nomeFunc VARCHAR(50),
	@senhaFunc VARCHAR(50),
	@RG VARCHAR(8),
	@salario NUMERIC(6,2),
	@email VARCHAR(50),
	@telefone VARCHAR(10),
	@CEP VARCHAR (9)
AS 
INSERT INTO tblFuncionarios VALUES (@idFuncionario, @nomeFunc, @senhaFunc, @RG, @SALARIO, @EMAIL, @TELEFONE, @CEP)
GO

-- Editar Funcionários, o próprio nome diz

CREATE PROC EditarFuncionario
	@id INT,
	@nome VARCHAR(50),
	@senha VARCHAR(50),
	@RG VARCHAR(8),
	@salario NUMERIC(6,2),
	@email VARCHAR(50),
	@telefone VARCHAR(10),
	@CEP VARCHAR (9)
	AS
		UPDATE tblFuncionarios SET nomeFunc = @nome, senhaFunc = @senha, RG = @RG, salario = @salario, email = @email, telefone = @telefone, cep = @CEP WHERE idFuncionario = @id
	GO


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> FORNECEDOR <<<<<<<<<<<<<<<<<<<<<<<<<<<

-- Listar Fornecedores, usado para mandar os fornecedores para o DtGrid 

CREATE PROC ListarFornecedores
as
Select * from tblFornecedor
go

-- Listar Fornecedor, usado para pegar os valores do fornecedor na edição 

CREATE PROC ListarFornecedor
	@CNPJ VARCHAR(50)
	AS
		SELECT * FROM tblFornecedor WHERE CNPJ = @CNPJ
	GO

-- Cadastrar Fornecedores, o próprio nome diz

Create proc CadastrarFornecedores
    @cnpj varchar(18),
    @descFor varchar(30),
    @contato varchar(30),
    @endereco varchar(50),
    @cidade varchar(25)
as 
insert into tblFornecedor values (@cnpj, @descFor, @contato, @endereco, @cidade)
go

-- Editar Fornecedor, o próprio nome diz

CREATE PROC EditarFornecedor
	@CNPJ VARCHAR(18),
	@descFor VARCHAR(30),
	@contatoFor VARCHAR(30),
	@enderecoFor VARCHAR(50),
	@cidade VARCHAR(25)
	AS
		UPDATE tblFornecedor SET descFor = @descFor, contatoFor = @contatoFor, enderecoFor = @enderecoFor, cidade = @cidade WHERE CNPJ = @CNPJ
	GO


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Produtos <<<<<<<<<<<<<<<<<<<<<<<<<<<

-- Listar Produtos, pega os produtos cadastrados para manda pro DtGrid

CREATE PROC ListarProdutos
	AS
		SELECT * FROM tblProduto
	GO

-- Listar Produto, pega os valores na hora da edição

CREATE PROC ListarProduto
	@ID INT
	AS
		SELECT * FROM tblProduto WHERE idProduto = @ID
	GO

	exec ListarProduto 1


-- Cadastrar Produtos, o próprio nome diz

CREATE PROC CadastrarProdutos
    @idProd int,
    @descProd varchar(30),
    @preco numeric(5,2),
    @maisvalia numeric (5,2)
as
insert into tblProduto values (@idProd, @descProd, @preco, @maisValia)
go

-- Editar Produtos, o próprio nome diz

CREATE PROC EditarProduto
	@id INT,
	@descProduto VARCHAR(50),
	@precoProduto FLOAT,
	@maisValia FLOAT
	AS
		UPDATE tblProduto SET descProduto = @descProduto, precoProduto = @precoProduto, maisValia = @maisValia WHERE idProduto = @id
	GO


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Vendas <<<<<<<<<<<<<<<<<<<<<<<<<<<

-- Pegar vendas mensais
CREATE PROC LucroMensal
AS
	Select sum(P.maisValia * D.Quantidade) AS 'lucroMensal' from tblProduto P
    inner join tblDetalheVenda D on P.idProduto = D.idProduto
    inner join tblVenda V on V.idVenda = D.idVenda and MONTH(dataVenda) = MONTH(GETDATE()) and year(dataVenda) = YEAR(getdate());
GO

-- Lucro bruto mensal
CREATE PROC TotalMensal
AS
	Select sum(D.valorTotal) AS 'valorMensal' from tblDetalheVenda D
	inner join tblVenda V ON V.idVenda = D.idVenda AND MONTH(dataVenda) = MONTH(GETDATE()) and YEAR(dataVenda) = YEAR(getdate());
GO

-- Produtos mais vendidos
CREATE PROC MaisVendidos
AS
select top 5 P.descProduto AS 'Produto' , sum(D.quantidade) as Qtde from tblDetalheVenda D 
    inner join  tblProduto P on P.idProduto = D.idProduto
    group by P.descProduto order by Qtde desc 
GO

-- Vendas Mensais
CREATE PROC VendasMensais
AS
	SELECT D.* , V.dataVenda, V.idFuncionario AS 'idFunc' FROM tblDetalheVenda D
	inner join tblVenda V ON V.idVenda = D.idVenda AND MONTH(dataVenda) = MONTH(GETDATE()) and YEAR(dataVenda) = YEAR(getdate()) ORDER BY V.dataVenda ASC;
GO

exec VendasMensais

-- >>>>>>>>>>>>>>>>>>>>>>> Caixa <<<<<<<<<<<<<<<<<<<<<<<<<

-- Pegar valor do produto

CREATE PROC valorUnit
	@codBarras INT
	AS
		SELECT * FROM tblProduto WHERE idProduto = @codBarras
	GO

CREATE PROC gerarVenda
	@data DATE,
	@idFuncionario INT
AS 
    INSERT INTO tblVenda VALUES (@data, @idFuncionario)
GO

exec gerarVenda '26/11/2020', 1

CREATE PROC pegarID
	@nomeProd VARCHAR(50)
	AS
		SELECT idProduto FROM tblProduto WHERE descProduto = @nomeProd
	GO

CREATE PROC gerarDetalheVenda
	@idVenda INT,
	@idProduto INT,
	@qtde INT,
	@valorTotal FLOAT
	AS
		SET @idVenda = (SELECT MAX(idVenda) from tblVenda)
		INSERT INTO tblDetalheVenda values (@idVenda, @idProduto, @qtde, @valorTotal)
	GO

	exec gerarDetalheVenda 0, 1, 2, 10
