# dbt Analytics Engineering — Olist E-Commerce Data Modelling 

## Introduction

This project demonstrates the design and implementation of a data transformation pipeline 
using dbt (data build tool) and Google BigQuery to analyse the Brazilian E-Commerce dataset 
published by Olist. Raw transactional data spread across 9 source tables is transformed into 
clean, joined, and analytics-ready models following industry best practices in analytics engineering.

## Data Source

Dataset: [Brazilian E-Commerce Public Dataset by Olist (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  


## Objective

The objective of this project is to transform raw Olist e-commerce data into a structured 
analytical layer that supports business questions such as revenue by product category, 
seller performance, and customer spending behaviour — following the standard analytics 
engineering workflow of staging → marts.

## Features

- Layered dbt architecture (sources → staging → marts)
- 6 staging models that clean and standardise each raw source table
- 4 mart models (1 fact table, 3 dimension tables) with business logic applied
- 23 automated data quality tests (unique, not_null)
- Full model and column documentation via schema.yml
- Materialisation configured globally via dbt_project.yml
- Version controlled and deployed via GitHub

## Models
- `stg_orders` — cleaned orders
- `stg_customers` — cleaned customers
- `fct_orders` — orders with payments and items
- `dim_customers` — customers with order stats
- `dim_sellers` — sellers with review scores
- `dim_products` — products with English translations

## Tech Stack

- dbt Cloud
- Google BigQuery
- SQL
- YAML
- GitHub

## Data Source License

This project uses the Olist Brazilian E-Commerce dataset, distributed under the  
[Creative Commons CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) licence.  
Used for non-commercial portfolio purposes only.

## Author

Soichiro Tanabe

Feel free to explore the project and reach out if you have any questions.
