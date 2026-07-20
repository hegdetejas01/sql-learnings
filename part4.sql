SELECT * FROM sql_learning.users_join_1 t1
    CROSS JOIN sql_learning.groups_join_1 t2

SELECT * FROM sql_learning.users_join_1 t1
    INNER JOIN sql_learning.membership_join_1 t2
    ON t1.user_id = t2.user_id

SELECT * FROM sql_learning.users_join_1 t1
    JOIN sql_learning.membership_join_1 t2
    ON t1.user_id = t2.user_id

SELECT * FROM sql_learning.membership_join_1 t1
    LEFT JOIN sql_learning.users_join_1 t2
    ON t1.user_id = t2.user_id

SELECT * FROM sql_learning.membership_join_1 t1
    RIGHT JOIN sql_learning.users_join_1 t2
    ON t1.user_id = t2.user_id

SELECT * FROM sql_learning.membership_join_1 t1
    LEFT JOIN sql_learning.users_join_1 t2
    ON t1.user_id = t2.user_id
    UNION
    SELECT * FROM sql_learning.membership_join_1 t1
    RIGHT JOIN sql_learning.users_join_1 t2
    ON t1.user_id = t2.user_id

SELECT t1.name as 'name', t2.name as 'emergency' 
    FROM sql_learning.users_join_1 t1
    JOIN sql_learning.users_join_1 t2
    ON t1.emergency_contact = t2.user_id

SELECT * FROM sql_learning.person1_set 
    UNION 
    SELECT * FROM sql_learning.person2_set

SELECT * FROM sql_learning.person1_set 
    UNION ALL
    SELECT * FROM sql_learning.person2_set

SELECT * FROM sql_learning.person1_set 
    INTERSECT
    SELECT * FROM sql_learning.person2_set

SELECT * FROM sql_learning.person1_set 
    EXCEPT
    SELECT * FROM sql_learning.person2_set

SELECT * FROM sql_learning.person2_set 
    EXCEPT
    SELECT * FROM sql_learning.person1_set

SELECT *
    FROM flipkart.order_details t1
    JOIN flipkart.orders t2
    ON t1.order_id = t2.order_id
    JOIN flipkart.users t3
    ON t2.user_id = t3.user_id

SELECT t1.order_id, t2.user_id, t3.name, t4.category_id, t4.category, t3.state
    FROM flipkart.order_details t1
    JOIN flipkart.orders t2
    ON t1.order_id = t2.order_id
    JOIN flipkart.users t3
    ON t2.user_id = t3.user_id
    JOIN flipkart.category t4
    ON t4.category_id = t1.category_id

SELECT t2.order_id, t1.name, t1.city
    FROM flipkart.users t1
    JOIN flipkart.orders t2
    ON t1.user_id = t2.user_id

SELECT t1.order_id, t2.category
    FROM flipkart.order_details t1
    JOIN flipkart.category t2
    ON t1.category_id = t2.category_id

SELECT * FROM flipkart.users t1
    JOIN flipkart.orders t2
    ON t1.user_id = t2.user_id
    WHERE t1.city = 'Pune'

SELECT * FROM flipkart.order_details t1
    JOIN flipkart.category t2
    ON t1.category_id = t2.category_id
    WHERE t2.vertical = 'Chairs'

SELECT t1.order_id, t2.amount, sum(t2.profit) AS 'net_pr'
    FROM flipkart.orders t1
    JOIN flipkart.order_details t2
    ON t2.order_id = t1.order_id
    GROUP BY order_id
    HAVING netPr>0

SELECT t2.name, COUNT(*) AS 'total_orders' 
    FROM flipkart.orders t1
    JOIN flipkart.users t2 
    ON t1.user_id = t2.user_id
    GROUP BY t2.name
    ORDER BY total_orders DESC LIMIT 1

SELECT t2.vertical, SUM(t1.profit) as 'net_pr'
    FROM flipkart.order_details t1
    JOIN flipkart.category t2 
    ON t1.category_id = t2.category_id
    GROUP BY t2.vertical
    ORDER BY net_pr DESC LIMIT 1

SELECT t3.state, SUM(t1.profit) AS 'net_pr' 
    FROM flipkart.order_details t1
    JOIN flipkart.orders t2 ON t1.order_id = t2.order_id
    JOIN flipkart.users t3 ON t2.user_id = t3.user_id
    GROUP BY t3.state
    ORDER BY net_pr DESC LIMIT 1

SELECT t2.vertical, SUM(t1.profit) as 'net_pr'
    FROM flipkart.order_details t1
    JOIN flipkart.category t2 
    ON t1.category_id = t2.category_id
    GROUP BY t2.vertical
    HAVING net_pr > 2000
    ORDER BY net_pr DESC