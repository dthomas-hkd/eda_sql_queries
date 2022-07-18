# eda_sql_queries

This repo contains different queries to perform an Exploratory Data Analysis over tables using Snowflake.

Is advised to create views and a dashboard via Snowsight to store the results and updated them as required, documentation about this process: https://docs.snowflake.com/en/user-guide/ui-snowsight-dashboards.html


In case of questions feel free to contact me: david_thomas@hakkoda.io




Queries included in this repo:

    Average_Max_Min_Mode.sql

        +─────────────────────+────────────────+──────────────────+──────────────────+
        | AVERAGE attribute1  | MAX attribute1 | MIN attribute1   | MODE attribute1  |
        +─────────────────────+────────────────+──────────────────+──────────────────+
        | value               | value          | value            | value            | 
        +─────────────────────+────────────────+──────────────────+──────────────────+


    Average_Mode_Max.sql

        +───────+─────────────────────+──────────────────+──────────────────+─────────────────────+──────────────────+─────────────────+
        | STAT  | DISTINCT attribute2 | TOTAL attribute2 | NULL attribute2  | DISTINCT attribute3 | TOTAL attribute3 | NULL attribute3 |
        +───────+─────────────────────+──────────────────+──────────────────+─────────────────────+──────────────────+─────────────────+
        | AVG   | value               | value            | value            | value               | value            | value           |
        +───────+─────────────────────+──────────────────+──────────────────+─────────────────────+──────────────────+─────────────────+
        | MODE  | value               | value            | value            | value               | value            | value           |
        +───────+─────────────────────+──────────────────+──────────────────+─────────────────────+──────────────────+─────────────────+
        | MAX   | value               | value            | value            | value               | value            | value           |
        +───────+─────────────────────+──────────────────+──────────────────+─────────────────────+──────────────────+─────────────────+


    Distinct_Duplicates_Nulls_Total.sql

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


    Distinct_Total_Duplicates_Null_per_Attribute.sql
        +───────────────+────────────────+──────────────────────+───────────────────+─────────────────────+─────────────────────+
        | ACCT_NAME     | ACCT_TOTAL     | Distinct attribute1  | Total attribute1  | Nulls in attribute1 | Dups in attribute1  |
        +───────────────+────────────────+──────────────────────+───────────────────+─────────────────────+─────────────────────+
        | acct_name1    | value          |  value               |  value            |  value              |  value              |
        +───────────────+────────────────+──────────────────────+───────────────────+─────────────────────+─────────────────────+
        | acct_name2    | value          |  value               |  value            |  value              |  value              |
        +───────────────+────────────────+──────────────────────+───────────────────+─────────────────────+─────────────────────+
        | ...           | value          |  value               |  value            |  value              |  value              |
        +───────────────+────────────────+──────────────────────+───────────────────+─────────────────────+─────────────────────+


