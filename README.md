# Olist E-Commerce Analytics - dbt Portfolio Project

## Overview
This dbt project transforms the Brazilian E-Commerce dataset 
by Olist into analytics-ready data models.

## Tech Stack
- dbt Cloud
- Google BigQuery
- GitHub

## Project Structure
- **Staging models** — cleaned raw data
- **Mart models** — business-ready joined tables

## Models
- `stg_orders` — cleaned orders
- `stg_customers` — cleaned customers
- `fct_orders` — orders with payments and items
- `dim_customers` — customers with order stats
- `dim_sellers` — sellers with review scores
- `dim_products` — products with English translations

## Tests
23 tests covering uniqueness, not_null constraints
