# MLOps Experience

## Model Training

- Feature's column name standardisation
  - Problem:
    - Model Training & Pickling: column names are mixed of upper case and lower case, e.g. `Tenor_New`, `SORA_1m`
    - Model Inference: column names which are loaded from Feature store are standardised (all lower-case), e.g. `tenor_new`, `sora_1m`
      - Therefore, when performing `model.predict()`, the pickled model is unable to regcognise those columns `tenor_new`, `sora_1m`
  - Solution: during the training, all column names should be standardised (all lower-case)
