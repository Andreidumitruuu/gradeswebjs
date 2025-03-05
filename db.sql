SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

DROP DATABASE IF EXISTS school;
CREATE DATABASE school CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE school;

-- Tabel pentru teme (Homework)
CREATE TABLE Homework (
    HomeworkID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL, -- Modificat din Name în Title
    Description TEXT,
    Deadline DATE NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Tabel pentru studenți (Students)
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Year INT NOT NULL
);

-- Tabel de legătură între Homework și Students (HomeworkAssignments)
CREATE TABLE HomeworkAssignments (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    HomeworkID INT NOT NULL,
    StudentID INT NOT NULL,
    SubmissionDate DATE,
    Grade DECIMAL(5, 2),
    FOREIGN KEY (HomeworkID) REFERENCES Homework(HomeworkID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Inserare date în tabelul Homework
INSERT INTO Homework (Title, Description, Deadline) VALUES
('Tema 1 - Matematică', 'Exerciții din capitolul 3 și 4', '2025-02-01'),
('Tema 2 - Fizică', 'Probleme din capitolul 5', '2025-02-05'),
('Tema 3 - Informatică', 'Realizare algoritmi de sortare', '2025-02-10');

-- Inserare date în tabelul Students
INSERT INTO Students (Name, Email, Year) VALUES
('Ion Popescu', 'ion.popescu@example.com', 2),
('Maria Ionescu', 'maria.ionescu@example.com', 1),
('Alex Vasile', 'alex.vasile@example.com', 3),
('Elena Radu', 'elena.radu@example.com', 2);

-- Inserare date în tabelul de legătură HomeworkAssignments
INSERT INTO HomeworkAssignments (HomeworkID, StudentID, SubmissionDate, Grade) VALUES
(1, 1, '2025-01-20', 8.50),  -- Ion Popescu la Tema 1
(1, 2, '2025-01-19', 9.00),  -- Maria Ionescu la Tema 1
(2, 3, NULL, NULL),          -- Alex Vasile încă nu a trimis Tema 2
(3, 4, '2025-01-15', 7.75);  -- Elena Radu la Tema 3

-- Vizualizare date din tabele
SELECT * FROM Homework;
SELECT * FROM Students;
SELECT * FROM HomeworkAssignments;
