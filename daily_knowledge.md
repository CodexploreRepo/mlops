# Daily Knowledge

## Day 1

### Linux

- **Linux** is the **kernel**: the program in the system that allocates the machine's resources (CPU, memory and disk, etc.) to the other programs that you run.
- An **operating system** includes a kernel, compilers, editors, text formatters, mail software, graphical interfaces, libraries, games and many other things.
  - The **kernel** is an essential part of an operating system, but useless by itself; it can only function in the context of a complete operating system.

<p align="center"><img src="./assets/img/kernel_layout.png" width=300/></p>

- Linux is normally used in combination with the GNU OS: the whole system is basically GNU with Linux added, or `GNU/Linux`.
- All the so-called “Linux” distributions such as Ubuntu, Kali Linux, are really distributions of GNU/Linux.

#### `/proc` folder

- Contains files for monitoring processes
- Get the status information of a process: `/proc/PID/{status, cpu, memory, meminfo}`
  - Find more [Process specific entries in `/proc`](https://www.kernel.org/doc/html/latest/filesystems/proc.html)

```bash
cat /proc/25/status # get the overal status
cat /proc/25/mem    # get the memory information
```

#### Linux Commands

- `/dev/null` is a virtual null device used to discard any output redirected to it.

### SQL

#### View & Snapshot (materialized views)

- `View` is a virtual table that does not store its own data but rather displays data that is stored in other tables.
  - For example: create a view that only contains transactions belong to government agencies' accounts (IRAS, AGD)

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

- `snapshot` is a _read-only_ replica of a target master table from a single point in time.
  - snapshots are updated from one or more master tables through individual batch updates, known as a **refreshes**
  - snapshots can be helpful for regional offices or sales forces that do not require the complete corporate data set
  - For example: master table is Murex table that contains all history records about a murex transaction, but we can have a snapshot of murex table to keep track on the latest status of that transaction instead of all history records
