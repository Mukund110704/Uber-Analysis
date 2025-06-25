# Uber Booking Data Analysis (SQL + Power BI)

This project analyzes Uber ride bookings in Delhi for the month of June 2025 using structured SQL queries and dynamic Power BI visualizations. It focuses on demand trends, revenue performance, customer satisfaction, and operational bottlenecks.

---

## Overview

A dataset of 70,000 bookings was used to simulate realistic ride patterns across vehicle types, payment methods, time of day, and booking outcomes. SQL was used to extract business-critical insights, and Power BI was used to build an interactive dashboard for executive-level reporting.

---

## Objectives

- Understand daily and weekly ride demand patterns
- Identify the most used and most profitable vehicle types
- Analyze booking success and cancellation reasons
- Compare customer and driver experience ratings
- Evaluate payment preferences and revenue distribution
- Highlight top-performing customers and profitable routes

---

## Key Highlights

- 70,000 total bookings from June 1–30, 2025
- 62% of all bookings were successfully completed
- 7% cancelled by customers, 18% cancelled by drivers, 13% incomplete rides
- 43,399 successful rides generated ₹6.39 million in revenue
- Prime SUV and Prime Sedan had the highest average booking values
- eBike and Bike had the shortest average ride distances
- Average driver rating: 4.21 | Average customer rating: 4.09
- Cash and UPI together made up over 85% of all payments
- Top 5 customers contributed ₹16,967+ in booking value
- Most common cancellation reason by drivers: Personal & Car related issues
- Most common cancellation reason by customers: Driver asked to cancel

---

## Tech Stack

- SQL (MySQL-style queries)
- Power BI Desktop
- GitHub for version control and project documentation

---

## Power BI Dashboard Summary

The Power BI dashboard includes several visualizations, but the following had the most impact:

### 1. Ride Volume Over Time  
Revealed peaks in bookings on weekends and match days, guiding potential surge pricing or driver allocation.

### 2. Booking Status Breakdown  
Clearly highlighted the proportion of successful, cancelled, and incomplete rides — a direct metric of operational performance.

### 3. Payment Preferences by Vehicle Type  
Showed how payment methods varied by vehicle category, enabling targeted incentives for customer segments.

### 4. Customer vs Driver Ratings  
Helped benchmark service quality expectations across vehicle types.

---

## SQL Query Summary

A total of 15 SQL queries were written to generate KPIs and breakdowns for analysis, covering:

- Successful booking extraction
- Grouped metrics by date, vehicle type, payment method
- Cancellation reasons (customer vs driver)
- Top 5 customer identification by booking value
- Pickup-drop route analysis for revenue concentration
- Time-based slot analysis for VTAT and CTAT performance


