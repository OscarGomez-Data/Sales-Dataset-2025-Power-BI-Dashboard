# Sales-Dataset-2025-Power-BI-Dashboard

## 📌 Overview
This project is about modeling a dataset with Sales’s information through MySQL to create a visual dashboard in Power BI and analyzing the results to find conclusions and recommendations for improvement.
-Main objective: Analyze information about sales from 2025 and review KPIs.

## 📂 Dataset
** Sales Dataset Description **:
- This dataset contains 250 records of sales transactions, including details about the customers, locations, sales, payment methods, and order statuses.

**Columns Description:**

**Table: Customer**

- Order_ID: Primary Key.  Unique identifier for each order (e.g., ORD0001).
- Customer_Name: Name of the customer.
- Customer_Location: City where the customer is based.
- Payment_Method: Mode of payment (Credit Card, Debit Card, PayPal, etc.).
- Status: Order status (Completed, Pending, or Cancelled).
  
**Table: Quantity_Information**

- Order_ID: Foreign Key.
- Price: Price of a single unit of the product.
- Quantity: Number of units purchased.
- Total Sales: Total revenue from the order (Price × Quantity).
  
**Table: Sale_Information**

- Order_ID: Foreign Key.
- Product: Name of the product purchased.
- Category: Product category (Electronics, Clothing, Home Appliances, etc.).
- Order_Date: Date of the order.

This dataset can be used for sales analysis, customer behavior insights, and revenue trends visualization. 

- **Source:** www.kaggle.com (public).
- **Processing:** Modeling in MySQL, connect data MySQL to Power BI, and create Visual Dashboard for Analysis. 

