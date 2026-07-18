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

CREATE TABLE students(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
)

CREATE TABLE teachers(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age>25 AND age<60)
)

CREATE TABLE teachers( 
    id INT PRIMARY KEY, 
    name VARCHAR(50) NOT NULL, 
    age INT, 
    
    CONSTRAINT teachers_age_check CHECK (age>25 AND age<60) 
)

CREATE TABLE ticket(
    ticket_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE customers( 
    cid INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(50) NOT NULL, 
    email VARCHAR(50) NOT NULL UNIQUE 
)


CREATE TABLE orders( 
    order_id INT PRIMARY KEY, 
    cid INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT orders_cid_fk FOREIGN KEY (cid) REFERENCES customers(cid)
)

    CREATE TABLE customers( 
    customer_id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(50) NOT NULL
)

CREATE TABLE orders( 
    order_id INT PRIMARY KEY AUTO_INCREMENT, 
    cid INT NOT NULL, 
    order_date DATETIME NOT NULL DEFAULT CURRENT_DATE, 
    
    CONSTRAINT orders_cid_fk FOREIGN KEY (cid) REFERENCES customers(customer_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE 
)

ALTER TABLE customers ADD COLUMN email VARCHAR(255) NOT NULL

ALTER TABLE customers ADD COLUMN surname VARCHAR(50) NOT NULL AFTER name

ALTER TABLE customers ADD COLUMN surname VARCHAR(50) NOT NULL BEFORE name

ALTER TABLE customers
ADD COLUMN pan_num VARCHAR(255) AFTER surname,
ADD COLUMN joining_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP

ALTER TABLE customers DROP COLUMN pan_num

ALTER TABLE customers
DROP COLUMN email,
DROP COLUMN joining_date

ALTER TABLE customers MODIFY COLUMN surname INTEGER

ALTER TABLE customers 
MODIFY COLUMN name VARCHAR(30),
MODIFY COLUMN surname VARCHAR(15)

ALTER TABLE customers ADD COLUMN age INT NOT NULL

ALTER TABLE customers ADD CONSTRAINT customers_age_check CHECK (age<18) 

ALTER TABLE customers DROP CONSTRAINT customers_age_check