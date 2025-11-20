CREATE DATABASE PizzariaSabor_e_Arte
GO
USE PizzariaSabor_e_Arte
GO

CREATE TABLE Clientes(
	ClienteID INT IDENTITY (1,1) PRIMARY KEY,
	Nome VARCHAR (80) NOT NULL, 
	Telefone VARCHAR (20) NOT NULL,
	Rua VARCHAR(100) NOT NULL,
	NumeroCasa VARCHAR(10) NOT NULL
);
Go

INSERT INTO Clientes(Nome,Telefone,Rua, NumeroCasa)
VALUES
( 'Ana Souza', '99999-1111', 'Rua das Flores', '10'),
( 'Carlos Lima ', '98888-2222', 'Av. Brasil', '50'),
( 'Mariana Torres', '97777-3333', 'Rua das Palmeiras', '55'),
( 'Roberto Dias', '96666-4444', 'Av. das Nações', '200'),
( 'Luciana Prado', '95555-2222', 'Rua Bela Vista', '75'),
( 'Tiago Alves', '94444-9999', 'Av. Industrial', '15'),
( 'Fernanda Costa', '93333-8888', 'Rua Rio Branco', '90'),
( 'Paulo Martins', '92222-7777', 'Av. Central', '120'),
( 'João Pereira', '91111-2222', 'Av. das Américas', '500'),
( 'Camila Rocha', '90000-3333', 'Rua Verde', '85');
GO

SELECT * FROM Clientes 



CREATE TABLE Tamanhos(
	TamanhoID INT IDENTITY (1,1) PRIMARY KEY, 
	Opcao VARCHAR(50) NOT NULL
);
GO

INSERT INTO Tamanhos(Opcao)
VALUES
('Grande'),
('Média'),
('Pequena');

SELECT * FROM Tamanhos



CREATE TABLE Atendentes(
	AtendenteID INT IDENTITY (1,1) PRIMARY KEY,
	Nome VARCHAR (50) NOT NULL
);
GO



INSERT INTO Atendentes(Nome)
VALUES
('João'),
('Maria');

SELECT * FROM Atendentes



CREATE TABLE Formas(
	OpcaoID INT IDENTITY (1,1) PRIMARY KEY, 
	FormaPagamento VARCHAR(50) NULL
);
GO

INSERT INTO Formas(FormaPagamento)
VALUES
('Cartão'),
('Dinheiro'),
('Pix');

SELECT * FROM Formas

CREATE TABLE Ingredientes(
	IngredienteID INT IDENTITY (1,1) PRIMARY KEY, 	
	Ingrediente VARCHAR(50) NOT NULL
);
GO
INSERT INTO Ingredientes(Ingrediente)
VALUES
('Massa'),
('Calabresa'),
('Cebola'),
('Organo '),
('Quatro Queijo'),
('Catupiry'),
('Molho de Tomate'),
('Presunto'),
('Ovo cozido'),
('Muçarela'),
('Frango'),
('Manjerição');
GO

SELECT * FROM Ingredientes





CREATE TABLE Pizzas(
	PizzaID INT IDENTITY (1,1) PRIMARY KEY,
	Sabor VARCHAR(100) NOT NULL
);
GO
INSERT INTO Pizzas(Sabor)
VALUES
('Calabresa'),
('Portuguesa'),
('Quatro Queijos'),
('Frango com Catupiry'),
('Marguerita');
GO

SELECT * FROM Pizzas


CREATE TABLE Pizza_Ingredientes (
	PizzaID INT, 
	IngredienteID INT,
	FOREIGN KEY (PizzaID) REFERENCES Pizzas(PizzaID),
	FOREIGN KEY (IngredienteID) REFERENCES Ingredientes(IngredienteID) 
);

GO

INSERT INTO Pizza_Ingredientes(PizzaID, IngredienteID)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 7),
(2, 1),
(2, 3),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(3, 1),
(3, 5),
(3, 7),
(4, 1),
(4, 6),
(4, 7),
(4, 8),
(5, 1),
(5, 7),
(5, 10),
(5, 12);

SELECT * FROM Pizza_Ingredientes

CREATE TABLE Pizza_Tamanho(
	PizzaNovoID INT IDENTITY (1,1) PRIMARY KEY,
	PizzaID INT NOT NULL, 
	TamanhoID INT NULL,
	PrecoUnitario DECIMAL (10,2) NOT NULL, 
	FOREIGN KEY (PizzaID) REFERENCES Pizzas(PizzaID),
	FOREIGN KEY (TamanhoID) REFERENCES Tamanhos(TamanhoID)
);
GO

INSERT INTO Pizza_Tamanho(PizzaID,TamanhoID,PrecoUnitario)
VALUES
(1, 1, 45.0),
(1, 2, 39.0),
(1, 3, 30.0),
(2, 1, 45.0),
(2, 2, 38.0),
(2, 3, 33.0),
(3, 1, 47.0),
(3, 2, 40.0),
(4, 1, 46.0),
(4, 2, 38.0),
(4, 3, 35.0),
(5, 1, 42.0),
(5, 3, 33.0);
GO

SELECT * FROM Pizza_Tamanho

CREATE TABLE Pedidos(
	PedidoID INT IDENTITY (1,1) PRIMARY KEY,
	ClienteID INT NOT NULL,
	FormaPagamentoID INT NOT NULL,
	AtendenteID INT NULL,
	DataPedido DATE NOT NULL,
	Total DECIMAL(10,2),
	FOREIGN KEY(ClienteID) REFERENCES Clientes(ClienteID),
	FOREIGN KEY(FormaPagamentoID) REFERENCES Formas(OpcaoID),
	FOREIGN KEY(AtendenteID) REFERENCES Atendentes(AtendenteID)
);
GO


