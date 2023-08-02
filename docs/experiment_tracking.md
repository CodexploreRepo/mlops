# Experiment Tracking

## What is experiment tracking ?

- Experiment tracking is the process of keeping track of all the **relevant information** from an ML experiment, which includes:
  - Source code
  - Environment
  - Data
  - Model
  - Hyperparameters
  - Metrics

## MLflow

### What is MLflow

- **MLflow** is “An open source platform for the machine learning lifecycle”
- One ` experiment` has many `runs`
  - Each run keeps track of
    - Parameters
    - Metrics
    - Metadata
    - Artifacts
    - Models

### MLflow On-boarding

- To run the MLflow UI locally we use the command:
  - `--backend-store-uri db_type:///path_to_db` to store the result
    - In this case, we use `sqlite` database and path `./mlflow.db`

```
# need to cd to the folder where mlflow.db located
mlflow ui --backend-store-uri sqlite:///mlflow.db
```

### Mlflow Model Logging
