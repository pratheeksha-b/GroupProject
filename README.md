# README — Data Wrangling / Data Cleaning in Python
### Online Retail Dataset — Group Internship Project

## 1. Role Overview — Data Wrangler
As the Data Wrangler, my responsibility is to prepare a clean, analysis-ready dataset for the rest of the team. This includes identifying data quality issues, fixing inconsistencies, and exporting a final curated dataset.

## 2. Dataset Description
The Online Retail dataset contains real transactional data from a UK-based online retailer. Common issues include missing values, duplicates, negative quantities, canceled invoices, and inconsistent text.

***Key columns include:***

- InvoiceNo
- StockCode
- Description
- Quantity
- InvoiceDate
- UnitPrice
- CustomerID
- Country

***Common issues in this dataset:***

- Missing values
- Duplicate rows
- Negative quantities (returns)
- Canceled invoices
- Incorrect pricing
- Text inconsistencies
- Wrong data types

## 3. Objectives of Data Cleaning
- Remove invalid and duplicate records  
- Fix missing essential fields  
- Correct data types  
- Create derived features such as TotalPrice  
- Deliver a dataset ready for analytics and modeling  

## 4. Cleaning Steps Performed
1. Imported libraries  
2. Loaded dataset  
3. Initial exploration  
4. Removed duplicates  
5. Handled missing values  
6. Removed cancellation invoices  
7. Removed invalid quantities and prices  
8. Cleaned text  
9. Converted data types  
10. Created TotalPrice column  
11. Exported cleaned dataset  

## 5. Tools Used
- Python  
- Pandas  
- NumPy  
- Jupyter Notebook  

## 6. Project Deliverables from Data Wrangler
## Jupyter Notebook

**Data_Wrangling_Market_Basket_Analysis_Online_Retail.ipynb**

***Includes:***
- Step-by-step cleaning
- Before/after checks
- Explanations in markdown

**Cleaned Dataset**
OnlineRetail_cleaned.csv

**README.md (this file)**

## 7. How to Run This Notebook

**Install dependencies**
```python
pip install pandas numpy

Place OnlineRetail.csv in the notebook directory.

Open Jupyter Notebook

Run all cells in
Data_Wrangling_Market_Basket_Analysis_Online_Retail.ipynb

## 8. How to Run This Notebook

### For any questions regarding the cleaned dataset:

Name: Santosh Kumar
Role: Data Wrangler  
Message me in group chat