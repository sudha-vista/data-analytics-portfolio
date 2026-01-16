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


