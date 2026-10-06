-- Create Patients table
\\Creates a table named Patients which contains the following information for each entry: the patient id, name, age, gender and city.
CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    city TEXT
);

-- Insert sample data into Patients
INSERT INTO Patients (patient_id, name, age, gender, city) VALUES
(1, 'John Doe', 45, 'M', 'Boston'),
(2, 'Jane Smith', 32, 'F', 'Cambridge'),
(3, 'Mike Johnson', 58, 'M', 'Boston'),
(4, 'Sarah Williams', 41, 'F', 'Somerville'),
(5, 'David Brown', 29, 'M', 'Boston'),
(6, 'Emily Davis', 67, 'F', 'Cambridge');

select * from Patients;

--------

-- Create Visits table
CREATE TABLE Visits (
    visit_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    visit_date TEXT,
    diagnosis TEXT,
    cost REAL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Insert sample data into Visits
INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);

SELECT * from Visits;


select * from Patients;

--Specific rows/records
select * from Patients where city = 'Boston';

--Now select records for only Female patients

--Specific fields
Select patient_id, name, age from Patients;

--Now select name and city from patients


--Single summary stats
--How many rows are there?
select count(*) from patients;

--How many distinct genders are there?
select count(distinct gender) from Patients;

--What is the average age?
select avg(age) from Patients;


--Summarazing by another variable
select gender, avg(age)
from Patients
group by gender;

--sort/order by
select gender, avg(age)
from Patients
group by gender
order by 2 desc;

--Joins
--inner join
SELECT 
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
JOIN Visits v ON p.patient_id = v.patient_id;

--left join

SELECT 
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
LEFT JOIN Visits v ON p.patient_id = v.patient_id;




---Advanced---
--case when
--window functions
--CTE (with)
