# Cron Job

## Introduciton

- Cron Job is a feature of Linux
- To list down the cron jobs available: `crontab -l`

## Usage

- Run the script alone:

```bash
chmod +x run.sh
./run.sh
```

- Define a cron job
  - `* * * * *` cron pattern to run every minute

```bash
crontab -e # to open the cron job, and add below script
* * * * * cd /Users/codexplore/Developer/repos/mlops/src/cronjob && /usr/bin/env bash run.sh >> logs/cron_iris.log 2>&1
```
