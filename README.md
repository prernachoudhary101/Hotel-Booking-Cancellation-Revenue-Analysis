# Hotel Booking Cancellation – Revenue Leakage Analysis

## 🔍 Problem Statement
Hotel booking cancellations cause significant revenue loss. This project analyzes the Hotel Booking Demand Dataset to quantify cancellation drivers and estimate revenue leakage.

## 📦 Dataset
- Source: https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand
- Records: ~119,390 bookings
- Description: Contains hotel bookings with cancellation status and booking details.

## 🛠 Tools Used
- **SQL (MySQL)** – for data queries
- **Power BI** – dashboard visualization
- **Excel** – data exploration

## 📁 Folder Structure
📁 data
┣ dataset_source.txt
📁 sql
┣ sql_analysis_queries.sql
📁 powerbi
┣ dashboard_screenshot_1.png
┣ dashboard_screenshot_2.png
README.md

## 📈 Key Insights
- Overall cancellation rate: **37%**
- Long lead-time bookings are more likely to cancel
- Certain customer types show higher cancellations
- Estimated revenue loss due to cancellations: **$16.7M**

## 🧠 Business Recommendations
- Partial prepayment for long lead-time bookings
- Tighter free cancellation windows during peak season
- Target marketing campaigns for high-risk segments

## 📊 Screenshots
### Dashboard overview
![Dashboard overview](powerbi/dashboard_screenshot_1.png)

### Trend & Customer Segmentation
![Trend & Customer Segmentation](powerbi/dashboard_screenshot_2.png)

## 📌 How to Reproduce
1. Download dataset from Kaggle
2. Load into MySQL or Power BI
3. Run SQL queries from `sql_analysis_queries.sql`
4. Load dataset into Power BI and recreate visuals

## 🗂 SQL Queries
All SQL analysis queries are in `sql/sql_analysis_queries.sql`

