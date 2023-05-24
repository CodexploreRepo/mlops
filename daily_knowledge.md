# Daily Knowledge

## Day 1
### SQL
-  `View` is a virtual table that does not store its own data but rather displays data that is stored in other tables. 
```sql

CREATE VIEW transactions AS
    SELECT 
        id_number,
        name,
        transaction_date
    FROM
        customers;
        
-- After we execute this statement, the transactions object will be available in Views. 
SELECT * FROM transactions;
```
