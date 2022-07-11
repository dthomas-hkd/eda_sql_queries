/* 

Hakkoda.io - EDA Queries - Distinct_Duplicates_Nulls_Total
David Thomas Aguilar - david_thomas@hakkoda.io


Query that obtains the Distinct, Duplicates, Null and Total of 2 specific attributes of a table.

To achieve it, uses subqueries and union operations. The output should look like this, being value the result obtained:

+─────────────+────────────+────────────+
| FINDING     | attribute1 | attribute2 |
+─────────────+────────────+────────────+
| DISTINCT    | value      | value      |
+─────────────+────────────+────────────+
| DUPLICATES  | value      | value      |
+─────────────+────────────+────────────+
| NULLS       | value      | value      |
+─────────────+─────────────────────────+
| TOTAL       | value      | value      |
+─────────────+─────────────────────────+

If requiered more stats can be included by adding subqueries or more attributes by adding the same operation in each subquery.

*/


WITH DIST AS (

    SELECT DISTINCT
      
        'DISTINCT' AS "FINDING",
    
        count(distinct attribute1) as attribute1,

        count(distinct attribute2) as attribute2

    FROM database.schema.table ), 

TOTAL AS (
    
    SELECT
    
        'TOTAL',
        
        count(attribute1),
    
        count(attribute2)
       
    FROM database.schema.table
),

DUPS AS (
    
    SELECT
        
        'DUPLICATES',
    
        case when (count (attribute1) - count (distinct attribute1 )) > 0 
            then ( count (attribute1) - count (distinct attribute1 ) ) else 0  end,
        
        case when (count (attribute2) - count (distinct attribute2 )) > 0 
            then ( count (attribute2) - count (distinct attribute2 ) ) else 0  end

    FROM database.schema.table
), 

NULLS AS (

    SELECT
    
        'NULLS',
    
        sum (case when attribute1 is null then 1 else 0 end),

        sum (case when attribute2 is null then 1 else 0 end)

    FROM database.schema.table
    
)

SELECT * FROM DIST 
    UNION SELECT * FROM TOTAL 
    UNION SELECT * FROM NULLS 
    UNION SELECT * FROM DUPS

ORDER BY 1 ASC;