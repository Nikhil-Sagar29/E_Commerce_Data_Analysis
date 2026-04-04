                                        Data Cleaning 
-----------------------------------------------------------------------------------------------
Objective
-------------------------------------------------------------------------------------------------                                         
1. Identify and handle null values across tables
2. Check for duplicates and inconsistencies
3. Standardize categorical data
4. Prepare dataset for accurate analysis

Logic
------------------------------------------------------------------------------------------------
1. Used COUNT() to detect null values
2. Used GROUP BY to find inconsistencies (city names)
3. Used HAVING COUNT(*) > 1 to detect duplicates
4. Used COALESCE() to replace null product categories

<Details>
--1. Customer Table
-- To check the Null values 
Select (count(*) - count(customer_id)) as Null_check from customers
Select (count(*) - count(customer_unique_id)) as Null_check from Customers

-- checking inconsistencies (Customer_city names)
Select Lower(customer_city), Count(*)
From customers
Group By Lower(customer_city)

-- Check any Duplicates
Select customer_id, COUNT(*)
From customers
Group By customer_id
Having Count(*) > 1

--2. Orders Table
--Checking NULLS in Purchase and Delivered Date
select count(*) from orders
where order_purchase_timestamp is NULL

select count(*) from orders
where order_delivered_customer_date is NULL

-- Status of Nulls in delivered Date
Select order_status, Count(*)
From orders
Where order_delivered_customer_date Is Null
Group By order_status

-- Classified them into Groups
Select order_id,
Case
When order_delivered_customer_date is NULL then 'Not Delivered'
else 'Delivered'
End As Status
from Orders

--3. Payments table
-- Check whether there are any null values, negative values or not
Select 
min(payment_value) as Minimum, 
Max (payment_value) as Maximum
from Payments

select payment_value, count(*)
from payments
where Payment_value is null
group by payment_value

--4. Order items table
-- check if price has negative numbers
select min(price), max(price) from order_items

--5. Products table
-- classifying the null to unknown
Create Or Replace View product_category As
Select 
    product_id,
    Coalesce(product_category_name, 'unknown') As product_category
From products

Select product_category, Count(*)
From product_category
Group By product_category
Order By Count(*) Desc
                                          
</Details>
                                          
Key Insights
-------------------------------------------------------------------------------------------------------------------                                          
1. Some product categories were missing - replaced with 'unknown'
2. Dataset is mostly clean with minimal null values
3. Few inconsistencies found in text fields (city names)
4. Product category required null handling
5. No major duplicate issues affecting analysis                                   

                                          
