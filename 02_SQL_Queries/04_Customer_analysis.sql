Customer Behavior & Segmentation Analysis
---------------------------------------------------------------------------------------------------------------------------
Objective
---------------------------------------------------------------------------------------------------------------------------  
1. Identify top customers
2. Analyze spending patterns
3. Understand category preferences
4. Segment customers by value

Logic
-----------------------------------------------------------------------------------------------------------------------------  
1. Aggregated payments at order level first 
2. Calculated:
    Total orders per customer
    Total spending
    Category-level breakdown:
    Category orders
    Category spending
    % contribution
3. Used:
    RANK() → Top 50 customers
    CASE → segmentation

<Details>
-- Top Customer Spending & Category Distribution Analysis
Create view Customer_Analysis as 
With payments AS (
    Select 
        order_id,
        Sum(payment_value) As payment_value,
        Max(payment_type) As payment_type
    From payments
    Group By order_id
),

Main_data As (
    Select 
        c.customer_unique_id,
        o.order_id,
        pt.product_category,
        pc.payment_value,
        pc.payment_type
    From orders o
    Join customers c 
        on o.customer_id = c.customer_id
    Join order_items oi
        on o.order_id = oi.order_id
    Join product_category pt
        on oi.product_id = pt.product_id
    Join payments pc
        on o.order_id = pc.order_id
),
-- Customer total 
customer_total As (
    Select 
        customer_unique_id,
        Count(Distinct order_id) As total_orders,
        Round(Sum(payment_value),0) As total_spending
    From main_data
    Group By customer_unique_id
),

-- Category level
category_data As (
   Select 
    customer_unique_id,
    product_category,
	payment_type,
	Count(order_id) As category_orders,
	Round(Sum(payment_value),0) As category_spending
    From Main_data
    Group By 
      customer_unique_id,
      product_category,
      payment_type
),

-- Number of categories per customer
category_count As (
    Select 
        customer_unique_id,
        Count(Distinct product_category) As total_categories
    From main_data
    Group By customer_unique_id
),

-- Combine all
final_data As (
  Select 
    cd.customer_unique_id,
	ct.total_orders,
    ct.total_spending,
    cc.total_categories,
    cd.product_category,
    cd.category_orders,
    cd.category_spending,
    ROUND(cd.category_spending * 100.0 / ct.total_spending,2) As category_percentage,
    cd.payment_type
  From category_data cd
  Join customer_total ct 
     On cd.customer_unique_id = ct.customer_unique_id
  Join category_count cc
     On cd.customer_unique_id = cc.customer_unique_id
    Where cc.total_categories >= 2   -- filter meaningful customers
),

-- Add ranking + segmentation
ranked as (
   Select *,
     Rank() Over (Order By total_spending Desc) As customer_rank,
      Case 
       When total_spending >= 10000 Then 'High Value'
       When total_spending >= 5000 Then 'Medium Value'
       Else 'Low Value'
    End As customer_segment
    From final_data
)

-- Final Records
Select *
From ranked
Where customer_rank <= 50
Order By customer_rank, customer_unique_id, category_spending Desc

--- easy Access for this Query
select * from customer_analysis

</details>

Key Insights
--------------------------------------------------------------------------------------------------------  
1. High-value customers contribute major revenue
2. Customers purchase across multiple categories
3. Some categories dominate customer spending
4. Payment method preference varies per customer
