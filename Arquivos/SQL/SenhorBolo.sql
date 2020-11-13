CREATE DATABASE SrBolo
USE SrBolo
DROP DATABASE SrBolo

CREATE TABLE tblFuncionarios(
	idFuncionario INT PRIMARY KEY,
	nomeFunc VARCHAR(50) NOT NULL,
	senhaFunc VARCHAR(50),
	RG VARCHAR(8),
	salario NUMERIC(5,2),
	email VARCHAR(50),
	telefone VARCHAR(11),
	CEP VARCHAR (9)
)

CREATE TABLE tblVenda(
	idVenda INT PRIMARY KEY,
	dataVenda DATE,
	idFuncionario INT FOREIGN KEY
	REFERENCES tblFuncionarios (idFuncionario)
)

CREATE TABLE tblProduto(
	idProduto INT PRIMARY KEY,
	descProduto VARCHAR (30),
	precoProduto NUMERIC (5,2),
	maisValia NUMERIC(5,2)
)

CREATE TABLE tblDetalheVendas (
	idCategoria INT PRIMARY KEY,
	nome VARCHAR(50)
)

CREATE TABLE tblAdministrador (
	idAdministrador INT PRIMARY KEY,
	nomeADM VARCHAR(50),
	senhaADM VARCHAR(50)
)

CREATE TABLE tblFornecedor(
	CNPJ VARCHAR(14),
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