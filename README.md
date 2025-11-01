# 🧮 Procedures and Functions in PL/SQL

This repository contains a complete set of **PL/SQL programs** demonstrating the use of **stored procedures, functions, local procedures/functions, and recursion** in Oracle SQL.  
All solutions are tested and verified with proper output blocks.

---

## 📘 Overview

This project covers **10 practical PL/SQL questions** focusing on procedural programming concepts in SQL.  
It includes table creation, parameterized procedures, recursive functions, and database updates using Oracle PL/SQL.

---

## 📋 Topics Covered

| # | Concept | Description |
|---|----------|-------------|
| 1 | Stored Procedure | Calculate total salary (bp + da + hra) and update employee record |
| 2 | Local Function | Compute factorial of a number |
| 3 | Stored Procedure | Check whether a number is positive, negative, or zero |
| 4 | Stored Function | Find sum of numbers from 1 to n |
| 5 | Local Procedure | Compute the average of numbers between two given ranges |
| 6 | Recursive Procedure | Display “Hello World” ten times |
| 7 | Stored Procedure | Calculate total marks of a student |
| 8 | Local Function | Calculate average marks using procedure from Q7 |
| 9 | Stored Function | Return the highest marks among three subjects |
| 10 | Local Procedure | Display individual marks and total marks for a student |

---

## 🧱 Database Tables Used

### 1. Employee Table (`emp`)
```sql
CREATE TABLE emp (
  eno NUMBER PRIMARY KEY,
  ename VARCHAR2(50),
  bp NUMBER,
  da NUMBER,
  hra NUMBER,
  total NUMBER
);

2. Student Table (student)
CREATE TABLE student (
  rollno NUMBER PRIMARY KEY,
  name VARCHAR2(30),
  sub_id NUMBER,
  mark1 NUMBER,
  mark2 NUMBER,
  mark3 NUMBER
);

⚙️ Features Implemented

Stored Procedures with IN and OUT parameters

Stored Functions returning values to main block

Local Functions & Procedures declared within anonymous blocks

Recursive Procedure demonstrating looping through function calls

Database Interaction: SELECT, UPDATE, COMMIT operations

▶️ How to Run

Open Oracle SQL Developer or SQL*Plus.

Enable output:

SET SERVEROUTPUT ON;


Copy and paste each block from the .sql file.

Run each question block separately to view results in the output pane.

🧠 Learning Outcomes

Understanding of PL/SQL procedural programming

Hands-on practice with functions, procedures, and recursion

Working with IN/OUT parameters and database manipulation

Practical examples for academic and interview preparation

📂 Repository Structure
📁 plsql-procedures-and-functions/
├── procedures_and_functions.sql      # Full PL/SQL script (Q1–Q10)
├── output_screenshots/               # (Optional) Folder for output images
└── README.md                         # Project documentation

👩‍💻 Author

Manmeet Kaur
📧 Connect on LinkedIn → [https://www.linkedin.com/in/manmeet-kaur-245a372ba/]
🪪 License

This project is released under the MIT License
.
Feel free to use, modify, and share with proper credit.
