/* 

Hakkoda.io - EDA Queries - Average_Mode_Max
David Thomas Aguilar - david_thomas@hakkoda.io



Query that obtains the Average, Max, Min and Mode of an specific attribute of a table.

To achieve it, uses subqueries. The output should look like this, being value the result obtained:

+─────────────────────+────────────────+──────────────────+──────────────────+
| AVERAGE attribute1  | MAX attribute1 | MIN attribute1   | MODE attribute1  |
+─────────────────────+────────────────+──────────────────+──────────────────+
| value               | value          | value            | value            | 
+─────────────────────+────────────────+──────────────────+──────────────────+

If requiered more stats can be included by adding subqueries or more attributes by adding the same operation in each subquery.



Example of a real query by joining 2 tables based on IDs obtanining the average, max, min and mode of attribute1:

with total_accounts as (
select 
    attribute_1, id_1
from SCHEMA.DATABASE.TABLE1 
where id_1 is not null),

group_by_id as (
select 
    account_id_2 , count (attribute_1) as total_id
from SCHEMA.DATABASE.TABLE2 as t_accounts
left join total_accounts on account_id = id_1
group by 1
order by 2 desc
)
select
    avg(total_id) as average_attr_per_id
    max (total_id) as max_attr_per_id
    min (total_id) as min_attr_per_id
    mode (total_id) as mode__attr_per_id
from group_by_id
;

*/


with group_by_attribute1 as (
select 
    attribute1 , count (attribute1) as total_attribute1

FROM database.schema.table 
group by 1
order by 2 desc
)

select
    avg(total_attribute1) as "AVERAGE attribute1",
    max (total_attribute1) as "MAX attribute1,"
    min (total_attribute1) as "MIN attribute1",
    mode (total_attribute1) as "MODE attribute1"

from group_by_attribute1
;


