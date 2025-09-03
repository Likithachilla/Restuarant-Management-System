# 🍴 Restaurant Management System (MySQL 8+)

## 📖 Project Overview

This project presents a **Restaurant Management System** developed using **MySQL 8+**, aimed at handling everyday restaurant operations such as managing customer information, maintaining the menu, processing food orders, and tracking payments. It highlights practical SQL implementations like table creation, relationships with foreign keys, triggers, stored procedures, indexing for efficiency, and report generation through views.

---

## 🗄️ Database Structure

**Database:** `restaurant_db`

**Tables Included:**

* **Customers** – Maintains customer records and contact details
* **Menu** – Contains food items, categories, and prices
* **Orders** – Stores order information, dates, and totals
* **OrderItems** – Breaks down each order into individual menu items
* **Payments** – Records payment details such as mode, time, and amount

---

## 🛠️ Main Features

* Database setup and initialization with sample entries
* 50+ rows of sample data across all key tables
* Data integrity ensured using **constraints** and **foreign keys**
* **Triggers** automatically calculate item totals and order amounts
* **Stored procedure** (`RecalcOrderTotal`) keeps billing accurate
* **Indexes** added on important fields to speed up queries
* Payment records generated with realistic details
* 15 custom SQL **views** created for insights and reporting

---

## 📊 Reports (SQL Views)

* `vw_daily_revenue` – Shows daily income
* `vw_top_dishes` – Lists the most ordered menu items
* `vw_top_customers` – Identifies the highest spenders
* `vw_category_sales` – Breaks down sales by category
* `vw_payment_summary` – Summarizes payments by method
* `vw_order_details` – Complete order breakdown with customer + menu info
* `vw_customer_order_count` – Order count per customer
* `vw_customer_last_order` – Most recent order for each customer
* `vw_monthly_revenue` – Revenue report grouped by month
* `vw_unpaid_orders` – Orders with pending payments
* `vw_large_orders` – Orders exceeding 1000 in total
* `vw_dish_popularity_by_category` – Most popular items per category
* `vw_avg_order_value` – Average spending per order
* `vw_high_value_customers` – Customers who spent over 5000
* `vw_recent_orders` – Orders placed in the last 7 days

---

## 📌 Possible Applications

* Restaurants and cafés for day-to-day management
* Hotels offering food and accommodation services
* Academic or training projects for learning **SQL and database design**

---


