# 🍕 Sistema de Pizzaria — Modelagem de Banco de Dados

Este repositório contém toda a modelagem de um sistema de banco de dados para uma pizzaria, incluindo diagrama, entidades, documentação e scripts SQL.

## 📌 Visão Geral

O objetivo deste projeto é demonstrar a estrutura completa de um banco de dados relacional, seguindo boas práticas de modelagem e organização. O sistema foi planejado para atender operações de cadastro, pedidos, itens de pedido e serviços.

## 🧱 Conteúdo do Repositório

* **DER (Diagrama Entidade-Relacionamento)**
* **Tabelas normalizadas**
* **Planilha com todas as entidades**
* **Scripts SQL de criação e inserção**
* **Documentação das entidades**

## 🗂️ Entidades Principais

### 🧩 Tabela Cliente

| Campo      | Tipo     | Descrição                |
| ---------- | -------- | ------------------------ |
| id_cliente | INT (PK) | Identificador do cliente |
| nome       | VARCHAR  | Nome do cliente          |
| telefone   | VARCHAR  | Telefone                 |
| email      | VARCHAR  | Email                    |

### 👨‍🍳 Tabela Profissional

| Campo           | Tipo     | Descrição                     |
| --------------- | -------- | ----------------------------- |
| id_profissional | INT (PK) | Identificador do profissional |
| nome            | VARCHAR  | Nome do profissional          |
| especialidade   | VARCHAR  | Função/área de atuação        |
| telefone        | VARCHAR  | Telefone                      |

### 🧾 Tabela Pedido

| Campo           | Tipo     | Descrição                    |
| --------------- | -------- | ---------------------------- |
| id_pedido       | INT (PK) | Identificador do pedido      |
| id_cliente      | INT (FK) | Cliente que fez o pedido     |
| data_pedido     | DATETIME | Data e hora do pedido        |
| valor_total     | DECIMAL  | Valor total do pedido        |
| forma_pagamento | VARCHAR  | Forma de pagamento escolhida |

### 🍕 Tabela Item_Pedido

| Campo      | Tipo     | Descrição                      |
| ---------- | -------- | ------------------------------ |
| id_item    | INT (PK) | Identificador do item          |
| id_pedido  | INT (FK) | Pedido ao qual o item pertence |
| id_produto | INT (FK) | Produto escolhido              |
| quantidade | INT      | Quantidade do item             |
| subtotal   | DECIMAL  | Valor total do item            |

### 🛠️ Tabela Serviço

| Campo        | Tipo     | Descrição                |
| ------------ | -------- | ------------------------ |
| id_servico   | INT (PK) | Identificador do serviço |
| nome_servico | VARCHAR  | Nome do serviço          |
| valor        | DECIMAL  | Valor do serviço         |

### 🔧 Tabela Serviço_Pedido

| Campo             | Tipo     | Descrição                               |
| ----------------- | -------- | --------------------------------------- |
| id_servico_pedido | INT (PK) | Identificador da relação serviço/pedido |
| id_pedido         | INT (FK) | Pedido associado                        |
| id_servico        | INT (FK) | Serviço realizado                       |
| id_profissional   | INT (FK) | Profissional responsável                |

### 👤 Cliente

Armazena dados dos clientes.

### 👨‍🍳 Profissional

dados dos profissionais aptos a realizar serviços.

### 🧾 Pedido

Representação completa de um pedido realizado.

### 🍕 Item_Pedido

Itens vinculados a um pedido.

### 🛠️ Serviço

Serviços oferecidos (ex.: preparo, entrega).

### 🔧 Serviço_Pedido

Relacionamento entre pedido, serviço e profissional.

## 🧾 Scripts SQL

Localizados na pasta `/sql`, contendo:

* **create_tables.sql** — Criação das tabelas
* **inserts_exemplo.sql** — Dados de exemplo

## 📊 Planilha de Entidades

O arquivo `.xlsx` contém todas as tabelas formatadas e descritas.

## 📬 Contribuição

Sugestões, melhorias e estudos são sempre bem-vindos!