![ Access dataset]( https://www.kaggle.com/datasets/zahidmughal2343/amazon-sales-2025?resource=download)  


Opcion 2:
-**Access dataset:** [Download dataset](Sales+Data+ClassicModels.csv)  

##❓Main Questions

**In MySQL:**

1-Analyze the trend of monthly revenue and identify the top performing customer locations month-over-month?

2-Compute monthly revenue (Status = 'Completed') and the MoM % change per Customer Location.

3-Create a report per month with the following information:
- monthly_revenue = category revenues for that month.
- month_total_revenue = total revenue of the month (all categories).
- share_of_month = percentage that the category represents of the total for the month.
- prev_month_revenue = revenue from the previous month for that category.
- mom_growth_pct = month-over-month percentage growth for that category.
- running_ytd_revenue = Year-to-date total by category (January→current month).
- rank_in_month = Category ranking by revenue within the month.

**In Power BI:**

- Which areas generate the most revenue?
- Which product categories sell the most?
- How does income evolve over time?


## 🛠️ Methodology

**Tools used:** Excel, MySQL, and Power BI.
**Steps:**  

- Step 1: Review the dataset in the Excel file.
- Step 2: Cleaning the data.
- Step 3: Connect the dataset to MySQL Workbench.
- Step 4: Define schema, tables, and columns's names.
- Step 5: Define primary key and foreign keys.
- Step 6: Data Modeling: Assign data type to each table and column (int, varchar(), text, etc.)
- Step 7: Work on the database on MySQL to create a Views with the main information
  
View 1 — Revenue per Location. 

-Here you can reference the script SQL:  

[Ver script de extracción SQL](SQL_Data_Extraction.sql)

View 2 — Revenue per Category. 

-Here you can reference the script SQL:  

[Ver script de extracción SQL](SQL_Data_Extraction.sql)

View 3 — Revenue per Month. 

-Here you can reference the script SQL:  

[Ver script de extracción SQL](SQL_Data_Extraction.sql)

- Step 8: Connect the MySQL View Power BI.
- Step 9: Create an interactive dashboard on Power BI with graphs and main metrics.
- Step 10: Interpretation of results: exploration and visualization.

## 📊 Key Results
-**In MySQL and Excel**:
1. Question 1: Refer to SQL archive Q1 Trend Revenue and Top Customers.
2. Question 2: Refer to Q2 MoM% Change per Customer Location.
3. Question 3: Refer to Q3 Monthly Product Category KPIs.

-**On Power BI:** 
1. Refer to the visualization in Power BI for Revenue per Customer Location.

2. Refer to the visualization in Power BI for Revenue per Product Category.

3. Refer to the visualization in Power BI for Revenue per Month.

   
**Main Key Performance Indicators (KPIs):**

- Number of Orders.
- Average Order Value (AOV).
- MoM%.
- Revenue.
- Share_of_month.
- Mom_growth_pct
- Running_ytd_revenue.

## 📈 Visualization

-Here you can reference the dashboards:  

1. Visualization in Power BI for Revenue per Customer Location.
   
![Dashboard 1](https://github.com/OscarGomez-Data/Sales-Dataset-2025-Power-BI-Dashboard/blob/main/Dashboard_Revenue_per_Customer_Location.png)

2. Visualization in Power BI for Revenue per Product Category.
   
![Dashboard 2](https://github.com/OscarGomez-Data/Sales-Dataset-2025-Power-BI-Dashboard/blob/main/Dashboard_Revenue_per_Product_Category.png)  

3. Visualization in Power BI for Revenue per Month.
   
![Dashboard 2](https://github.com/OscarGomez-Data/Sales-Dataset-2025-Power-BI-Dashboard/blob/main/Dashboard_Revenue_per_Month.png)  


## ✅ Conclusions and Recommendations

## 📊 Conclusions

**Conclusions for Revenue per Customer Location and Revenue per Month:**

**1. Revenue concentration by location**

The analysis shows that Miami, Denver, and Houston generate the highest revenue, indicating that these locations represent the strongest markets in terms of sales performance.

**2. Lower performing locations**

Cities such as San Francisco, Los Angeles, and New York show comparatively lower revenue, suggesting potential opportunities for market growth or further investigation into local demand.

**3. Revenue trend over time**

Revenue remained relatively stable between February and March, while a noticeable drop appears in April. However, this decrease is due to incomplete data for that month, and therefore does not necessarily indicate a decline in business performance.


**Conclusions for Revenue per Product Category and Revenue per Month**

**1. Revenue concentration by product category**

The analysis shows that Electronics and Home Appliances generate the majority of total revenue, indicating that these categories are the primary drivers of sales performance.

**2. Low revenue contribution from other categories**

Categories such as Footwear, Clothing, and Books contribute a significantly smaller portion of total revenue, suggesting lower demand or fewer transactions in these product segments.

**3. Revenue imbalance across categories**

The distribution of revenue is highly concentrated in a small number of categories, indicating a strong dependence on specific product groups for overall sales performance.


## ✅ Recommendations
**Recommendations for Revenue per Customer Location and Revenue per Month:**

**1. Analyze high-performing locations**

Further analysis should be conducted on top-performing markets such as Miami, Denver, and Houston to understand the factors driving higher revenue, such as customer behavior, product mix, or promotional strategies.

**2. Investigate underperforming markets**

Locations with lower revenue should be analyzed to identify potential barriers to sales, such as lower demand, fewer customers, or different purchasing patterns.

**3. Continue monitoring revenue trends**

Tracking monthly revenue trends over time can help detect seasonal patterns, performance changes, and the impact of marketing or operational strategies.

**Recommendations for Revenue per Product Category and Revenue per Month**

**1. Strengthen high-performing categories**

Since Electronics and Home Appliances drive most of the revenue, the business should continue investing in these categories through product availability, promotions, and marketing strategies.

**2. Investigate low-performing categories**

Further analysis should be conducted on categories such as Footwear, Clothing, and Books to determine whether the lower revenue is due to reduced demand, pricing strategies, or limited product offerings.

**3. Diversify revenue sources**

To reduce reliance on a small number of categories, the business could explore strategies to increase sales in underperforming categories, such as targeted promotions, bundling strategies, or improved product visibility.









