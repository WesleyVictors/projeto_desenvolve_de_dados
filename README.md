# Projeto Desenvolve de Dados

## 1. Visão Geral

Este projeto simula um ambiente completo de e-commerce, abrangendo desde a geração de dados sintéticos até a construção de dashboards analíticos.

A solução contempla:
- Geração de dados com Python
- Modelagem relacional em SQL
- Carga e organização dos dados em banco
- Análise e visualização no Power BI

---

## 2. Objetivos

- Simular um cenário real de negócio para análise de dados
- Praticar modelagem de banco de dados relacional
- Criar uma base estruturada para consultas SQL
- Desenvolver dashboards analíticos
- Aplicar conceitos de Business Intelligence

---

## 3. Arquitetura do Projeto

Fluxo de dados:

Jupyter Notebook → Geração de Dados → CSV → Banco de Dados SQL → Power BI

---

## 4. Estrutura do Repositório
- `geração_dataset.ipynb`: notebook para explorar, gerar e visualizar o dataset.
- `sql/clientes.sql`: definição e dados da tabela `clientes`.
- `sql/produtos.sql`: definição e dados da tabela `produtos`.
- `sql/pedidos.sql`: definição e dados da tabela `pedidos`.
- `sql/itens_pedidos.sql`: definição e dados da tabela `itens_pedidos`.
- `sql/pedidos_ecommerce.sql`: script consolidado de criação e carga de todas as tabelas.
- `ecommerce.pbix` : Dashboard no Power BI com a análise dos dados 

---

## 5. Tecnologias Utilizadas

- Python (pandas, numpy)
- Jupyter Notebook
- SQL (MySQL, PostgreSQL ou SQLite)
- Power BI
- GitHub

---

## 6. Execução do Projeto

### 6.1 Clonar o repositório

```bash
git clone https://github.com/WesleyVictors/projeto_desenvolve_de_dados.git
cd projeto_desenvolve_de_dados