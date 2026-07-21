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

use sql_learning;
select * from (select batter, BattingTeam, sum(batsman_run) as 'total' ,
dense_rank() over(partition by BattingTeam order by total desc) as 'rank_in_team'
from ipl
group by BattingTeam, batter) t
where t.rank_in_team < 6
order by t.BattingTeam desc, t.rank_in_team asc

use sql_learning;
    select * from (select 
    concat("Match-", CAST(row_number() OVER(ORDER BY ID) AS CHAR)) as 'match_num' ,
    sum(batsman_run) as 'runs_scored',
    sum(sum(batsman_run)) over(rows between unbounded preceding and current row) as 'career_runs'
    from ipl 
    where batter = 'V Kohli'
    group by ID) t
    where match_num = 'Match-10' or match_num = 'Match-25' or match_num = 'Match-35'

use sql_learning;
    select * from (select 
    concat("Match-", CAST(row_number() OVER(ORDER BY ID) AS CHAR)) as 'match_num' ,
    sum(batsman_run) as 'runs_scored',
    sum(sum(batsman_run)) over(rows between unbounded preceding and current row) as 'career_runs',
    avg(sum(batsman_run)) over(rows between unbounded preceding and current row) as 'avg'
    from ipl 
    where batter = 'V Kohli'
    group by ID) t

use sql_learning;
        select * from (select 
        concat("Match-", CAST(row_number() OVER(ORDER BY ID) AS CHAR)) as 'match_num' ,
        sum(batsman_run) as 'runs_scored',
        sum(sum(batsman_run)) over w as 'career_runs',
        avg(sum(batsman_run)) over w as 'career_avg'
        from ipl
        where batter = 'V Kohli'
        group by ID
        window w as (rows between unbounded preceding and current row)
        ) t

use sql_learning;
    select * from (select 
    concat("Match-", CAST(row_number() OVER(ORDER BY ID) AS CHAR)) as 'match_num' ,
    sum(batsman_run) as 'runs_scored',
    sum(sum(batsman_run)) over w as 'career_runs',
    avg(sum(batsman_run)) over w as 'career_avg',
    avg(sum(batsman_run)) over (rows between 9 preceding and current row) as '10_match_avg'
    from ipl
    where batter = 'V Kohli'
    group by ID
    window w as (rows between unbounded preceding and current row)
    ) t

USE zomato;
    select t3.f_name,
    (total_value/sum(total_value) over()) *  100 as 'percent'
    from (select f_id, sum(amount) as 'total_value' from orders_subquery t1
    join order_details_subquery t2
    on t1.order_id = t2.order_id
    where r_id=1
    group by f_id) t
    join food t3 on t.f_id = t3.f_id
    order by percent desc

select num2 , lag(num2) over(order by num1 desc),
    ((num2 - (lag(num2) over(order by num1 desc)))/(lag(num2) over(order by num1 desc))) * 100 as 'pct_ch'
    from sql_learning.test_frame

USE sql_learning;
    select *, 
    percentile_disc(0.5) within group(order by marks) over() as 'median marks' 
    from marks

USE sql_learning;
    select *, 
    percentile_disc(0.75) within group(order by marks) over() as 'median marks' 
    from marks

USE sql_learning;
    select *, 
    percentile_disc(0.5) within group(order by marks) over(partition by branch) as 'median marks' 
    from marks

USE sql_learning;
    select *, 
    percentile_disc(0.5) within group(order by marks) over(partition by branch) as 'median marks disc',
    percentile_cont(0.5) within group(order by marks) over(partition by branch) as 'median marks cont' 
    from marks

select *
    from (select *, 
    percentile_disc(0.25) within group(order by marks) over() as 'q1',
    percentile_disc(0.75) within group(order by marks) over() as 'q3',
    (percentile_disc(0.75) within group(order by marks) over())-(percentile_disc(0.25) within group(order by marks) over()) as "IQR"
    from marks) t
    where t.marks > q1-1.5*IQR and t.marks < q3+1.5*IQR
    order by t.student_id

select *,
    NTILE(3) over() as 'groups'
    from marks

select *,
    NTILE(3) over(order by marks desc) as 'groups'
    from marks

use sql_learning;
    select brand_name, model, price,
    CASE
        when bucket = 1 then 'budget'
        when bucket = 2 then 'mid-range'
        when bucket = 3 then 'premium'
    END AS 'phone_type'

    from (select brand_name, model, price,
    NTILE(3) over(order by price) as 'bucket'
    from smartphones) t

select * from (select * ,
    CUME_DIST() over(order by marks) as 'percentile_score'
    from marks) t
    where t.percentile_score > 0.90