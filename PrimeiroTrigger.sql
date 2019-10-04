USE master

DROP DATABASE BancoTeste
GO

CREATE DATABASE BancoTeste
GO

USE BancoTeste
GO


CREATE TABLE cliente (id_cliente int PRIMARY KEY IDENTITY(1,1),
nome varchar(50),
endereco varchar(50),
telefone varchar(50)
);
GO
CREATE TABLE auditoria_cliente(id_cliente int PRIMARY KEY, 
nome varchar(50),
endereco varchar(50),
telefone varchar(50),
acao_auditoria varchar(100),
data_auditoria date);
GO

CREATE TRIGGER trgrAfterInsertCliente ON  cliente
FOR INSERT
AS
declare @cliid int;
declare @clinome varchar(50);
declare @cliend varchar(50);
declare @clitel varchar(50);

declare @audit_action varchar(100);

select @cliid = i.id_cliente from inserted i;
select @clinome = i.nome from inserted i;
select @cliend = i.endereco from inserted i;
select @clitel = i.telefone from inserted i;

set @audit_action = 'Registro Inserido';

INSERT INTO auditoria_cliente (id_cliente,nome,endereco,telefone,acao_auditoria,data_auditoria)
VALUES(@cliid,@clinome,@cliend,@clitel,@audit_action,GETDATE());
GO

INSERT INTO cliente  VALUES('zuleika','rua gianna','40028922');
INSERT INTO cliente  VALUES('maria','rua joao','40008922');
GO

SELECT * FROM auditoria_cliente
GO

SELECT * FROM cliente
GO

/*CREATE TRIGGER trgrAfterDeleteCliente ON cliente
FOR DELETE 
AS

declare @cliid int;
declare @clinome varchar(50);
declare @cliend varchar(50);
declare @clitel varchar(50);

declare @audit_action varchar(100);

select @cliid = i.id_cliente FROM deleted i;
select @clinome = i.nome FROM deleted i;
select @cliend = i.endereco FROM deleted i;
select @clitel = i.telefone FROM deleted i;

set @audit_action = 'Registro Apagado';

UPDATE auditoria_cliente 
SET nome = @clinome, endereco = @cliend, telefone = @clitel
WHERE id_cliente = @cliid
GO

DELETE FROM cliente WHERE id_cliente = 1;
GO*/

