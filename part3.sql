SELECT * FROM sql_learning.smartphones WHERE brand_name='samsung' ORDER BY screen_size DESC LIMIT 5

SELECT model, (num_rear_cameras + num_front_cameras) AS 'total_cameras' FROM sql_learning.smartphones
    ORDER BY (num_rear_cameras + num_front_cameras) DESC

SELECT model, (num_rear_cameras + num_front_cameras) AS 'total_cameras' FROM sql_learning.smartphones
    ORDER BY total_cameras DESC

SELECT model, 
    SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size AS 'ppi' 
    FROM sql_learning.smartphones 
    ORDER BY ppi DESC LIMIT 10

SELECT model, battery_capacity 
    FROM sql_learning.smartphones 
    ORDER BY battery_capacity DESC LIMIT 1,1

SELECT model, battery_capacity 
    FROM sql_learning.smartphones 
    ORDER BY battery_capacity ASC LIMIT 1,1

SELECT model, rating 
    FROM sql_learning.smartphones 
    WHERE brand_name = 'apple' 
    ORDER BY rating ASC LIMIT 1

SELECT model, price 
    FROM sql_learning.smartphones
    ORDER BY brand_name ASC, price ASC

SELECT model, rating 
    FROM sql_learning.smartphones
    ORDER BY brand_name ASC, rating DESC





