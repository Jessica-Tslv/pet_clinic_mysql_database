# 🐾 Happy Paws Vet Clinic Database

A structured SQL database system designed for **Happy Paws Vet Clinic** — a fictional veterinary practice that needs to manage practitioners, clients, and animal appointments efficiently.  
This project was built as part of an SQL learning assignment and demonstrates database design, normalization, data manipulation, and query writing.

---

## 🧩 Project Overview

The goal of this project is to simulate a real-world veterinary clinic database that can:
- Store and organize information about **practitioners**, **owners**, **animals**, and **appointments**
- Demonstrate **SQL design principles** (normalization, keys, constraints)
- Execute practical **queries, joins, functions, and stored procedures**
- Automate processes such as **reminder generation** and **automatic next appointment scheduling**

---

## 🗃️ Database Structure

**Database Name:** `vet_clinic_db`

### Tables:
| Table | Description |
|-------|--------------|
| **Owners** | Stores client information (name, address, phone, email) |
| **Animals** | Contains animal details including species, weight, vaccination date, and follow-up status |
| **Practitioners** | Stores practitioner information such as name, contact details, job title, and hire date |
| **JobTitles** | Normalized table for practitioner job titles |
| **Appointments** | Records each appointment, linked to an animal and a practitioner, with the next due date and reason |

---

## 🧱 Relationships

- **Owners → Animals** (One-to-Many)  
- **Animals → Appointments** (One-to-Many)  
- **Practitioners → Appointments** (One-to-Many)  
- **JobTitles → Practitioners** (One-to-Many)

---

## ⚙️ Key Features

- **Normalization:** Job titles split into a separate table to reduce redundancy  
- **Constraints:** Use of `NOT NULL`, `DEFAULT`, and `FOREIGN KEY` constraints  
- **Data Types:** `INT`, `VARCHAR`, `FLOAT`, `BOOLEAN`, `DATE`  
- **Joins:** Both `INNER JOIN` and `LEFT JOIN` used in queries  
- **Aggregate Functions:** `COUNT()` and `AVG()`  
- **Built-in Functions:** `CONCAT()`, `DATEDIFF()`, `DATE_FORMAT()`, `LOWER()`  
- **Sorting and Filtering:** Extensive use of `ORDER BY`, `WHERE`, and `GROUP BY`

---

## 🔧 Automation

### 🩺 Stored Procedure: `ScheduleAppointment`
Automatically schedules a **next appointment one year later** if no follow-up is required.

```sql
CALL ScheduleAppointment(5, 2, '2025-06-15', FALSE);
