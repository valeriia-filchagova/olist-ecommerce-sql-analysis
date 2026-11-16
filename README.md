# olist-ecommerce-sql-analysis

## Project Overview

This project analyzes the Brazilian Olist E-Commerce dataset using PostgreSQL to explore sales performance, customer behavior, and geographic trends.

The goal is to identify business insights that can help improve customer retention, understand revenue distribution, and support data-driven decisions.

## Tools & Technologies

- PostgreSQL
- DBeaver
- SQL

## SQL Skills Demonstrated

- Data cleaning and validation
- JOINs (INNER JOIN, LEFT JOIN)
- Aggregations (COUNT, SUM, AVG)
- GROUP BY and HAVING
- Common Table Expressions (CTEs)
- Subqueries
- Date functions (DATE_TRUNC)
- CASE statements
- Data filtering and sorting

## Key Business Insights

### 1. Customer Retention
- The dataset contains 96,096 unique customers.
- Only 2,997 customers placed more than one order.
- The repeat customer rate is approximately **3.12%**.

**Business Insight:** The low repeat purchase rate suggests an opportunity to investigate customer retention and encourage repeat purchases.

### 2. Geographic Sales Performance
- São Paulo (SP) generated the highest revenue, approximately **R$ 5.07 million** from delivered orders.
- Rio de Janeiro (RJ) and Minas Gerais (MG) ranked second and third.
- São Paulo city was the leading city by revenue.

**Business Insight:** Sales are concentrated in major geographic markets, particularly São Paulo.

### 3. Average Order Value by State
- Paraíba (PB) had one of the highest average order values, approximately **R$ 218**.
- States with the highest total revenue did not necessarily have the highest average order values.

**Business Insight:** Revenue and average order value provide different perspectives on regional performance. Both metrics are useful when evaluating markets.

## Project Structure

```text
olist-ecommerce-sql-analysis/
│
├── 00_data_cleaning.sql
├── 01_data_exploration.sql
├── 02_sales_analysis.sql
├── 03_customer_analysis.sql
├── 04_geographic_analysis.sql
└── README.md
```

## Dataset

**Source:** Brazilian E-Commerce Public Dataset by Olist (Kaggle).

The dataset contains information about orders, customers, products, payments, and deliveries from a Brazilian e-commerce marketplace.

The analysis focuses on sales performance, customer purchasing behavior, and geographic revenue distribution.

Dataset: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
