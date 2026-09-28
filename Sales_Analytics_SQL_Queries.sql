CREATE DATABASE sales_analytics;
USE sales_analytics;

CREATE TABLE sales_data (
    `index` INT,
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Customer VARCHAR(100),
    Product VARCHAR(100),
    Category VARCHAR(100),
    Region VARCHAR(50),
    Quantity INT,
    Unit_Price DECIMAL(12,2),
    Sales DECIMAL(12,2),
    Cost DECIMAL(12,2),
    Profit DECIMAL(12,2)
);
ALTER TABLE sales_data
DROP COLUMN `index`;
USE sales_analytics;

SELECT COUNT(*) AS total_rows
FROM sales_data;
DESCRIBE sales_data;
SELECT Order_ID, COUNT(*) AS order_count
FROM sales_data
GROUP BY Order_ID
HAVING COUNT(*) > 1;
SELECT
    SUM(Order_ID IS NULL) AS Missing_Order_ID,
    SUM(Order_Date IS NULL) AS Missing_Order_Date,
    SUM(Customer IS NULL) AS Missing_Customer,
    SUM(Product IS NULL) AS Missing_Product,
    SUM(Category IS NULL) AS Missing_Category,
    SUM(Region IS NULL) AS Missing_Region,
    SUM(Quantity IS NULL) AS Missing_Quantity,
    SUM(Unit_Price IS NULL) AS Missing_Unit_Price,
    SUM(Sales IS NULL) AS Missing_Sales,
    SUM(Cost IS NULL) AS Missing_Cost,
    SUM(Profit IS NULL) AS Missing_Profit
FROM sales_data;
SELECT
    COUNT(*) AS total_rows,
    SUM(Quantity * Unit_Price) AS calculated_sales,
    SUM(Sales) AS stored_sales
FROM sales_data;
SELECT
    SUM(Sales - Cost) AS calculated_profit,
    SUM(Profit) AS stored_profit
FROM sales_data;
SELECT SUM(Sales) AS Total_Sales
FROM sales_data;
SELECT SUM(Profit) AS Total_Profit
FROM sales_data;
SELECT
    SUM(Profit) / SUM(Sales) * 100 AS Profit_Margin_Percent
FROM sales_data;
SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT
    Customer,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Customer
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    Product,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Month;
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Month;
SELECT
    SUM(Sales) / COUNT(DISTINCT Order_ID) AS Average_Order_Value
FROM sales_data;
SELECT
    COUNT(*) AS Duplicate_Order_Groups
FROM (
    SELECT Order_ID
    FROM sales_data
    GROUP BY Order_ID
    HAVING COUNT(*) > 1
) AS duplicates;
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Region
ORDER BY Total_Profit DESC;
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM sales_data
GROUP BY Region
ORDER BY Profit_Margin_Percent DESC;
SELECT
    Product,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM sales_data
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 10;
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
        SUM(Sales) AS Total_Sales
    FROM sales_data
    GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
)
SELECT
    Month,
    Total_Sales,
    LAG(Total_Sales) OVER (ORDER BY Month) AS Previous_Month_Sales,
    ROUND(
        (Total_Sales - LAG(Total_Sales) OVER (ORDER BY Month))
        / LAG(Total_Sales) OVER (ORDER BY Month) * 100,
        2
    ) AS MoM_Growth_Percent
FROM monthly_sales
ORDER BY Month;
WITH region_sales AS (
    SELECT
        Region,
        SUM(Sales) AS Total_Sales
    FROM sales_data
    GROUP BY Region
)
SELECT *
FROM region_sales
ORDER BY Total_Sales DESC;
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM sales_data
GROUP BY Region;
WITH region_sales AS (
    SELECT
        Region,
        SUM(Sales) AS Total_Sales
    FROM sales_data
    GROUP BY Region
)
SELECT
    Region,
    Total_Sales,
    ROW_NUMBER() OVER (ORDER BY Total_Sales DESC) AS row_num
FROM region_sales;
WITH product_sales AS (
    SELECT
        Category,
        Product,
        SUM(Sales) AS Total_Sales
    FROM sales_data
    GROUP BY Category, Product
)
SELECT
    Category,
    Product,
    Total_Sales,
    ROW_NUMBER() OVER (
        PARTITION BY Category
        ORDER BY Total_Sales DESC
    ) AS row_num
FROM product_sales;
WITH product_sales AS (
    SELECT
        Category,
        Product,
        SUM(Sales) AS Total_Sales
    FROM sales_data
    GROUP BY Category, Product
),
ranked_products AS (
    SELECT
        Category,
        Product,
        Total_Sales,
        ROW_NUMBER() OVER (
            PARTITION BY Category
            ORDER BY Total_Sales DESC
        ) AS row_num
    FROM product_sales
)
SELECT
    Category,
    Product,
    Total_Sales
FROM ranked_products
WHERE row_num = 1;
WITH product_sales AS (
    SELECT
        Category,
        Product,
        SUM(Sales) AS Total_Sales
    FROM sales_data
    GROUP BY Category, Product
)
SELECT
    Category,
    Product,
    Total_Sales,
    RANK() OVER (
        PARTITION BY Category
        ORDER BY Total_Sales DESC
    ) AS sales_rank
FROM product_sales;
WITH product_sales AS (
    SELECT
        Category,
        Product,
        SUM(Sales) AS Total_Sales
    FROM sales_data
    GROUP BY Category, Product
),
ranked_products AS (
    SELECT
        Category,
        Product,
        Total_Sales,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY Total_Sales DESC
        ) AS sales_rank
    FROM product_sales
)
SELECT
    Category,
    Product,
    Total_Sales,
    sales_rank
FROM ranked_products
WHERE sales_rank <= 3
ORDER BY Category, sales_rank;
SELECT
    Product,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM sales_data
GROUP BY Product
ORDER BY Profit_Margin_Percent ASC;
SELECT
    Product,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM sales_data
GROUP BY Product
HAVING SUM(Sales) > 2000000
   AND SUM(Profit) / SUM(Sales) * 100 < 30
ORDER BY Total_Sales DESC;
SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID), 2) AS Average_Order_Value
FROM sales_data;