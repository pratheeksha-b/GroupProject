create database retail;
use retail;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/OnlineRetail_cleaned.csv'
INTO TABLE mytable
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
-- Total rows
select count(*) from mytable;
-- table displayed
select * from mytable;
-- Total sales
select round(sum(TotalPrice),2) as Total_Sales from mytable;
-- total quantity sold
select sum(Quantity) as Total_Quantity from mytable
-- total customers 
select count(distinct(CustomerID)) as Total_Customers from mytable;
-- Revenue generated from each Product
select StockCode,Description,sum(Quantity*UnitPrice) as total_revenue from mytable
group by StockCode,Description
order by total_revenue desc;
-- Quantity sold for each Product 
select StockCode,Description,sum(Quantity) as Total_quantity from mytable
group by StockCode,Description
order by Total_quantity desc;
-- Average Unit Price of each Product 
select StockCode,Description,avg(UnitPrice) as Avg_UnitPrice from mytable
group by StockCode,Description
order by Avg_UnitPrice desc;
-- Average Unit Price and Quantity sold
select StockCode,Description,avg(UnitPrice) as Avg_UnitPrice,sum(Quantity) as Total_Quantity from mytable
group by StockCode,Description
order by Avg_UnitPrice desc;
-- How many unique products each invoice contains
select InvoiceNo,count(distinct(StockCode)) as Total_count from mytable
group by InvoiceNo
order by Total_count desc;
-- frequently bought products together
select a.Description as Description1,b.Description as Description2, count(*) as total_count from mytable a
join mytable b on a.InvoiceNo=b.InvoiceNo and a.Description<b.Description 
group by a.Description,b.Description
order by total_count desc limit 1;
-- Products with highest price variation
select StockCode,Description,min(UnitPrice) as min_price,max(UnitPrice) as max_price,(max(UnitPrice)-min(UnitPrice)) as Price_variation from mytable
group by StockCode,Description
order by Price_variation desc limit 10;
-- Top 10 most sold products by quantity
select StockCode,Description,sum(Quantity) as Total_quantity from mytable
group by StockCode,Description
order by Total_quantity desc limit 10;
-- Top 10 Products by total revenue
select StockCode,Description,sum(TotalPrice) as Total_revenue from mytable
group by StockCode,Description
order by Total_revenue desc limit 10;
-- top 10 most sold products on weekends
select StockCode,Description,dayofweek(InvoiceDate) as week,sum(TotalPrice) as Total_revenue from mytable
where dayofweek(InvoiceDate) in (1,6)
group by StockCode,Description,dayofweek(InvoiceDate)
order by Total_revenue desc limit 10 ;
-- top 10 most sold products on weekdays
select StockCode,Description,dayofweek(InvoiceDate) as week,sum(TotalPrice) as Total_revenue from mytable
where dayofweek(InvoiceDate) in (2,3,4,5)
group by StockCode,Description,dayofweek(InvoiceDate)
order by Total_revenue desc limit 10 ;
-- Monthly top 10 Products sold (By total revenue)
with top_sold_per_month as(select StockCode,Description, extract(month from InvoiceDate) as Month,sum(TotalPrice) as Total_Revenue, dense_rank() over (partition by extract(month from InvoiceDate) order by sum(TotalPrice) desc) as ranked from mytable
group by StockCode,Description, extract(month from InvoiceDate)
order by Month asc)
select * from top_sold_per_month
where ranked<=10;
-- Top 10 frequently purchased Products 
select StockCode,Description,count(InvoiceNo) as total_count from mytable 
group by StockCode,Description
having count(InvoiceNo)>1
order by total_count desc limit 10;
-- Product with low sales but high price (Overstock Risk)
select StockCode,Description,sum(Quantity) as total_quantity, avg(UnitPrice) as AvgPrice from mytable
group by StockCode,Description
having total_quantity<50 and AvgPrice>20
order by AvgPrice desc;
-- Customer who spent the highest 
select CustomerID,sum(TotalPrice) Total_revenue from mytable 
group by CustomerID
order by Total_revenue desc limit 1;
-- Customers who purchsed most unique products
select CustomerID,count(distinct(StockCode)) as total_count from mytable
group by CustomerID
order by total_count desc limit 10;
-- Countries which generate the highest revenue
select Country,round(sum(TotalPrice),2) as total_price from mytable
group by Country
order by total_price desc;
-- top most frequently purchased product for each customer
with top_products as (select CustomerID,StockCode,Description, count(*) as  total_count,dense_rank() over (partition by CustomerID order by count(*) desc) as top_items_bought from mytable
group by CustomerID,StockCode,Description
order by CustomerID asc)
select * from top_products
where top_items_bought=1 and total_count!=1;
-- Total Spending by Hour 
select extract(hour from InvoiceDate) as Hour, sum(Quantity) as Total_Quantity from mytable
group by hour
order by Total_Quantity desc;
-- Top Revenue-Generating Products
select StockCode,sum(TotalPrice) as Total_Revenue, round(100*sum(TotalPrice)/(select sum(TotalPrice) from mytable),2) as Percentage_Contribution from mytable
group by StockCode
order by Total_Revenue desc;
-- What products and how many units were sold in each order
select InvoiceNo,StockCode,sum(Quantity) as total_quantity from mytable
group by InvoiceNo,StockCode
order by InvoiceNo desc;
-- total revenue per invoice
select InvoiceNo,sum(TotalPrice) as Total_revenue from mytable
group by InvoiceNo
order by Total_revenue desc limit 10;
-- spending by customer in the year 2010,2011
with yearly_spending as(select CustomerID,extract(year from InvoiceDate) as year, sum(TotalPrice) as total_spending from mytable
group by CustomerID,extract(year from InvoiceDate)),
compare as(select a.CustomerID,a.total_spending as spending_2011,b.total_spending as spending_2010 from yearly_spending a join yearly_spending b
on a.CustomerID=b.CustomerID and a.year=b.year+1)
select CustomerID,spending_2010,spending_2011 from compare 
where spending_2010>spending_2011;











