-- =========================================================
-- Project: Bank Customer Churn Analysis (SQL)
-- Dataset: Bank_Churn_Dataset.csv
-- Tool: MySQL
-- Author: Sofiyan
--
-- Description:
-- This project analyzes bank customer churn to identify
-- high-risk customer segments and key churn drivers using SQL.
-- The analysis focuses on geography, gender, age, activity,
-- products, and balance.
-- =========================================================


CREATE DATABASE Bank_Churn ;
USE Bank_Churn ;

-- create database
DROP TABLE IF EXISTS Customer_Details;
CREATE TABLE Customer_Details (
RowNumber INT ,
CustomerId INT PRIMARY KEY ,
Surname VARCHAR(150),
CreditScore INT ,
Geography VARCHAR(150),
Gender VARCHAR(50),
Age INT,
Tenure INT,
Balance DECIMAL(15,2),
NumOfProducts INT,
HasCrCard INT,
IsActiveMember INT,
EstimatedSalary DECIMAL(15,2),
Exited INT
) ;

-- Load data from CSV (secure-file-priv folder)
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Bank_Churn_Dataset.csv'
INTO TABLE Customer_Details
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT * FROM Customer_Details;

-- Q.1  Find the total number of customers in the table Customer_Details.
SELECT COUNT(Customerid) FROM Customer_Details ;
-- The dataset contains 10,000 customer records.

-- Q.2 Find how many customers exited and how many did not exit.
SELECT * FROM Customer_Details ;
SELECT EXITED,COUNT(*) AS Exited_customers From Customer_Details 
GROUP BY EXITED ;
-- Out of 10,000 customers, 2,037 customers exited and 7,963 customers stayed.
-- Q.3 Find the churn rate (Exited %) in percentage.
SELECT ROUND(100 * SUM(CASE WHEN EXITED = 1 THEN 1 ELSE 0 END ) / COUNT(*),2) AS Churn_Rate_Percent
FROM Customer_Details ;
-- Calculate churn rate (%) = exited customers / total customers * 100

-- Q.4 Find churn rate by Geography (France, Germany, Spain).
SELECT Geography,count(*)  AS Total_Customer,
SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exited_customers, 
ROUND(100 * SUM( CASE WHEN Exited = 1 THEN 1 ELSE 0 END ) / COUNT(*),2)  as churn_rate_percent 
FROM Customer_Details 
GROUP BY Geography
ORDER BY churn_rate_percent DESC ;
-- Germany has the highest churn rate (32.44%) compared to Spain (16.67%) and France (16.15%).
-- Q.5 Find churn rate by Gender (Male vs Female).
SELECT Gender,COUNT(*) AS Total_Customer ,
SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END ) AS Exited_Customers,
ROUND(100 * SUM( CASE WHEN Exited = 1 THEN 1 ELSE  0 END) / COUNT(*),2) AS Chrun_Rate_Percent 
FROM Customer_Details 
GROUP BY Gender 
ORDER BY Chrun_Rate_Percent  ;
-- Female customers have a higher churn rate (25.07%) compared to male customers (16.46%).
-- Q.6 Find churn rate by Active Membership (IsActiveMember).
SELECT * FROM Customer_Details;
SELECT IsActiveMember ,COUNT(*) AS Total_Customer,
SUM(CASE WHEN Exited = 1 THEN  1 ELSE 0 END ) AS Exited_Customer ,
SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exited_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / CAST(COUNT(*) AS DECIMAL(10,2)),2) AS churn_rate_percent
FROM Customer_Details 
GROUP BY IsActiveMember 
ORDER BY churn_rate_percent DESC;
-- Inactive members have a much higher churn rate (26.85%) compared to active members (14.27%).
-- Q.7 Find churn rate by Active Membership (IsActiveMember).
SELECT * FROM Customer_Details ;
SELECT NumOfProducts ,COUNT(*) AS Total_Customer,
SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exited_Customer,
ROUND(100 * SUM( CASE WHEN Exited = 1 THEN 1 ELSE  0 END) / COUNT(*),2) AS Chrun_Rate_Percent 
FROM  Customer_Details 
GROUP BY NumOfProducts 
ORDER BY Chrun_Rate_Percent DESC ;
-- Customers with 3 or 4 products have extremely high churn, while customers with 2 products have the lowest churn rate (7.58%)
-- Q.8 Find churn rate by Credit Score group.
SELECT * FROM Customer_Details;
SELECT  CASE 
		WHEN CreditScore < 500  THEN 'Low'
        WHEN Creditscore <= 650 THEN 'Medium'
        ELSE 'High'
        END AS CreditScore_Group,
        COUNT(*) AS Total_Customer, 
        SUM(CASE WHEN Exited  = 1 THEN 1 ELSE 0 END ) AS Exited_Customer 
        FROM  Customer_Details
        GROUP BY CreditScore_Group ;
