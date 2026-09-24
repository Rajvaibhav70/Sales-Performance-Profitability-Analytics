# Sales Performance & Profitability Analytics

## 📊 Project Overview

An end-to-end **Sales Performance & Profitability Analytics** project built using **MySQL, SQL, Power BI, Power Query, Data Modeling, and DAX**.

The project analyzes sales transactions to understand revenue performance, profitability, regional performance, customer contribution, product performance, and monthly sales trends.

---

## 🎯 Business Objectives

The analysis answers key business questions:

* How much are we selling?
* Which regions generate the most sales?
* Which categories and products are most profitable?
* Who are the top customers by sales?
* How are sales changing month by month?
* Which products have high sales but relatively low profit margins?
* Which products and customers may require further attention?

---

## 📁 Dataset

The project uses a sales transaction dataset containing:

* **1,500 sales transactions**
* **Period:** January 2025 – December 2025
* **Sales, Cost and Profit information**
* Customer, Product, Category and Region details

### Main Columns

| Column     | Description             |
| ---------- | ----------------------- |
| Order_ID   | Unique order identifier |
| Order_Date | Date of the order       |
| Customer   | Customer name           |
| Product    | Product name            |
| Category   | Product category        |
| Region     | Sales region            |
| Quantity   | Quantity sold           |
| Unit_Price | Price per unit          |
| Sales      | Total sales value       |
| Cost       | Total cost              |
| Profit     | Sales minus cost        |

### Business Calculations

**Sales = Quantity × Unit Price**

**Profit = Sales − Cost**

**Profit Margin = Profit ÷ Sales**

---

## 🛠️ Tools & Technologies

* **MySQL**
* **SQL**
* **Power BI**
* **Power Query**
* **DAX**
* **Data Modeling**
* **CSV / Excel**

---

## 🔄 Project Workflow

```text
Raw Sales Dataset
       ↓
MySQL Database
       ↓
SQL Data Validation
       ↓
SQL Business Analysis
       ↓
MySQL → Power BI Connection
       ↓
Power Query Transformation
       ↓
Data Modeling
       ↓
DAX Measures
       ↓
Power BI Dashboard
       ↓
SQL Analysis & Profitability Review
```

---

## 🗄️ SQL Analysis

The MySQL analysis includes:

* Data validation
* Record and duplicate checks
* Missing-value checks
* Sales validation
* Profit validation
* Aggregations using `SUM()`
* Grouping using `GROUP BY`
* Filtering using `HAVING`
* Common Table Expressions using `CTE`
* Month-over-month sales analysis using `LAG()`
* Ranking using `RANK()`
* Row numbering using `ROW_NUMBER()`
* Category-level ranking using `PARTITION BY`
* Top customers analysis
* Top products analysis
* Regional sales and profitability analysis
* Product margin analysis
* High-sales, low-margin product identification

---

## 📈 Power BI Dashboard

The Power BI dashboard provides an interactive view of sales performance and profitability.

### KPI Metrics

* Total Sales
* Total Profit
* Profit Margin %
* Total Orders
* Average Order Value

### Interactive Filters

* Region
* Date
* Category
* Product

### Visualizations

* Monthly Sales Trend
* Sales by Region
* Top 10 Customers by Sales
* Sales by Category
* Top 10 Products by Sales
* Sales vs Profit by Product

---

## 🧮 DAX Measures

Key DAX measures used in the Power BI dashboard include:

```DAX
Total Sales = SUM(Sales_Data[Sales])

Total Profit = SUM(Sales_Data[Profit])

Profit Margin % =
DIVIDE([Total Profit], [Total Sales])

Total Orders =
DISTINCTCOUNT(Sales_Data[Order_ID])

Average Order Value =
DIVIDE([Total Sales], [Total Orders])
```

Additional SQL-connected measures were created to validate the Power BI results against the MySQL analysis.

---

## 🔍 Key Business Insights

Based on the dataset:

* Total Sales: **$40.04M**
* Total Profit: **$13.92M**
* Overall Profit Margin: **34.77%**
* Total Orders: **1,500**
* Average Order Value: **$26,694.66**

### Regional Performance

**North** generated the highest sales at approximately **$11.14M**.

**Central** generated approximately **$4.95M** in sales.

### Category Performance

**Electronics** generated the highest sales at approximately **$17.32M**.

**Office Accessories** generated approximately **$2.04M** in sales.

### Product Profitability

The **Tablet** generated approximately **$3.89M** in sales but had a **24.46% profit margin**, below the overall **34.77%** margin.

Other high-sales products with margins below 30% included:

* Monitor 27-inch
* Printer

These products can be considered for further profitability review.

---

## 📂 Repository Files

| File                                             | Description                       |
| ------------------------------------------------ | --------------------------------- |
| `Sales_Performance_Profitability_Dashboard.pbix` | Power BI dashboard                |
| `Sales_Performance_Project_Dataset.csv`          | Source sales dataset              |
| `sales_analysis.sql`                             | SQL analysis and business queries |
| `README.md`                                      | Project documentation             |

---

## 💡 Skills Demonstrated

This project demonstrates practical experience in:

* SQL data analysis
* MySQL database management
* Data validation
* Business KPI analysis
* Sales and profitability analysis
* Window functions
* CTEs
* Ranking and partitioning
* Power Query transformations
* Data modeling
* DAX measures
* Power BI dashboard development
* Business-oriented data storytelling

---

## 🚀 Project Outcome

This project demonstrates an end-to-end analytics workflow starting from raw transactional data and progressing through **SQL-based analysis, data validation, Power BI integration, data modeling, DAX calculations, and interactive dashboard development**.

The project is designed to demonstrate practical **data analytics, business intelligence, SQL, and profitability analysis** skills.
