Customer Payment Behavior Analysis
---------------------------------------------------------------------------------------------------------------------------
Objective
--------------------------------------------------------------------------------------------------------------------------- 
1. Understand payment preferences
2. Analyze revenue contribution by payment type
3. Study installment behavior

Logic
---------------------------------------------------------------------------------------------------------------------------  
1. Aggregated:
      Payment count
      Total revenue
      Calculated % contribution using window functions
      Joined with product category for installment analysis

<Details>

-- Payment method Usage
Select 
	Payment_type, 
	count(Distinct order_id) as Total_payments
from payments
group by payment_type
order by total_payments desc

-- Revenue Contribution
Select 
	Payment_type, 
	Round(sum(payment_value),0) as Total_sales, 
	Round( Sum(Payment_value) * 100.0 / sum(sum(payment_value)) over(), 0 ) as Revenue_percentage
from payments 
Group by payment_type 
order by Total_sales desc

-- Installment behavior
Select 
	pt.product_Category, 
	p.Payment_installments,
	count(*) as Total_orders,
	Round(Avg(p.Payment_value),0) as Average_order_value
from Payments p
join order_items oi
on p.order_id = oi.order_id
join Product_category pt
on oi.product_id = pt.product_id
group by pt.product_category, p.payment_installments
order by payment_installments desc

</Details>

Key Insights
---------------------------------------------------------------------------------------------------------------------- 
1. Credit cards dominate transactions
2. Few payment methods contribute majority revenue
3. Higher installments linked with high-value purchases
4. Certain categories use more installments

