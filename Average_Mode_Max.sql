/* 

Hakkoda.io - EDA Queries - Average_Mode_Max
David Thomas Aguilar - david_thomas@hakkoda.io

Query that obtains the Average, Mode and Max of the Distinct, Total and Null values of 2 specific attributes of a table.

To achieve it, uses subqueries and union operations. The output should look like this, being value the result obtained:

+───────+─────────────────────+──────────────────+──────────────────+─────────────────────+──────────────────+─────────────────+
| STAT  | DISTINCT attribute2 | TOTAL attribute2 | NULL attribute2  | DISTINCT attribute3 | TOTAL attribute3 | NULL attribute3 |
+───────+─────────────────────+──────────────────+──────────────────+─────────────────────+──────────────────+─────────────────+
| AVG   | value               | value            | value            | value               | value            | value           |
+───────+─────────────────────+──────────────────+──────────────────+─────────────────────+──────────────────+─────────────────+
| MODE  | value               | value            | value            | value               | value            | value           |
+───────+─────────────────────+──────────────────+──────────────────+─────────────────────+──────────────────+─────────────────+
| MAX   | value               | value            | value            | value               | value            | value           |
+───────+─────────────────────+──────────────────+──────────────────+─────────────────────+──────────────────+─────────────────+

If requiered more stats can be included by adding subqueries or more attributes by adding the same operation in each subquery.

*/


WITH GROUPED AS 
 
( SELECT 
    distinct upper(attribute1) as "attribute1", 
    count(id1) as id_tot, 
    
    count(distinct attribute2) as attribute2_DIST,
    count(attribute2) as attribute2_TOT,
    sum (case when attribute2 is null then 1 else 0 end)  as "Nulls in attribute2",
    case when (count (attribute2) - count (distinct attribute2 )) > 0 
        then ( count (attribute2) - count (distinct attribute2 ) ) else 0  end
    as "Dups in attribute2",   
     
    count(distinct attribute3) as attribute3_DIST,
    count(attribute3) as attribute3_TOT,
    sum (case when attribute3 is null then 1 else 0 end) as "Nulls in attribute3",
    case when (count (attribute3) - count (distinct attribute3 )) > 0 
        then ( count (attribute3) - count (distinct attribute3 ) ) else 0  end
    as "Dups in attribute3",
    
    
FROM database.schema.table 
group by 1
order by 2 desc, upper(attribute1) asc 
),

average as (

    SELECT 

        'AVG' as "STAT",

        AVG (attribute2_DIST) AS "DISTINCT attribute2", 

        AVG (attribute2_TOT) AS "TOTAL attribute2", 

        AVG ("Nulls in attribute2") AS "NULL attribute2", 

        AVG (attribute3_DIST) AS "DISTINCT attribute3", 

        AVG (attribute3_TOT) AS "TOTAL attribute3", 

        AVG ("Nulls in attribute3") AS "NULL BILLING_STAT"

    FROM GROUPED
),

mode_ as (

    SELECT
    
        'MODE' ,

        MODE (attribute2_DIST), 

        MODE (attribute2_TOT), 

        MODE ("Nulls in attribute2"), 

        MODE (attribute3_DIST), 

        MODE (attribute3_TOT), 

        MODE ("Nulls in attribute3") 

    FROM GROUPED
),

max_ as (

    select
        'MAX',

        MAX (attribute2_DIST), 

        MAX (attribute2_TOT), 

        MAX ("Nulls in attribute2"),

        MAX (attribute3_DIST), 

        MAX (attribute3_TOT), 

        MAX ("Nulls in attribute3")

FROM GROUPED
)

select * from average 
    union select * from mode_ 
    union select * from max_
;


