# Supermarket Sales Analysis Dashboard

## Project Overview

This project analyzes supermarket sales data using SQL and Power BI to understand overall business performance, product performance, customer behavior, branch performance, and operational sales patterns.

The project includes data preparation, SQL analysis covering 15 business questions, and a 3-page interactive Power BI dashboard.

## Tools Used

- SQL
- Power BI

## Dataset

The dataset contains 1,000 supermarket sales transactions and 17 columns covering:

- Invoice information
- Branch and city
- Customer type
- Gender
- Product line
- Unit price
- Quantity
- Tax
- Sales
- Date and time
- Payment method
- Cost of goods sold (COGS)
- Gross margin percentage
- Gross income
- Customer rating

## Data Cleaning & Preparation

The raw dataset was prepared before analysis to improve consistency and usability.

Key preparation steps included:

- Renamed column names using consistent `snake_case` naming.
- Standardized product-line names for consistent capitalization.
- Standardized payment-method names.
- Standardized date values into a consistent date format.
- Converted time values from 12-hour format to 24-hour format.
- Checked for missing values.
- Checked for duplicate records.

After preparation, the cleaned dataset retained all **1,000 transactions** and **17 columns**.

## Business Questions

### Overall Business Performance

1. What is the total sales revenue generated across all transactions?
2. What is the total gross income generated across all transactions?

### Product & Customer Analysis

3. How do product lines perform in terms of sales, volume, and gross income?
4. How does average customer rating differ across product lines?
5. How do total sales and average transaction value differ between Member and Normal customers?
6. What percentage of total revenue is contributed by Male vs Female customers?
7. How does product-line revenue differ between Member and Normal customers?
8. Which customer segment generates the most revenue when considering both gender and customer type?

### Branch & Store Performance

9. How do branches compare in revenue and customer satisfaction?
10. Does the difference between Member and Normal customers vary by branch?
11. What is the #1 product line within each branch?

### Time & Operations

12. How much sales revenue was generated each month?
13. Which days are busiest?
14. Which hours are busiest?
15. Which payment method is most popular, and which generates the most revenue?

## Power BI Dashboard

The Power BI dashboard consists of three pages designed for different areas of business analysis.

### 1. Executive Overview

The Executive Overview provides a high-level view of overall supermarket performance.

#### Key KPIs

- Total Revenue: **322.97K**
- Total Gross Income: **15.38K**
- Total Transactions: **1,000**
- Average Transaction Value: **322.97**
- Overall Rating: **6.97**

#### Visualizations

- Revenue by Product Line
- Revenue by Branch
- Revenue by Customer Type
- Monthly Revenue Trend

#### Filters

- Branch
- Customer Type
- Product Line
- Date Range

### 2. Customer Analysis

The Customer Analysis page focuses on customer segmentation, revenue contribution, and customer ratings.

#### Key KPIs

- Member Revenue: **189.69K**
- Normal Revenue: **133.27K**
- Member Average Transaction: **335.74**
- Normal Average Transaction: **306.37**

#### Visualizations

- Member vs Normal Revenue by Product Line
- Revenue by Gender
- Revenue by Gender & Customer Type
- Average Rating by Product Line

#### Filters

- Branch
- Gender
- Product Line
- Date Range

### 3. Operations

The Operations page focuses on transaction patterns, payment methods, and time-based sales activity.

#### Key KPIs

- Total Transactions: **1K**
- Average Transaction Value: **322.97**
- Average Quantity per Transaction: **5.51**
- Average Customer Rating: **6.97**

#### Visualizations

- Revenue by Payment Method
- Revenue & Transactions by Day
- Revenue by Hour
- Transactions by Payment Method

#### Filters

- Branch
- Payment
- Product Line
- Date Range

## Key Insights

- Total revenue was approximately **322.97K** across **1,000 transactions**.
- Member customers generated approximately **189.69K** in revenue compared with **133.27K** from Normal customers.
- Member customers had a higher average transaction value of **335.74**, compared with **306.37** for Normal customers.
- Female customers contributed approximately **60.28%** of total revenue, while Male customers contributed **39.72%**.
- **Food And Beverages** generated the highest product-line revenue at approximately **56.14K**.
- **Giza** had the highest branch revenue contribution at approximately **34.24%**.
- **Tuesday** had the highest number of transactions with **159 transactions**.
- The **19:00** hour recorded the highest hourly revenue at approximately **39.70K**.
- **E-wallet** had the highest transaction count with **345 transactions**, followed by Cash with **344** and Credit Card with **311**.
- The dashboard shows **January** with the highest monthly revenue at approximately **87K**.

## SQL Analysis

SQL was used to perform aggregations and comparisons across:

- Overall revenue and gross income
- Product-line performance
- Customer type
- Gender
- Branch performance
- Member vs Normal customer behavior
- Product-line performance within branches
- Monthly revenue
- Daily transaction activity
- Hourly sales activity
- Payment methods

The SQL queries used for the analysis are available in the `SQL` folder.

## Skills Demonstrated

- SQL querying
- Data cleaning and preparation
- Data aggregation
- Customer segmentation
- Sales analysis
- Product performance analysis
- Branch performance analysis
- Time-based analysis
- KPI development
- Data visualization
- Power BI dashboard development
- Business insights

## Project Structure

```text
supermarket-sales-analysis/
│
├── SQL/
│   └── supermarket_sales_analysis_sql_queries.sql
│
├── Dashboard/
│   ├── Executive_Overview.png
│   ├── Customer_Analysis.png
│   └── Operations.png
│
├── PowerBI/
│   └── Supermarket_Sales_Dashboard.pbix
│
└── Dataset/
    ├── Raw/
    │   └── SuperMarket Analysis.csv
    │
    └── Cleaned/
        └── SuperMarket Analysis Cleaned.csv
```
