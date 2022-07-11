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


