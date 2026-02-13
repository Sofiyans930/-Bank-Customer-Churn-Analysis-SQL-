````md
# Bank Customer Churn Analysis (SQL)

## 🧠 Project Overview

This project analyzes customer churn for the banking industry using **SQL (MySQL)**.
The goal is to understand patterns in customer behavior and identify segments with the highest risk of churn.

**This project was completed as part of a MentorMind Menternship (co-certified by UpGrad).**

---

## 💼 Problem Statement

Customer churn is a major issue for banks because losing customers impacts revenue and future growth.
This analysis helps answer:

* How many customers churned vs stayed?
* Which segments are most likely to churn (by geography, gender, activity, number of products)?
* What business steps can reduce churn?

---

## 🛠️ Tools Used

* **SQL (MySQL)** for querying and analysis
* **DDL & DML commands** to structure and manipulate data
* **GROUP BY, CASE statements**
* **Window functions** for ranking and segmentation

---

## 📊 Dataset Summary

* Dataset: `Bank_Churn_Dataset.csv`
* Total customers: **10,000**
* Churned customers (Exited = 1): **2,037**
* Retained customers (Exited = 0): **7,963**

---

## 🔍 Key Findings

* **Germany** has the highest churn rate (**32.44%**)
* **Inactive members** churn much more than active members
* Customers with **3–4 products** have very high churn rates (up to **100%**)

---

## 💡 Business Recommendations

Based on the churn analysis, the bank can reduce churn by taking the following actions:

* Focus retention campaigns in **Germany**, since it has the highest churn rate
* Encourage inactive customers to become active through:

  * reward programs
  * personalized offers
  * better customer engagement
* Investigate why customers with **3–4 products** are leaving:

  * possible dissatisfaction
  * complex banking services
  * hidden charges or poor experience
* Improve customer support and relationship management for high-risk segments

---

## 📌 Project Highlights

* Performed churn segmentation using SQL
* Used window functions to rank and identify churn-heavy groups
* Built insights that can support business decision-making

---
## 📂 Project Structure
```text
Bank-Customer-Churn-Analysis-SQL/
│── SQL/
│   └── bank_churn_analysis.sql
│── Report/
│   └── churn_analysis_report.pdf
│── Presentation/
│   └── churn_presentation.pptx
│── README.md
````

---


## 👤 Author

**Sofiyan**
MentorMind Menternship – Customer Churn Analytics for the Banking Industry
MentorMind (co-certified by UpGrad)

```
```
