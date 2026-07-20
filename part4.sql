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