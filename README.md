# SQL Employee & Department Analysis Project

This project explores a relational database containing employee, department, and dependent data. It demonstrates a wide range of SQL techniques to extract insights, analyze relationships, and perform business-driven data operations using MS-SQL Server.

## 🧠 Project Overview

The database includes two main entities:
- **Employees**: Contains personal and job-related details such as salary, department, and manager relationships.
- **Departments**: Stores department names and location information.
- **Dependents**: Linked to employees, representing family members and relationships.

The project focuses on writing and optimizing SQL queries to answer real-world business questions related to staffing, compensation, and organizational structure.

## 🔍 Key SQL Queries

- **Location-Based Filtering**:
  - Find departments located at a specific location (e.g., location_id = 1700)
  - Retrieve employees working in those departments

- **Employee-Dependent Analysis**:
  - Identify employees with or without dependents
  - Synchronize last names between employees and their dependents

- **Salary Insights**:
  - Find employees with the highest salary
  - Compare salaries against department averages
  - Identify employees earning above or below average
  - Calculate salary differences from department averages

- **Department-Level Aggregations**:
  - Total, minimum, maximum, and average salary per department
  - Departments with employees earning above a threshold (e.g., > 10,000)
  - Departments with no high earners
  - Departments with headcount filters (e.g., > 5 or > 10 employees)

- **Advanced Filtering**:
  - Use of `INTERSECT`, `UNION`, and subqueries to compare datasets
  - CASE expressions to categorize salaries and work anniversaries

## 🛠 Technologies Used

- SQL / MS-SQL Server
- SSMS (SQL Server Management Studio)

---

This project showcases practical SQL skills for business analytics, including data modeling, query optimization, and relational integrity. Let me know if you'd like help organizing your files or adding GitHub badges!
