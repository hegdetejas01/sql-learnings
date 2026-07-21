import matplotlib.pyplot as plt
import pandas as pd
import mysql.connector

conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password=''
)

df = pd.read_sql_query("""
select * from (select 
concat("Match-", CAST(row_number() OVER(ORDER BY ID) AS CHAR)) as 'match_num' ,
sum(batsman_run) as 'runs_scored',
sum(sum(batsman_run)) over w as 'career_runs',
avg(sum(batsman_run)) over w as 'career_avg',
avg(sum(batsman_run)) over (rows between 4 preceding and current row) as '10_match_avg'
from sql_learning.ipl
where batter = 'V Kohli'
group by ID
window w as (rows between unbounded preceding and current row)
) t
""", conn)

print(df)


plt.plot(df['match_num'], df['career_avg'], c='green')
plt.plot(df['match_num'], df['10_match_avg'], c='red')
plt.show()