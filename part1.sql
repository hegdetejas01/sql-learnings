CREATE DATABASE employee
CREATE DATABASE IF NOT EXISTS employee  

DROP DATABASE employee
DROP DATABASE IF EXISTS employee 

CREATE TABLE students(
    student_id INT,
    student_name VARCHAR(255),
    student_email VARCHAR(255)
)

TRUNCATE TABLE students

DROP TABLE IF EXISTS students

CREATE TABLE student (
    student_id INT NOT NULL,
    student_name VARCHAR(255) NOT NULL,
    student_email VARCHAR(255),
    student_password VARCHAR(255) NOT NULL
)

CREATE TABLE students(
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
)

CREATE TABLE students(
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    
    CONSTRAINT students_email_unique UNIQUE (email)
)

CREATE TABLE students(
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    
    CONSTRAINT students_name_email_unique UNIQUE (name, email)
)

CREATE TABLE students(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    
    CONSTRAINT students_name_email_unique UNIQUE (name, email)
)

CREATE TABLE students(
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    
    CONSTRAINT students_name_email_unique UNIQUE (name, email),
    CONSTRAINT students_id_pk PRIMARY KEY (id)
)

CREATE TABLE students(
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    
    CONSTRAINT students_name_email_unique UNIQUE (name, email),
    CONSTRAINT students_id_name_pk PRIMARY KEY (id, name)
)

