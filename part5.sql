SELECT * FROM sql_learning.movies
    WHERE score = (SELECT MAX(score) FROM sql_learning.movies)

USE sql_learning;
    SELECT * FROM movies
    WHERE gross-budget = (SELECT MAX(gross - budget) from movies)

SELECT * FROM movies
    ORDER BY gross - budget DESC LIMIT 1

USE sql_learning;
    SELECT COUNT(*) FROM movies
    WHERE score > 
        (SELECT AVG(score) from movies)

USE sql_learning;
    SELECT * FROM movies
    WHERE year = 1980 AND 
    score = 
        (SELECT MAX(score) FROM movies 
        WHERE year = 1980);

SELECT * FROM movies 
    WHERE score = 
        (SELECT MAX(score) FROM movies 
        WHERE votes > 
            (SELECT AVG(votes) FROM movies))

USE zomato;
    SELECT name, user_id FROM users_subquery WHERE user_id
    NOT IN (SELECT DISTINCT(user_id) FROM orders_subquery)

USE sql_learning;
    SELECT * FROM movies 
    WHERE director IN 
        (SELECT director
        FROM movies
        GROUP BY director
        ORDER BY SUM(gross) DESC 
        LIMIT 3)

USE sql_learning;
    WITH top_directors AS (SELECT director
        FROM movies
        GROUP BY director
        ORDER BY SUM(gross) DESC 
        LIMIT 3)
    SELECT * FROM movies 
    WHERE director IN (SELECT * FROM top_directors)

USE sql_learning;
    SELECT * FROM movies WHERE star IN (
        SELECT star FROM movies
        WHERE votes > 25000
        GROUP BY (star)
        HAVING AVG(score) > 8.2)

USE sql_learning;
    SELECT * FROM movies 
    WHERE (year, gross-budget) IN 
        (SELECT year, MAX(gross - budget) FROM movies 
        GROUP BY year)

USE sql_learning;
    SELECT * FROM movies
    WHERE (genre, score) IN 
        (SELECT genre, MAX(score) FROM movies
        WHERE votes>25000
        GROUP BY genre)
    AND votes>25000

USE sql_learning;
    WITH top_combo AS 
        (select star, director, max(gross) 
        FROM movies 
        GROUP BY star, director
        ORDER BY sum(gross) DESC 
        LIMIT 5)
    SELECT * FROM movies WHERE (star, director, gross) IN (SELECT * FROM top_combo)

USE sql_learning;
    SELECT * FROM movies m1
    WHERE score > (SELECT AVG(score) FROM movies m2 
                    WHERE m2.genre = m1.genre)


WITH fav_food AS (
        SELECT t2.user_id, t1.name, t4.f_name, COUNT(*) AS 'freq' FROM users_subquery t1
        JOIN orders_subquery t2 ON t1.user_id = t2.user_id
        JOIN order_details_subquery t3 ON t2.order_id = t3.order_id
        JOIN food t4 ON t3.f_id = t4.f_id
        GROUP BY t1.user_id, t3.f_id)

    SELECT * FROM fav_food f1 
    WHERE freq = (SELECT MAX(freq) 
                    FROM fav_food f2 
                    WHERE f2.user_id = f1.user_id)

USE sql_learning;
    SELECT name, (votes/(SELECT SUM(votes) FROM movies)*100) FROM movies

USE sql_learning;
    SELECT name, genre g, score, 
    (SELECT AVG(score) FROM movies m WHERE m.genre = g) AS 'Avg_Rating' 
    FROM movies

USE sql_learning;
    SELECT name, genre, score, 
    (SELECT AVG(score) FROM movies m2 WHERE m2.genre = m1.genre) AS 'Avg_Rating' 
    FROM movies m1

USE zomato;
    SELECT t1.r_id, t2.r_name, AVG(restaurant_rating) FROM orders_subquery t1
    JOIN restaurants t2 ON t1.r_id = t2.r_id
    GROUP BY r_id;

USE zomato;
    SELECT r_name, avg_rating FROM 
	(SELECT r_id, AVG(restaurant_rating) AS 'avg_rating' FROM orders_subquery
	GROUP BY r_id) t1 
    JOIN restaurants t2 ON t1.r_id = t2.r_id

USE sql_learning;
    SELECT genre, AVG(score) AS 'avg_score' FROM movies
    GROUP BY genre
    HAVING avg_score >= (SELECT AVG(score) FROM movies)

CREATE TABLE loyal_customers (

        user_id INT NOT NULL,
        name VARCHAR(50) not null,
        money FLOAT

    );

    USE zomato;
    INSERT INTO loyal_customers (user_id, name)
    SELECT t1.user_id, t2.name from orders_subquery t1
    JOIN users_subquery t2 ON t1.user_id = t2.user_id
    GROUP BY user_id
    HAVING COUNT(*) > 3

USE zomato;
    UPDATE loyal_customers t1
    SET money = 
    (SELECT SUM(amount) * 0.1 FROM orders_subquery t2 WHERE t2.user_id = t1.user_id)

Delete FROM users_subquery
    WHERE user_id IN (
        SELECT user_id FROM users_subquery
        WHERE user_id NOT IN (
            SELECT DISTINCT(user_id) FROM orders_subquery))