# 📊 E-Commerce SQL Data Analysis Project

## 📌 Overview
This project focuses on analyzing an e-commerce dataset using SQL to uncover insights related to customer behavior, sales trends, delivery performance, payment preferences, and customer satisfaction.

The analysis was performed using structured queries, joins, aggregations, CTEs, and window functions to generate meaningful business insights.

---

## 🎯 Objectives
- Analyze customer purchasing behavior  
- Identify top-performing product categories  
- Evaluate delivery efficiency and delays  
- Understand payment method usage  
- Measure customer satisfaction through reviews  

---

## 🧹 Data Cleaning & Preparation
- Handled null values across multiple tables  
- Standardized inconsistent text fields (e.g., city names)  
- Checked for duplicates and inconsistencies  
- Created derived views (e.g., product category mapping)  
- Validated numeric fields (price, payment values)  

---

# 📊 Detailed Analysis

---

## 🔹 1. Customer Behavior & Spending Analysis

### 🎯 Objective  
Identify top customers based on total spending and analyze their category-wise purchasing behavior.

### 📊 Sample Output  

| Customer ID | Total Orders | Total Spending | Categories Purchased | Product Category           | Category Orders | Category Spending | Contribution (%) | Payment Method | Rank | Segment |
|------------|-------------|---------------|----------------------|----------------------------|-----------------|------------------|------------------|----------------|------|----------|
| 93bc212... | 1 | 18667 | 2 | informatica_acessorios | 6 | 11200 | 60.00% | boleto | 1 | High Value |
| 93bc212... | 1 | 18667 | 2 | unknown | 4 | 7467 | 40.00% | boleto | 1 | High Value |
| 906a8a4... | 2 | 11881 | 2 | utilidades_domesticas | 6 | 11832 | 99.59% | boleto | 3 | High Value |
| 906a8a4... | 2 | 11881 | 2 | agro_industria_e_comercio | 1 | 49 | 0.41% | boleto | 3 | High Value |
| fe2b2f7... | 1 | 11531 | 2 | moveis_decoracao | 6 | 6290 | 54.55% | credit_card | 5 | High Value |
| fe2b2f7... | 1 | 11531 | 2 | ferramentas_jardim | 5 | 5242 | 45.46% | credit_card | 5 | High Value |


## 🔹 2. Sales Analysis

### 🎯 Objective  
Analyze revenue trends over time to identify high-performing periods.

### 📊 Sample Output  

| Month     | Total Sales | Rank |
|----------|------------|------|
| May      | 1746900    | 1    |
| August   | 1696821    | 2    |
| July     | 1658923    | 3    |

### 💡 Key Insights
- Sales show clear monthly variation  
- Certain months consistently generate higher revenue  
- Seasonal trends are visible in sales performance  

---

## 🔹 3. Delivery Performance & Delay Analysis

### 🎯 Objective  
Evaluate delivery efficiency and identify delays affecting customer experience.

### 📊 Sample Output  

| product_category | delivery_status | total_orders |
|------------------|----------------|--------------|
| cama_mesa_banho  | Early          | 10033         |
| moveis_decoracao | On-Time        | 114         |
| beleza_saude     | Delayed        | 770          |

### 💡 Key Insights
- Most orders are delivered within expected timelines  
- A small percentage of orders experience extreme delays (>60 days)  
- Categories like furniture and automotive show higher delay risks  
- Delivery delays negatively impact customer satisfaction  

---

## 🔹 4. Payment Behavior Analysis

### 🎯 Objective  
Understand customer payment preferences and their contribution to revenue.

### 📊 Sample Output  

| payment_type | total_orders| Total_sales        | revenue_percentage  |
|--------------|-------------|--------------------|---------------------|
| credit_card  | 76795       | 12542084           | 78%                 |
| boleto       | 19784       | 2869361            | 18%                 |
| voucher      | 5775        | 379437             | 2%                  |
| debit_card   | 1529        | 217990             | 1%                  |


### 💡 Key Insights
- Credit card is the most preferred payment method  
- Majority of revenue is generated through a single dominant payment type  
- Installment usage increases with higher order value  

---

## 🔹 5. Customer Review & Satisfaction Analysis

### 🎯 Objective  
Evaluate customer satisfaction and identify factors influencing review scores.

### 📊 Sample Output  

| delivery_status | avg_rating | total_orders |
|----------------|-----------|--------------|
| Early          | 4.3       | 88658       |
| On-Time        | 2.5       | 6410         |
| Delayed        | 2.3       | 4156         |

### 💡 Key Insights
- Delivery performance has a direct impact on customer ratings  
- Delayed orders tend to receive lower review scores  
- Faster deliveries lead to higher customer satisfaction  

---

## 🔑 Final Insights
- A small group of customers drives a large portion of total revenue  
- Delivery efficiency plays a critical role in customer satisfaction  
- Certain product categories have logistical challenges leading to delays  
- Payment behavior reflects purchasing power and spending patterns  

---

## 🛠️ Tools & Skills Used
- SQL (PostgreSQL)  
- Joins (Inner, Left)  
- CTEs & Views  
- Window Functions (RANK, LAG)  
- Data Cleaning & Transformation  

---

## 📂 Dataset
- Brazilian E-commerce Dataset (Olist)

---

## 🚀 How to Run
1. Load dataset into PostgreSQL  
2. Execute SQL scripts from the `/sql` folder  
3. Use created views for simplified analysis  

---

## 📌 Conclusion
This project demonstrates how SQL can be used to perform end-to-end data analysis — from data cleaning to generating actionable business insights — by connecting multiple datasets and uncovering patterns that impact business decisions.
