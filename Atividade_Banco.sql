USE master
GO

DROP DATABASE lojainfo;
GO

CREATE DATABASE lojainfo;
GO

USE lojainfo;
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

ALTER TABLE tb_vendas ADD CONSTRAINT fk_vda_cli
FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente);

ALTER TABLE tb_vendas_itens ADD CONSTRAINT fk_itens_vda
FOREIGN KEY (id_venda) REFERENCES tb_vendas(id_venda);

ALTER TABLE tb_vendas_itens ADD CONSTRAINT fk_itens_hardware
FOREIGN KEY (id_hardware) REFERENCES tb_hardware(id_hardware);


INSERT INTO tb_cliente VALUES 
('Huguinho','Aguia Haia 123',20,'M','11-99999-9999','hug@dom.com'),
('Zezinho','Aguia Haia 456',50,'M','11-99999-9999','zez@dom.com'),
('Luizinho','Aguia Haia 789',60,'M','11-99999-9999','lui@dom.com'),
('Monica','Aguia Haia 000',30,'F','11-99999-9999','mon@dom.com'),
('Luluzinha','Aguia Haia 999',40,'F','11-99999-9999','lulu@dom.com');
GO

INSERT INTO tb_hardware VALUES
('gabinete', 60.50, 100, 10),
('processador', 300.50, 100, 10),
('placa mãe', 100.50, 100, 10),
('Dísco Rígido', 80.90, 100, 10),
('monitor', 300.20, 100, 10),
('mouse',45.90,50,20);
GO


INSERT INTO tb_vendas VALUES
(2,'2018/02/10', NULL),
(3, '2018/02/20', 0.1);
GO

/*inserindo as vendas para ZEZINHO id = 2 id_venda = 1*/

INSERT INTO tb_vendas_itens
(id_venda,id_hardware,qtde_item,pco_vda) VALUES
(1,4,10, 600.50),
(1,5,10, 3005),
(1,2,10, 1050),
(1,4,10, 809),
(1,4,10, 3002);




/*inserindo vendas para LUIZINHO id = 3 id_venda = 2*/
INSERT INTO tb_vendas_itens
(id_venda,id_hardware,qtde_item,pco_vda) VALUES
(2,4,1, 60),
(2,5,10, 300),
(2,1,10, 101),
(2,3,10, 80),
(2,2,10, 300);
GO

/* P1 listar vendas mostrando o nome do cliente que comprou cada uma delas*/

SELECT * from  tb_cliente as c JOIN tb_vendas as v 
on c.id_cliente = v.id_cliente;
GO

/*p2 mostrar clientes que não fizeram compra nenhuma*/

SELECT * FROM tb_cliente as c left join tb_vendas as v on c.id_cliente=v.id_cliente
WHERE v.id_venda is null
GO

/*P3 produtos que não foram vendidos*/

SELECT * FROM tb_hardware as h LEFT JOIN tb_vendas_itens as v on
h.id_hardware = v.id_hardware

WHERE v.id_item is null

GO



