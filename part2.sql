-- this is a comment in sql --


CREATE DATABASE sql_learning
CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
)

-- INSERT

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



-- SELECT

SELECT * FROM sql_learning.smartphones WHERE 1

SELECT * FROM sql_learning.users

SELECT model, price, rating, brand_name FROM sql_learning.smartphones 
    
SELECT model, battery_capacity, os FROM sql_learning.smartphones WHERE 1

SELECT model, battery_capacity AS 'mAh' , os AS 'Operating System' FROM sql_learning.smartphones WHERE 1

SELECT model, resolution_width*resolution_width FROM sql_learning.smartphones

SELECT model, resolution_width*resolution_width + resolution_height*resolution_height FROM sql_learning.smartphones

SELECT model, SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size AS 'PPI' FROM sql_learning.smartphones

SELECT model, rating/10 FROM sql_learning.smartphones

SELECT  model, 'smartphone' AS 'type' FROM sql_learning.smartphones

SELECT DISTINCT(brand_name) as 'ALL BRANDS' FROM sql_learning.smartphones

SELECT DISTINCT(processor_brand) as 'ALL PROCESSORS' FROM sql_learning.smartphones

SELECT DISTINCT brand_name, processor_brand FROM sql_learning.smartphones


SELECT * FROM sql_learning.smartphones WHERE brand_name = 'samsung'

SELECT * FROM sql_learning.smartphones WHERE brand_name = 'apple'

SELECT * FROM sql_learning.smartphones WHERE price > 50000

Between operator - gives data between a given range

SELECT * FROM sql_learning.smartphones WHERE price > 20000 AND price < 30000

SELECT * FROM sql_learning.smartphones WHERE price BETWEEN 20000 AND 30000

SELECT * FROM sql_learning.smartphones WHERE rating > 80 AND price < 30000

SELECT * FROM sql_learning.smartphones WHERE brand_name = 'samsung' AND ram_capacity > 8

SELECT * FROM sql_learning.smartphones WHERE brand_name = 'samsung' AND processor_brand = 'snapdragon'

SELECT DISTINCT brand_name FROM sql_learning.smartphones WHERE price>50000

SELECT DISTINCT (brand_name) FROM sql_learning.smartphones WHERE price>50000

SELECT * FROM sql_learning.smartphones 
    WHERE processor_brand = 'snapdragon' OR 
    processor_brand = 'bionic' OR 
    processor_brand = 'dimensity'

SELECT * FROM sql_learning.smartphones 
    WHERE processor_brand IN ('snapdragon','bionic','dimensity')

SELECT * FROM sql_learning.smartphones 
    WHERE processor_brand NOT IN ('snapdragon','bionic','dimensity')


-- DELETE and UPDATE
UPDATE sql_learning.smartphones
    SET processor_brand = 'dimensity'
    WHERE processor_brand = 'mediatek'

UPDATE sql_learning.users
    SET name='hello', email='hello@gmail.com'
    WHERE user_id = 1

DELETE FROM sql_learning.smartphones WHERE price>200000

DELETE FROM sql_learning.smartphones
    WHERE brand_name = 'samsung' AND primary_camera_rear > 150




-- Functions
SELECT model, MAX(price) FROM sql_learning.smartphones

SELECT model, MIN(price) FROM sql_learning.smartphones

SELECT model, MAX(price) FROM sql_learning.smartphones WHERE brand_name='samsung'

SELECT AVG(rating) FROM sql_learning.smartphones WHERE brand_name='apple'

SELECT SUM(price) FROM sql_learning.smartphones WHERE brand_name='apple'

SELECT COUNT(*) FROM sql_learning.smartphones WHERE brand_name='samsung'

SELECT COUNT(DISTINCT(brand_name)) FROM sql_learning.smartphones

SELECT COUNT(DISTINCT(processor_brand)) FROM sql_learning.smartphones

SELECT STD(screen_size) FROM sql_learning.smartphones

SELECT VARIANCE(screen_size) FROM sql_learning.smartphones

SELECT ABS(50000 - price) as 'diff' FROM sql_learning.smartphones

SELECT model, 
    ROUND(SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size) AS 'PPI' FROM sql_learning.smartphones

SELECT model, 
    ROUND(SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size, 2) AS 'PPI' 
    FROM sql_learning.smartphones

SELECT CEIL(screen_size) FROM sql_learning.smartphones
    
SELECT FLOOR(screen_size) FROM sql_learning.smartphones




-- Solution for questions
SELECT AVG(battery_capacity) , AVG(primary_camera_rear) FROM sql_learning.smartphones WHERE price>100000

SELECT AVG(internal_memory) FROM sql_learning.smartphones WHERE refresh_rate>=120 AND (num_front_cameras * primary_camera_front) > 20

SELECT COUNT(*) FROM sql_learning.smartphones WHERE has_5g = 'TRUE'