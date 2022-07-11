/* 

Hakkoda.io - EDA Queries - Average_Mode_Max
David Thomas Aguilar - david_thomas@hakkoda.io

Query that obtains the Distinct, Total, Nulls and Duplicates of an specific attribute of a table, 
grouping by a shared attribute like account_name and an account_id as identifier.

To achieve it, uses subqueries. The output should look like this, being value the result obtained:

+───────────────+────────────────+──────────────────────+───────────────────+─────────────────────+─────────────────────+
| ACCT_NAME     | ACCT_TOTAL     | Distinct attribute1  | Total attribute1  | Nulls in attribute1 | Dups in attribute1  |
+───────────────+────────────────+──────────────────────+───────────────────+─────────────────────+─────────────────────+
| acct_name1    | value          |  value               |  value            |  value              |  value              |
+───────────────+────────────────+──────────────────────+───────────────────+─────────────────────+─────────────────────+
| acct_name2    | value          |  value               |  value            |  value              |  value              |
+───────────────+────────────────+──────────────────────+───────────────────+─────────────────────+─────────────────────+
| ...           | value          |  value               |  value            |  value              |  value              |
+───────────────+────────────────+──────────────────────+───────────────────+─────────────────────+─────────────────────+

If requiered more stats can be included by adding subqueries or more attributes by adding the same operation in each subquery.

*/


SELECT 
    distinct upper(account_name) as "ACCT_NAME", 
    count(account_id) as ACCT_TOT, 

    count(distinct attribute1) as "Distinct attribute1",
    count(attribute1) as "Total attribute1",
    sum (case when attribute1 is null then 1 else 0 end)  as "Nulls in attribute1",
    case when (count (attribute1) - count (distinct attribute1 )) > 0 
        then ( count (attribute1) - count (distinct attribute1 ) ) else 0  end
    as "Dups in attribute1",
    
    
FROM database.schema.table 
group by 1
order by 2 desc, upper(ACCOUNT_NAME) asc 
;



