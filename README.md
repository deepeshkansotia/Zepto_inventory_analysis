# Zepto Inventory Analysis

This project analyzes Zepto product inventory data using SQL to extract business insights, perform data cleaning, and explore product-level trends.

The analysis focuses on identifying pricing patterns, discounts, inventory availability, and value-for-money products using structured queries.

---

## Dataset Overview

The dataset contains product-level inventory information including:

- SKU ID
- Product category
- Product name
- Maximum Retail Price (MRP)
- Discount percentage
- Available quantity
- Discounted selling price
- Product weight (grams)
- Stock availability
- Quantity

---

## Database Schema

Table: `zepto`

Columns:

- `sku_id` – Unique identifier for each product
- `category` – Product category
- `name` – Product name
- `mrp` – Maximum retail price
- `discountPercent` – Discount applied on product
- `availableQuantity` – Inventory available
- `discountedSellingPrice` – Final selling price
- `weightInGms` – Product weight
- `outOfStock` – Stock availability flag
- `quantity` – Quantity per SKU

---

## Project Workflow

### 1. Data Exploration
Initial analysis of the dataset structure.

Key queries performed:
- Counting total records
- Sampling dataset rows
- Checking null values
- Identifying unique categories
- Comparing in-stock vs out-of-stock products
- Detecting duplicate product names across SKUs

---

### 2. Data Cleaning

Data preprocessing steps included:

- Removing rows with invalid price values
- Converting prices from paise to rupees
- Validating product records

---

### 3. Business Insights

Several analytical queries were written to extract meaningful insights:

- Top products with highest discounts
- High-MRP products currently out of stock
- Potential revenue by product category
- Expensive products with minimal discounts
- Categories offering highest average discounts
- Value-for-money products using price-per-gram
- Product classification by weight
- Total inventory weight by category

---

## Example Insights

Some insights derived from the analysis include:

- Identification of the best value products based on price per gram
- Categories contributing the highest potential revenue
- Products with high MRP but low discounts
- Inventory distribution across product categories

---

## Technologies Used

- SQL
- PostgreSQL
- Data Analysis

---
