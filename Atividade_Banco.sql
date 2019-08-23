USE master
GO

DROP DATABASE  lojainfo 
GO

CREATE DATABASE lojainfo
GO

USE lojainfo
GO

CREATE TABLE tb_cliente(
id_cliente int PRIMARY KEY IDENTITY(1,1),
nome nvarchar(50)not null,
endereco nvarchar(100),
idade int NOT NULL,
sexo char(1)NOT NULL,
fone nvarchar(15),
email nvarchar(70)
)
GO
CREATE TABLE tb_hardware(
id_hardware int PRIMARY KEY IDENTITY(1,1),
descricao nvarchar(50)NOT NULL,
preco_unid decimal NOT NULL,
qtde_atual int NOT NULL,
qtde_minima int
)
GO
CREATE TABLE tb_vendas(
id_venda int PRIMARY KEY IDENTITY(1,1),
id_cliente int NOT NULL,
data date not null,
desconto decimal (2,2)
)
GO
CREATE TABLE tb_vendas_itens(
id_item int PRIMARY KEY IDENTITY(1,1),
id_venda int not null,
id_hardware int not null,
qtde_item int not null,
pco_vda decimal(8,2)not null
)
GO
