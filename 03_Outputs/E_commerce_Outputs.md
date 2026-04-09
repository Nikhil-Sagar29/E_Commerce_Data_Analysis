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
|------------------|----------------|--------------|
| May  | 1746900.97     | 1    |
| August | 1696821.64        | 2        |
| July     | 1658923.67        | 3         |

## 4. Customer Analysis

1. Customer Spending & Category Distribution Analysis

| Customer rank | Customer ID | Total Orders | Total Spending | Categories Purchased | Product Category           | Category Orders | Category Spending | Contribution (%) | Payment Method | Rank | Segment |
|-----------------|------------|-------------|---------------|----------------------|----------------------------|-----------------|------------------|------------------|----------------|------|----------|
| 1 | 93bc212... | 1 | 18667 | 2 | informatica_acessorios | 6 | 11200 | 60.00% | boleto | 1 | High Value |
|   | 93bc212... | 1 | 18667 | 2 | unknown | 4 | 7467 | 40.00% | boleto | 1 | High Value |
| 2 | 906a8a4... | 2 | 11881 | 2 | utilidades_domesticas | 6 | 11832 | 99.59% | boleto | 3 | High Value |
|   | 906a8a4... | 2 | 11881 | 2 | agro_industria_e_comercio | 1 | 49 | 0.41% | boleto | 3 | High Value |
| 3  | fe2b2f7... | 1 | 11531 | 2 | moveis_decoracao | 6 | 6290 | 54.55% | credit_card | 5 | High Value |
|    | fe2b2f7... | 1 | 11531 | 2 | ferramentas_jardim | 5 | 5242 | 45.46% | credit_card | 5 | High Value |
| 4 | d687c16... | 1 | 9443 | 2 | informatica_acessorios | 6 | 11200 | 60.00% | boleto | 1 | High Value |
|   | d687c16... | 1 | 9443 | 2 | unknown | 4 | 7467 | 40.00% | boleto | 1 | High Value |
| 5 | efce1ab... | 2 | 11881 | 2 | utilidades_domesticas | 6 | 11832 | 99.59% | boleto | 3 | High Value |
|   | efce1ab... | 2 | 11881 | 2 | agro_industria_e_comercio | 1 | 49 | 0.41% | boleto | 3 | High Value |
|   | efce1ab... | 2 | 11531 | 2 | moveis_decoracao | 6 | 6290 | 54.55% | credit_card | 5 | High Value |
|    | fe2b2f7... | 1 | 11531 | 2 | ferramentas_jardim | 5 | 5242 | 45.46% | credit_card | 5 | High Value |





"d687c16dcf223790dd97278b2cdbe240"	1	9443	2	"cama_mesa_banho"	5	6745	71.43	"credit_card"	7	"Medium Value"
"d687c16dcf223790dd97278b2cdbe240"	1	9443	2	"market_place"	2	2698	28.57	"credit_card"	7	"Medium Value"
"efce1ab3e96ccab8b1b464326bd22417"	2	7972	3	"informatica_acessorios"	8	6282	78.80	"credit_card"	9	"Medium Value"
"efce1ab3e96ccab8b1b464326bd22417"	2	7972	3	"ferramentas_jardim"	2	1570	19.69	"credit_card"	9	"Medium Value"
"efce1ab3e96ccab8b1b464326bd22417"	2	7972	3	"papelaria"	1	119	1.49	"credit_card"	9	"Medium Value"
"d4336c36fbe83d4668606c4361932e1d"	1	4958	2	"moveis_escritorio"	4	2833	57.14	"credit_card"	18	"Low Value"
"d4336c36fbe83d4668606c4361932e1d"	1	4958	2	"esporte_lazer"	3	2125	42.86	"credit_card"	18	"Low Value"
"33176de67c05eeed870fd49f234387a0"	3	4869	2	"informatica_acessorios"	9	4291	88.13	"boleto"	20	"Low Value"
"33176de67c05eeed870fd49f234387a0"	3	4869	2	"sinalizacao_e_seguranca"	2	578	11.87	"boleto"	20	"Low Value"











