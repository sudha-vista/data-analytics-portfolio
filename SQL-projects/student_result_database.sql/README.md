# student result database – SQL Project

## Project Overview
This project demonstrates a simple **student–result management system** using SQL.  
It includes **table creation, data insertion, and analytical queries** such as averages, top scorers, and department-wise performance.

---

## Database Schema

### Students Table
- Stores basic student details

### Results Table
- Stores subject-wise marks linked using `student_id`

---

## SQL Queries Used

```sql
-- Create students table
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    semester INTEGER
);

-- Create results table
CREATE TABLE results (
    result_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    subject TEXT,
    marks INTEGER,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Insert student records
INSERT INTO students VALUES
(1, 'Rahul', 'CSE', 1),
(2, 'Anita', 'CSE', 1),
(3, 'Karan', 'ECE', 1),
(4, 'Sneha', 'ECE', 1);

-- Insert result records
INSERT INTO results VALUES
(101, 1, 'Maths', 78),
(102, 1, 'Python', 85),
(103, 2, 'Maths', 88),
(104, 2, 'Python', 90),
(105, 3, 'Maths', 65),
(106, 3, 'Python', 70),
(107, 4, 'Maths', 92),
(108, 4, 'Python', 95);

-- View all students
SELECT * FROM students;

-- View all results
SELECT * FROM results;

-- Student-wise subject marks
SELECT s.name, r.subject, r.marks
FROM students s
JOIN results r
ON s.student_id = r.student_id;

-- Average marks per student
SELECT s.name, AVG(r.marks) AS average_marks
FROM students s
JOIN results r
ON s.student_id = r.student_id
GROUP BY s.name;

-- Students scoring above 80
SELECT s.name, r.subject, r.marks
FROM students s
JOIN results r
ON s.student_id = r.student_id
WHERE r.marks > 80;

-- Department-wise average marks
SELECT s.department, AVG(r.marks) AS department_average
FROM students s
JOIN results r
ON s.student_id = r.student_id
GROUP BY s.department;

-- Top scorer
SELECT s.name, r.subject, r.marks
FROM students s
JOIN results r
ON s.student_id = r.student_id
ORDER BY r.marks DESC
LIMIT 1;
## Output

**Students Table**

| student_id | name  | department | semester |
|------------|-------|------------|----------|
| 1 | Rahul | CSE | 1 |
| 2 | Anita | CSE | 1 |
| 3 | Karan | ECE | 1 |
| 4 | Sneha | ECE | 1 |

---

**Results Table**

| result_id | student_id | subject | marks |
|-----------|------------|---------|-------|
| 101 | 1 | Maths | 78 |
| 102 | 1 | Python | 85 |
| 103 | 2 | Maths | 88 |
| 104 | 2 | Python | 90 |
| 105 | 3 | Maths | 65 |
| 106 | 3 | Python | 70 |
| 107 | 4 | Maths | 92 |
| 108 | 4 | Python | 95 |

---

**Student-wise Subject Marks**

| name  | subject | marks |
|-------|---------|-------|
| Rahul | Maths | 78 |
| Rahul | Python | 85 |
| Anita | Maths | 88 |
| Anita | Python | 90 |
| Karan | Maths | 65 |
| Karan | Python | 70 |
| Sneha | Maths | 92 |
| Sneha | Python | 95 |

---

**Average Marks per Student**

| name  | average_marks |
|-------|---------------|
| Rahul | 81.5 |
| Anita | 89.0 |
| Karan | 67.5 |
| Sneha | 93.5 |

---

**Students Scoring Above 80**

| name  | subject | marks |
|-------|---------|-------|
| Rahul | Python | 85 |
| Anita | Maths | 88 |
| Anita | Python | 90 |
| Sneha | Maths | 92 |
| Sneha | Python | 95 |

---

**Department-wise Average Marks**

| department | department_average |
|------------|--------------------|
| CSE | 85.25 |
| ECE | 80.50 |

---

**Top Scorer**

| name | subject | marks |
|------|---------|-------|
| Sneha | Python | 95 |

## Explanation

1. Database Creation  
Two tables were created:  
- **students** – stores student details  
- **results** – stores subject marks linked by `student_id`

2. Joins  
A `JOIN` is used to match each student with their marks.

3. Aggregations  
Functions used:  
- `AVG()` → average marks per student and department  
- `ORDER BY` + `LIMIT` → finding the top scorer  

4. Insights Derived  
- Sneha is the top scorer  
- CSE department has a higher average than ECE  
- Students with marks > 80 are identified  
- Average marks per student calculated.
