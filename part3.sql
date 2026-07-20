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

SELECT  brand_name, COUNT(*) AS 'total_phones' 
    FROM sql_learning.smartphones
    GROUP BY brand_name
    ORDER BY total_phones DESC

SELECT  brand_name, COUNT(model) AS 'total_phones', 
    ROUND(AVG(price),2) AS 'avg price', 
    ROUND(AVG(battery_capacity),2) AS 'avg battery', 
    ROUND(MAX(rating),2) AS 'max rating', 
    ROUND(AVG(screen_size),2) AS 'avg batter' 
    FROM sql_learning.smartphones
    GROUP BY brand_name
    ORDER BY total_phones DESC

SELECT has_nfc, AVG(price), AVG(rating) FROM sql_learning.smartphones GROUP BY has_nfc

SELECT has_nfc, AVG(price), AVG(rating) FROM sql_learning.smartphones GROUP BY has_5g

SELECT fast_charging_available, AVG(price), AVG(rating) FROM sql_learning.smartphones GROUP BY fast_charging_available

SELECT has_5g, has_nfc, AVG(price), AVG(rating) FROM sql_learning.smartphones GROUP BY has_5g, has_nfc

SELECT brand_name, processor_brand, 
    COUNT(*) AS 'total_phones', 
    ROUND(AVG(primary_camera_rear), 2) AS 'average_cam_resolution' 
    FROM sql_learning.smartphones 
    GROUP BY brand_name, processor_brand

SELECT brand_name, ROUND(AVG(price)) as 'average_price' 
    FROM sql_learning.smartphones
    GROUP BY brand_name
    ORDER BY average_price DESC LIMIT 5

SELECT brand_name, ROUND(AVG(screen_size)) as 'average_screensize' 
    FROM sql_learning.smartphones
    GROUP BY brand_name
    ORDER BY average_screensize ASC LIMIT 1

SELECT brand_name, COUNT(*) AS 'ans' FROM sql_learning.smartphones 
    WHERE has_ir_blaster = 'True' AND has_nfc = 'True'
    GROUP BY brand_name

SELECT has_nfc, AVG(price) FROM sql_learning.smartphones
    WHERE brand_name = 'samsung' AND has_5g = 'True'
    GROUP BY has_nfc

SELECT brand_name, ROUND(AVG(price),2) AS 'avg_price'
    FROM sql_learning.smartphones
    GROUP BY brand_name
    HAVING COUNT(*) > 20
    ORDER BY avg_price DESC

SELECT brand_name, ROUND(AVG(rating),2) AS 'avg_rating'
    FROM sql_learning.smartphones
    GROUP BY brand_name
    HAVING COUNT(*) > 40

SELECT brand_name, ROUND(AVG(ram_capacity)) AS 'avg_ram'
    FROM sql_learning.smartphones
    WHERE refresh_rate >= 90 AND fast_charging_available = 1
    GROUP BY brand_name
    HAVING COUNT(*) > 10
    ORDER BY avg_ram DESC LIMIT 3

SELECT brand_name, ROUND(AVG(price)) AS 'avp' 
    FROM sql_learning.smartphones
    WHERE has_5g = 'True'
    GROUP BY brand_name
    HAVING count(*) > 10 AND avg(rating) > 70