INSERT INTO Pedidos(ClienteID,FormaPagamentoID,AtendenteID,DataPedido,Total)
VALUES
(1, 1, 1, '2025-11-10', 90.0),
(2, 2, 2, '2025-11-10', 38.0),
(1, 1, 1, '2025-11-10', 47.0),
(3, 3, 1, '2025-11-11', 105.0),
(4, 1, 2, '2025-11-11', 42.0),
(5, 2, 1, '2025-11-12', 78.0),
(6, 3, 2, '2025-11-12', 90.0),
(7, 1, 1, '2025-11-13', 40.0),
(8, 2, 2, '2025-11-14', 120.0),
(3, 3, 1, '2025-11-14', 84.0),
(9, 1, 1, '2025-11-14', 46.0),
(10, 3, 2,'2025-11-15', 78.0),
(8, 2, 2, '2025-11-15', 45.0),
(7, 1, 1, '2025-11-16', 66.0),
(6, 3, 2, '2025-11-16', 141.0),
(4, 1, 1, '2025-11-17', 38.0),
(5, 2, 2, '2025-11-17', 42.0),
(3, 3, 1, '2025-11-18', 78.0),
(1, 1, 1, '2025-11-18', 46.0),
(2, 2, 2, '2025-11-18', 33.0);

GO

SELECT * FROM Pedidos;


CREATE TABLE PEDIDO_PIZZA(
	ItemID INT IDENTITY (1,1) PRIMARY KEY,
	PedidoID INT NOT NULL,
	PizzaNovoID INT NOT NULL,
	Quantidade INT NOT NULL,
	PrecoUnitario DECIMAL (10,2),
	FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
	FOREIGN KEY (PizzaNovoID) REFERENCES Pizza_Tamanho(PizzaNovoID)
);
GO

INSERT INTO PEDIDO_PIZZA(PedidoID, PizzaNovoID, Quantidade, PrecoUnitario)
VALUES
(1, 1, 2, 45.0),
(2, 5, 1, 38.0),
(3, 7, 1, 47.0),
(4, 11, 3, 35.0),
(5, 12, 1, 42.0),
(6, 2, 2, 39.0),
(7, 4, 2, 45.0),
(8, 8, 1, 40.0),
(9, 3, 4, 30.0),
(10, 12, 2, 42.0),
(11, 9, 1, 46.0),
(12, 2, 2, 39.0),
(13, 4, 1, 45.0),
(14, 13, 2, 33.0),
(15, 7, 3, 47.0),
(16, 10, 1, 38.0),
(17, 12, 1, 42.0),
(18, 2, 2, 39.0),
(19, 9, 1, 46.0),
(20, 6, 1, 33.0);
GO

SELECT * FROM PEDIDO_PIZZA




-- Listar pedidos com mais de uma pizza;
SELECT * FROM PEDIDO_PIZZA
WHERE Quantidade > 1;


--Buscar clientes cujo nome começa com “M” (LIKE 'M%');
SELECT Nome 
FROM Clientes 
WHERE Nome like 'M%';

-- Filtrar pedidos realizados entre duas datas específicas (BETWEEN);
SELECT PedidoID,ClienteID, AtendenteID,Total 
FROM Pedidos
WHERE DataPedido BETWEEN '2025-11-12' AND '2025-11-17';


-- Exibir pizzas com valor entre dois preços (BETWEEN)
SELECT * 
FROM Pizza_Tamanho
WHERE PrecoUnitario BETWEEN 40.50 AND 45.50

--ORDER BY → ordenar resultados por nome, data, valor, etc

SELECT *
FROM Clientes 
ORDER BY Nome ASC; 

SELECT PedidoID,DataPedido
FROM Pedidos
ORDER BY DataPedido ASC; 

SELECT PedidoID,DataPedido, Total
FROM Pedidos
ORDER BY Total DESC; -- Maiores valores

-- Quantidade que cada forma de pagamento foi utilizada
SELECT FormaPagamentoID, COUNT(PedidoID) AS TotalFormas	
FROM Pedidos
GROUP BY FormaPagamentoID;

--Total de Cliente atendido por atendente 
SELECT AtendenteID, COUNT(ClienteID) as TotalAtendido
FROM Pedidos
GROUP BY AtendenteID


-- Média dos cliente em relção quantidade de pedidos realizados
SELECT ClienteID, AVG(Total) AS MédiaCliente
FROM Pedidos
GROUP BY ClienteID


-- Quantidade que cada atendente vendeu 
SELECT AtendenteID, SUM(Total) as TotalVendido
FROM Pedidos
GROUP BY AtendenteID

-- Total gasto de cada cliente
SELECT ClienteID, SUM(Total) as TotalGasto
FROM Pedidos
GROUP BY ClienteId

-- Nova coluna chamada email 
ALTER TABLE Clientes
ADD Email VARCHAR(200) NULL;

UPDATE Clientes
SET Email= 'seila@gmail.com'
WHERE Nome = 'Ana Souza'

UPDATE Clientes
SET Email= 'algumacoisa@gmail.com'
WHERE Nome = 'Paulo Martins'

UPDATE Clientes
SET Email= 'E-mail não identificado'
WHERE Email IS NULL 


-- Apagar todos registro onde tiver informação na coluna "Quantidade" certamente não teria uso na vida real, mas é só exemplo do IS NOT NULL.

DELETE FROM PEDIDO_PIZZA
WHERE Quantidade IS NOT NULL;

SELECT* FROM PEDIDO_PIZZA

ALTER TABLE Clientes
DROP COLUMN Email;
GO 

ALTER TABLE Clientes
ALTER COLUMN Nome VARCHAR(120);


DROP TABLE Formas

DROP DATABASE PizzariaSabor_e_Arte

