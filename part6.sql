USE sql_learning;
SELECT * , AVG(marks) OVER() FROM marks

USE sql_learning;
SELECT * , AVG(marks) OVER(PARTITION BY branch) FROM marks

USE sql_learning;
SELECT * , 
MIN(marks) OVER(),
MAX(marks) OVER()
FROM marks

USE sql_learning;
SELECT * , 
AVG(marks) OVER(partition by branch),
MIN(marks) OVER(),
MAX(marks) OVER()
FROM marks
ORDER BY student_id

USE sql_learning;
SELECT * , 
AVG(marks) OVER(PARTITION BY branch),
MIN(marks) OVER(PARTITION BY branch),
MAX(marks) OVER(PARTITION BY branch)
FROM marks
ORDER BY student_id

USE sql_learning;
    SELECT * FROM 
    (SELECT * , AVG(marks) OVER(PARTITION BY branch) AS 'branch_avg' FROM marks) t 
    WHERE t.marks > t.branch_avg

USE sql_learning;
    SELECT * , RANK() OVER(ORDER BY marks DESC) FROM marks

USE sql_learning;
    SELECT * , RANK() OVER(PARTITION BY BRANCH ORDER BY marks DESC) FROM marks

USE sql_learning;
    SELECT * , 
    RANK() OVER(PARTITION BY BRANCH ORDER BY marks DESC),
    DENSE_RANK() OVER(PARTITION BY BRANCH ORDER BY marks DESC) 
    FROM marks

USE sql_learning;   
    SELECT * , 
    ROW_NUMBER() OVER()
    FROM marks

USE sql_learning;   
    SELECT * , 
    ROW_NUMBER() OVER(PARTITION BY BRANCH)
    FROM marks

SELECT * , 
    CONCAT(branch, '-', ROW_NUMBER() OVER(PARTITION BY BRANCH))
    FROM marks

USE zomato;
    WITH rank_month AS (
        SELECT * FROM (
            SELECT monthname(date) AS 'month', user_id, SUM(amount) AS 'total',
            RANK() OVER(PARTITION BY MONTHNAME(date) ORDER BY SUM(amount) DESC) AS 'month_rank'
            FROM orders_subquery
            GROUP BY monthname(date), user_id
            ORDER BY month(date)
        ) t WHERE t.month_rank < 3)

    SELECT t1.month, t2.user_id, t1.month_rank, t2.name FROM rank_month t1
    JOIN users_subquery t2 ON t2.user_id = t1.user_id

Get the top student in entire collage. This will be displayed in every row
    USE sql_learning;
    SELECT *, FIRST_VALUE(name) OVER(ORDER BY marks DESC) FROM marks

    - here i want to display the name, therefore first_value(name)
    - if i want to display the marks then first_value(marks)

USE sql_learning;
    SELECT *, LAST_VALUE(name) OVER(ORDER BY marks DESC) FROM marks 

USE sql_learning;
    SELECT *, LAST_VALUE(marks) 
    OVER(
        ORDER BY marks DESC 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) 
    FROM marks 

USE sql_learning;
        SELECT *, LAST_VALUE(name) 
        OVER(
            PARTITION BY branch
            ORDER BY marks DESC 
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) as 'min_branchwise_marks'
        FROM marks 

USE sql_learning;
        SELECT *, FIRST_VALUE(name) 
        OVER(
            PARTITION BY branch
            ORDER BY marks DESC 
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) as 'min_branchwise_marks'
        FROM marks

USE sql_learning;
        SELECT *, NTH_VALUE(name, 2) 
        OVER(
            PARTITION BY branch
            ORDER BY marks DESC 
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) as 'min_branchwise_marks'
        FROM marks

USE sql_learning;
    select name, branch, marks from ( 
        select *, first_value(name) 
	    over(partition by branch order by marks desc) as 'topper_name',
        first_value(marks) 
        over(partition by branch order by marks desc) as 'topper_marks'
    from marks) t
    where t.name = t.topper_name and t.marks = t.topper_marks

USE sql_learning;
    select name, branch, marks from (
        select *, last_value(name) 
        over(partition by branch order by marks desc 
                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as 'topper_name',
        last_value(marks) 
        over(partition by branch order by marks desc
                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as 'topper_marks'
    from marks) t
    where t.name = t.topper_name and t.marks = t.topper_marks

USE sql_learning;
    select *, 
    lag(marks) over(order by student_id) 
    from marks

USE sql_learning;
    select *, 
    lag(marks) over(order by student_id),
    lead(marks) over(order by student_id)
    from marks

USE sql_learning;
    select *, 
    lag(marks) over(partition by branch order by student_id),
    lead(marks) over(partition by branch order by student_id)
    from marks

USE zomato;
    select monthname(date), sum(amount), 
    (sum(amount) - lag(sum(amount)) over(order by month(date) asc))/
    lag(sum(amount)) over(order by month(date) asc) * 100 as 'MoM revenue'
    from orders_subquery
    group by monthname(date)
    order by month(date) asc
