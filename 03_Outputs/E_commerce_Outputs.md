##  E-Commerce Analysis Outputs
-------------------------------------------------
##  1. Data Cleaning Results
1. Checked null values across all tables
2. No duplicate customer records found
3. Standardized city names using LOWER()
4. Replaced missing product categories with 'unknown'
5. Verified no negative values in price and payments

Sample Output:
| Column               |Null count |
|----------           |------------|
| order_delivered_date      | 2965    |

Insight:
Missing delivery dates are associated with non-delivered or canceled orders, not data errors.

## 2. Basic Metrics
1. Calculated total orders and total items sold
2. Identified top cities by order volume
3. Analyzed product category distribution

Sample Output:
Top Cities by Orders
| City              |Total Orders |
|----------           |------------|
|sao paulo            |  17808     |
 rio de janeiro       |  7837      |
 belo horizonte       |  3144     |
 brasilia             | 2392    |

Insight:
A few cities contribute a major portion of total orders, indicating regional demand concentration.

## 3.Sales Analysis
1. Analyzed monthly and yearly revenue trends
2. Identified peak-performing months
3. Calculated year-over-year growth

Sample Output:
1. Yearly Trend Analysis
   
| Years | Revenue Rank | Total_sales   | Previous year sales | Growth   | Growth %  |
|-------|--------------|---------------|---------------------|----------|-----------|
| 2018	 | 1            |	8699763	      |  7249747	           | 1450016 	|  20.00    |
  2017	 | 2	           |  7249747	     | 59362	              | 7190385	 |  12112.77 |
  2016	 | 3            |  59362	       |    0                |    	0	   |    0.00   |

2.  Monthly Sales
   
| Month Name | Total Sales | Revenue Rank |
|------------|-------------|--------------|
| May        | 1746900.97  | 1            |
| August     | 1696821.64  | 2            |
| July       | 1658923.67  | 3            |

## 4. Customer Analysis

1. Customer Spending & Category Distribution Analysis
   
   1. Identified top 50 customers based on total spending
   2. Analyzed category-wise spending distribution
   3. Segmented customers (High / Medium / Low value)

| SI.No | Customer ID | Total Orders | Total Spending | Categories Purchased | Product Category           | Category Orders | Category Spending | Contribution (%) | Payment Method | Rank | Segment |
|-----------------|------------|-------------|---------------|----------------------|----------------------------|-----------------|------------------|------------------|----------------|------|----------|
| 1 | 93bc212... | 1 | 18667 | 2 | informatica_acessorios     | 6 | 11200 | 60.00% | boleto | 1 | High Value |
|   | 93bc212... | 1 | 18667 | 2 | unknown                    | 4 | 7467 | 40.00% | boleto | 1 | High Value |
| 2 | 906a8a4... | 2 | 11881 | 2 | utilidades_domesticas      | 6 | 11832 | 99.59% | boleto | 3 | High Value |
|   | 906a8a4... | 2 | 11881 | 2 | agro_industria_e_comercio  | 1 | 49 | 0.41% | boleto | 3 | High Value |
| 3 | fe2b2f7... | 1 | 11531 | 2 | moveis_decoracao           | 6 | 6290 | 54.55% | credit_card | 5 | High Value |
|   | fe2b2f7... | 1 | 11531 | 2 | ferramentas_jardim         | 5 | 5242 | 45.46% | credit_card | 5 | High Value |
| 4 | d687c16... | 1 | 9443  | 2 | cama_mesa_banho            | 5 | 6745 | 71.43% | credit_card      | 7 | High Value |
|   | d687c16... | 1 | 9443  | 2 | market_place               | 2 | 2698 | 28.57% | credit_card      | 7 | High Value |
| 5 | efce1ab... | 2 | 7972  | 3 | informatica_acessorios     | 8 | 6282 | 78.80% | credit_card      | 9 | Medium Value |
|   | efce1ab... | 2 | 7972  | 3 | ferramentas_jardim         | 2 | 1570 | 19.69%  | credit_card      | 9 | Medium Value |
|   | efce1ab... | 2 | 7972  | 3 | papelaria                  | 1 | 119  | 1.49% | credit_card | 9 | Medium Value |
| 6 | d4336c3... | 1 | 4958  | 2 | moveis_escritorio          | 4 | 2833 | 57.14% | credit_card | 18 | low Value |
|   | d4336c3... | 1 | 4958  | 2 | esporte_lazer              | 3 | 2125 | 42.86% | credit_card | 18 | Low Value |

