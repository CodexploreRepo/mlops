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

### MLflow Server

- To run the MLflow UI locally we use the command:
  - `--backend-store-uri db_type:///path_to_db` to store the result
    - In this case, we use `sqlite` database and path `./mlflow.db`

```
# need to cd to the folder where mlflow.db located
mlflow ui --backend-store-uri sqlite:///mlflow.db
```

- To setup mlflow server
<p align="center"><img src="../assets/img/mlflow_server.png"></p>

```shell
mlflow server \
  --backend-store-uri postgresql://user:password@postgres:5432/mlflowdb \
  # Artifact access is enabled through the proxy URI 'mlflow-artifacts:/',
  # giving users access to this location without having to manage credentials
  # or permissions.
  --artifacts-destination s3://bucket_name \
  --host remote_host
```

### Mlflow Model Logging

- Each experiment run should start with below code

```Python
data_desc = f"Description: train data is from 2022-01 and test-data is from 2022-02"
with mlflow.start_run(run_name='logistic-regression', # if leave empty, mlflow will choose a random name for each exp run
                      tags={"mlflow.note.content": data_desc}):
    # Training Code is added below here
    pass

```

#### Autolog

- Autolog will automatically log all parameters related to the model that being trained. Depends on the model type, we can call corresponding `autolog()`
  - Tensorflow: `mlflow.tensorflow.autolog()`
  - XGBoost: `mlflow.xgboost.autolog()`

#### Log Individual Artefact

- `mlflow.log_param()` to log model's parameter
- `mlflow.log_metric()` to log model's metrics for ex: `mlflow.log_metric("rmse", rmse)`
- `mlflow.set_tag()` add **tag** during model logging via `mlflow.set_tag("model", "xgboost")`, so later can search in MLflow UI
  - Search `tags.model='xgboost'` to find exp with the tag `model='xgboost'`
  <p align="center"><img src="../assets/img/mlflow_tag.png"></p>
- `mlflow.<framework>.log_model()` to log model pickle where `framework=[sklearn, pytorch, tensorflow, xgboost]`

```Python
# Log the preprocessor
with open('models/processor.bin', 'wb') as f_out:
    pickle.dump(dv, f_out)

mlflow.log_artifact(
  local_path="models/processor.bin", # local path
  artifact_path="processor"          # folder in mlflow server
)

# Log model & register
mlflow.sklearn.log_model(
  sk_model=lr,
  artifact_path="models", # path on the mlflow server's artifact
  registered_model_name="linear-regression-baseline"
)
```
- Load the logged model
```Python
loaded_model_uri = "runs://.../models"
# Method 1: This way will log model as "mlflow.xgboost" flavor
loaded_model = mlflow.pyfunc.load_model(loaded_model_uri)
# Method 2:
xgboost_model = mlflow.xgboost.load_model(loaded_model_uri)

```