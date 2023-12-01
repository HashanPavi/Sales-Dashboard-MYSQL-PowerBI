--overall view of  superstore sales dataset--
SELECT
COUNT(order_id)as Total_orders,
COUNT(DISTINCT country) as Total_countries,
COUNT(DISTINCT product_name)as Total_products,
COUNT(DISTINCT category) AS Total_categories,
COUNT(DISTINCT sub_category) AS Total_categories,
COUNT(DISTINCT year) AS Total_years,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity_sales,
AVG(profit) AS Avg_profit,
AVG(discount) AS Avg_discount
FROM dbo.[SuperStoreOrders Dataset]

--sales performence analysis--
SELECT TOP 10
product_name,
category,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity_sold
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY
product_name,
category
ORDER BY
SUM(sales) DESC
--sales over the year--
SELECT
year,
Sum(sales) AS Total_sales
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY year
ORDER BY SUM(sales) DESC

--customer segmentation--
SELECT
segment,
COUNT(DISTINCT customer_name)AS Total_customers,
SUM(sales)AS Total_sales
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY segment
ORDER BY SUM(sales) DESC

--Shipping and order management--
SELECT
ship_mode,
AVG(shipping_cost) AS Avg_shipping_cost,
AVG(profit)AS Avg_profit
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY ship_mode
ORDER BY Avg_profit

-- Time analysis--
SELECT
Ship_mode,
AVG(DATEDIFF(DAY,order_date,ship_date)) AS Avg_time_gape
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY ship_mode

--Profitability and cost analysis--
SELECT
product_name,
category,
sub_category,
AVG(profit) AS Avg_profit,
AVG(discount) AS Avg_discount
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY
product_name,
category,
sub_category
ORDER BY Avg_profit DESC

--Global sales and quantity product overview--
SELECT
country,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity
FROM dbo.[SuperStoreOrders Dataset]
 GROUP BY country
 ORDER BY Total_sales DESC

 --State level category exploration--


 SELECT
 product_name,
 category,
 SUM(quantity) AS Total_quantity_sold
 FROM dbo.[SuperStoreOrders Dataset]
 GROUP BY 
 product_name,
 category
 ORDER BY Total_quantity_sold DESC

 --Regional subcategory analysis--

 SELECT
 region,
 sub_category,
 SUM(quantity) AS Total_quantity_sold
 FROM dbo.[SuperStoreOrders Dataset]
 GROUP BY 
 region,
 sub_category
 ORDER BY Total_quantity_sold DESC