-- I grouped customers into Low, Medium, and High credit score using CASE, then counted total and exited customers in each group
-- Q.9 Find churn by Age Group
SELECT 
CASE WHEN Age < 25 THEN 'Under 25 '
WHEN Age <= 34 THEN '25-34'
WHEN Age <= 44 THEN '34-44'
WHEN Age <= 54 THEN '44-54'
ELSE  Age > '55+'
END AS Age_Group
,COUNT(*) AS Total_Customer,
SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END ) AS Exited_Customer
FROM Customer_Details 
GROUP BY Age_Group ;
-- Q.10 Find churn by Balance type
SELECT * FROM customer_Details ;
SELECT 
CASE WHEN  Balance = 0 THEN 'Zero Balance'
ELSE  'None-Zero Balance'
END AS Balance_Type,
COUNT(*) AS Total_Count,
SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END ) AS Exited_Customer
FROM customer_Details 
GROUP BY Balance_Type ;
-- Customers with non-zero balance have higher churn (1537) compared to zero balance customers (500)
-- Q.11 Identify churned vs non-churned customers
SELECT * FROM Customer_Details ;
SELECT COUNT(*) AS Total_Customer,
CASE WHEN Exited = 1 THEN 'Churned' ELSE 'Not Churned' END AS churn_status
FROM Customer_Details
GROUP BY churn_status ;
-- This query segments customers into churned and non-churned based on Exited value and counts customers in each group
-- Q.12 Find top 3 / 5 / 10 customers
SELECT * FROM Customer_De ;
-- Top 10 highest balance customers
SELECT * FROM (
SELECT *, ROW_NUMBER() OVER(ORDER BY Balance DESC ) AS RN
FROM Customer_Details ) X
WHERE RN <= 10 ;
-- Top balance customers include both churned and non-churned. Losing high balance churned customers is a direct revenue loss
-- top 5 customers to offer reduced interest rate
SELECT *
FROM (
    SELECT
        CustomerId,
        Surname,
        Geography,
        Gender,
        Age,
        CreditScore,
        Balance,
        NumOfProducts,
        IsActiveMember,
        Exited,

        (
            CASE WHEN Geography = 'Germany' THEN 2 ELSE 0 END +
            CASE WHEN IsActiveMember = 0 THEN 2 ELSE 0 END +
            CASE WHEN Age BETWEEN 45 AND 54 THEN 2 ELSE 0 END +
            CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END +
            CASE WHEN NumOfProducts IN (3,4) THEN 3 ELSE 0 END
        ) AS risk_score,

        ROW_NUMBER() OVER (
            ORDER BY 
                (
                    CASE WHEN Geography = 'Germany' THEN 2 ELSE 0 END +
                    CASE WHEN IsActiveMember = 0 THEN 2 ELSE 0 END +
                    CASE WHEN Age BETWEEN 45 AND 54 THEN 2 ELSE 0 END +
                    CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END +
                    CASE WHEN NumOfProducts IN (3,4) THEN 3 ELSE 0 END
                ) DESC,
                Balance DESC
        ) AS rn

    FROM Customer_Details
    WHERE Exited = 0
) x
WHERE rn <= 5;
-- This will reduce churn among high-risk, high-value customers and protect bank revenue
 
