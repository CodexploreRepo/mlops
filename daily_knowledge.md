# Daily Knowledge

## Day 1
### SQL
#### View & Snapshot (materialized views)
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
- `snapshot` is a replica of a target master table from a single point in time. 
    - snapshots are updated from one or more master tables through individual batch updates, known as a **refreshes** 
    - snapshots can be helpful for regional offices or sales forces that do not require the complete corporate data set
    - For example: master table is Murex table that contains all history records about a murex transaction, but we can have a snapshot of murex table to keep track on the latest status of that transaction instead of all history records 
