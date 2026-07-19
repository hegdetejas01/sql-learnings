-- this is a comment in sql --


CREATE DATABASE sql_learning
CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
)

INSERT INTO sql_learning.users (user_id, name, email, password) 
VALUES (NULL, 'tejas','tejas@gmail.com','1234')

INSERT INTO sql_learning.users 
VALUES (NULL, 'ramesh', 'ramesh@gmail.com', '1234')

INSERT INTO sql_learning.users (name, email) 
VALUES ('suresh','suresh@gmail.com')

INSERT INTO sql_learning.users (password, email, user_id ,name) 
VALUES ('1234', 'gopika@gmail.com',NULL,'Gopika')

INSERT INTO sql_learning.users VALUES 
    ( NULL, 'raja', 'raja@gmail.com', '1234' ),
    ( NULL, 'rani', 'rani@gmail.com', '1234' ),
    ( NULL, 'rorror', 'rorror@gmail.com', '1234' )


