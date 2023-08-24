# Experiment Tracking

## Introduction

### What is Experiment Tracking ?

- Experiment tracking is the process of keeping track of all the **relevant information** from an ML experiment, which includes:
  - Source code
  - Environment
  - Data
  - Model
  - Hyperparameters
  - Metrics

### Model Management

ML model management starts when models go to production:

- Streamlines moving models from experimentation to production
- Helps with model versioning
- Organizes model artifacts in an ML model registry
- Helps with testing various model versions in the production environment
- Enables rolling back to an old model version if the new one seems to be going crazy

<p align="center"><img src="../assets/img/model_management.webp"></p>

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

### MLflow Tracking Server

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

### Mlflow Model Format

<p align="center"><img src="../assets/img/mlflow_model_format.png"></p>

### Mlflow Model Logging

- Each experiment run should start with methods

```Python
# Method 1:
data_desc = f"Description: train data is from 2022-01 and test-data is from 2022-02"
with mlflow.start_run(run_name='logistic-regression', # if leave empty, mlflow will choose a random name for each exp run
                      tags={"mlflow.note.content": data_desc}
                      ) as run:
    # Training Code is added below here
    pass

```

```Python
# Method 2
# Start the mlflow run
run = mlflow.start_run()

# Training & Evaluation procecess
pass
# End the experiment run
mlflow.end_run()

```

- You can retrieve the run information via `run` variable

```Python
# retreive the run infomation via "run" variable
print(run.info.run_id)
print(run.data.params)
```

#### Autolog

- Autolog will automatically log all parameters related to the model that being trained. Depends on the model type, we can call corresponding `autolog()`
  - Sklearn: `mlflow.sklearn.autolog()`
  - Tensorflow: `mlflow.tensorflow.autolog()`
  - XGBoost: `mlflow.xgboost.autolog()`

#### Log Individual Artefact

- `mlflow.log_param()` to log model's parameter
- `mlflow.log_metric()` to log model's metrics for ex: `mlflow.log_metric("rmse", rmse)`
- `mlflow.set_tag()` add **tag** during model logging via `mlflow.set_tag("model", "xgboost")`, so later can search in MLflow UI
  - Search `tags.model='xgboost'` to find exp with the tag `model='xgboost'`
  <p align="center"><img src="../assets/img/mlflow_tag.png"></p>

##### Log Model

- `mlflow.<framework>.log_model()` to log model pickle where `framework=[sklearn, pytorch, tensorflow, xgboost]`

```Python
# Log model & register
mlflow.sklearn.log_model(
  sk_model=lr,
  artifact_path="models", # path on the mlflow server's artifact
  registered_model_name="linear-regression-baseline"
)
```

- `mlflow.log_artifact()` we also can pickle the processor and model and the log with via `log_artifact()` method

```Python
# Log the preprocessor
with open('models/processor.bin', 'wb') as f_out:
    pickle.dump(dv, f_out)

mlflow.log_artifact(
  local_path="models/processor.bin", # local path
  artifact_path="processor"          # folder in mlflow server
)
```

##### Log Pipeline

- **Signatures** are use by MLflow to know what type of inputs are expected for a given model.
  - This allows the model builder to be explicit about which types are being expected as the pipeline can encode those values automatically so we can take categorical values, for example, `thal` col, in string format.

```Python
from mlflow.models import infer_signature

signature = infer_signature(X_test, y_test)
print(signature)
"""
inputs:
  ['age': long, 'sex': long, 'cp': long, 'trestbps': long, 'chol': long, 'fbs': long, 'restecg': long, 'thalach': long, 'exang': long, 'oldpeak': double, 'slope': long, 'ca': long, 'thal': integer]
outputs:
  ['target': long]
"""

```

- Since `pipeline` is a Scikit-Learn object, we will log using `sklearn` flavor instead of model flavor, say `xgboost`.

```Python
pipeline = Pipeline(steps=[("encoding", encoder), ("model", xgboost_classifier)])
 # Since `pipeline` is a Scikit-Learn object, we will log using `sklearn`  flavor instead of `xgboost`
mlflow.sklearn.log_model(pipeline, artifact_path="pipeline", signature=signature)
```

#### Load/Download Model & Artifact

##### Load Model

- Load the logged model via `mlflow.pyfunc.load_model` or `mlflow.<framework>.load_model`

```Python
loaded_model_uri = "runs://.../models"

# Method 1: This way will load model as "mlflow.xgboost" flavor
loaded_model = mlflow.pyfunc.load_model(loaded_model_uri)
# Method 2: This way will directly model type of "xgboost" instead of "mlflow.xgboost" flavor
xgboost_model = mlflow.xgboost.load_model(loaded_model_uri)

```

- You also can download the model artefact and load it locally

##### Download Model & Artifact

- You can download any artifact using the method `download_artifact`

```Python
model_local_path = f"/Users/quannguyen/repos/mlops/model/{MLFLOW_EXPERIMENT_NAME}"

file_path = mlflow.artifacts.download_artifacts(
    run_id=retrieved_run.info.run_id,
    artifact_path="model", # path on mlflow server
    dst_path=model_local_path
)
# can louse load model with local path
classifier = mlflow.xgboost.load_model(f"{model_local_path}/model")
```

##### Retreive Artifacts

```Python
client = mlflow.tracking.MlflowClient()
client.list_artifacts(run_id=run.info.run_id)
```
