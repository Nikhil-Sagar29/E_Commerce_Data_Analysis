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
| 2018	| 1            |	8699763	     |  7249747	           | 1450016	|  20.00    |
  2017	| 2	           |  7249747	     | 59362	             | 7190385	|  12112.77 |
  2016	|              |  59362	       |    0                |    	0	  |    0.00   |

2.  Monthly Sales
   | Month Name | Total Sales | Revenue Rank |
|------------------|----------------|--------------|
| May  | 1746900.97     | 1    |
| August | 1696821.64        | 2        |
| July     | 1658923.67        | 3         |












