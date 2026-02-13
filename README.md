# Bank Customer Churn Analysis (SQL)

## Project Overview
This project analyzes customer churn for a banking industry dataset using SQL (MySQL).
The goal is to identify which customer segments are most likely to leave the bank and provide business recommendations to reduce churn.

This project was completed as part of a **MentorMind Menternship (co-certified by UpGrad)**.

---

## Problem Statement
Customer churn is a major challenge for banks because losing customers directly impacts revenue and trust.
This project answers questions like:
- How many customers churned vs stayed?
- Which regions have the highest churn?
- Which customer segments are at higher churn risk?

---

## Tools Used
- **MySQL**
- **SQL (DDL, DML, GROUP BY, CASE, Window Functions)**
- Dataset: Bank Customer Churn Dataset (CSV)

---

## Dataset Summary
- Total customers: **10,000**
- Churned customers (Exited = 1): **2,037**
- Retained customers (Exited = 0): **7,963**

---

## Key Analysis Performed
- Overall churn rate calculation
- Churn by Geography
- Churn by Gender
- Churn by Activity (IsActiveMember)
- Churn by Number of Products (NumOfProducts)
- Churn by Balance Type (Zero vs Non-zero)
- Top customers analysis using Window Functions

---

## Key Insights (Highlights)
- **Germany has the highest churn rate (32.44%)**
- **Inactive customers churn much more (26.85%) than active customers (14.27%)**
- Customers with **3 products (82.71%) and 4 products (100%)** show extremely high churn
- Customers with **2 products** have the lowest churn rate (**7.58%**)
- Non-zero balance customers are leaving more, meaning the bank may lose valuable customers

---

## Business Recommendations
- Focus retention strategy on **Germany**
- Re-engage **inactive customers** using campaigns and loyalty benefits
- Improve customer experience for **multi-product customers (3–4 products)**
- Reduce extra charges (example: free ATM usage, lower service fees)

---

## Deliverables
- SQL Code File (all queries used in analysis)
- PDF Analysis Report
- Leadership Presentation (PPT)

---

## Author
**Sofiyan Shaikh **