Insight:
A small group of customers contributes significantly to revenue, with spending concentrated in a few categories.

## 5. Order Delivery Performance & Delay Analysis

   1. Classified orders as Early, On-Time, or Delayed
   2. Calculated delivery time (carrier = customer)
   3. Identified extreme delays (>60 days)
   
Sample output
1. Delivery_classification

| Product_name | Delivery_status |Total_orders |
|--------------|-------------|--------------|
| cama_mesa_banho  | Delayed  | 770            |
| beleza_saude       | Delayed  | 717           |
| cama_mesa_banho  | Early  | 10033            |
| beleza_saude       | Early  | 8609           |
| cama_mesa_banho  | On-Time  | 150            |
| beleza_saude       | On-Time  | 141           |

2. Normal delivery analysis (<60 days)

| Product_Category| Avg_delivery_time | Max_Delivery_time |
|--------------|-------------|--------------|
| automotivo    | 9 | 60              |
| telefonia     | 9  | 60              |
| bebidas       | 7    | 60            |
| beleza_saude  | 9    | 60            |

3. Extreme delivery analysis (>60 days)

| Product_Category      | Avg_delivery_time | Max_Delivery_time |
|-----------------------|-------------------|-------------------|
| cool_stuff            | 11                | 205               |
| automotivo            | 16                | 195               |
| instrumentos_musicais | 1                 | 194               |
| moveis_escritorio     | 8                 | 190               |

Insight:
Certain product categories show higher delivery delays, indicating logistics challenges.

## 6.Payment Analysis

   1. Analyzed payment method usage
   2. Calculated revenue contribution by payment type
   3. Studied installment behavior

 Sample output
 1. Revenue Contribution

| Payment_type          |   Total_sales     | Revenue_percentage |
|-----------------------|-------------------|-------------------|
| Credit_card           | 12542084          | 78               |
| Boleto                | 2869361           | 18               |
| Voucher               | 379437            | 2                |
| Debit_card            | 217990            | 1               |

2. Installment behavior

| Product_category | Payment_installment | Total_orders   | Average_order_value |
|------------------|--------------|---------------|---------------------|
| automotivo     	 | 24            |	3	      |  488	           | 
  beleza_saude	    | 24           |  2	     | 855	              | 
  casa_conforto	   | 24            |  1	       |    630                |   
  cool_stuff   	   | 24            |  1	       |    263                |   

Insight:
Certain product categories show higher delivery delays, indicating logistics challenges.

## 7. Customer Review & Satisfaction Analysis

1. Calculated average customer ratings
2. Analyzed impact of delivery performance on reviews
3. Compared category-wise ratings

Sample output 
 1. Delivery impact on ratings

| Delivery_score          |   Average_review_score     | Total_orders |
|-----------------------|-------------------|-------------------|
| Early                 | 4.3         | 88658               |
| Delayed               | 2.3           | 6410               |
| On-time               | 2.5            | 4156                |

2. Category wise Rating

| Product_category          |   Average_review_score     | Total_orders     |
|---------------------------|----------------------------|------------------|
| seguros_e_servicos        | 2.5                   | 2               |
| fraldas_higiene           | 3.3                    | 39               |
| pc_gamer                  | 3.3                     | 9                |
| telefonia                 | 3.9                     | 4517                |
| moveis_decoracao        | 3.9                   | 8331               |
| cama_mesa_banho           | 3.9                    | 11137               |
| livros_importados         | 4.4                     | 60                |
| fashion_roupa_infanto_juvenil | 4.5                     | 8                |
| cds_dvds_musicais             | 4.6                     | 14                |

Insight:
Delivery delays significantly reduce customer satisfaction, directly impacting ratings.

Final Insights:
1. Customer behavior, delivery performance, and payment preferences strongly influence business outcomes
2. A small percentage of customers and categories drive majority revenue
3. Delivery efficiency plays a critical role in customer satisfaction





















