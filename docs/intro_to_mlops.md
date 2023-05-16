# Introduction to MLOps

## What is Machine Learning Operationalisation (MLOps) ?

MLOps brings DevOps principles to machine learning. It is a set of best practices to put ML models into production and automate the life-cycle.

MLOps could help to

- Track model iterations and reproduce results reliably
- Monitor model performance and deliver domain-specific metrics for ML
- Deliver models safely and automatically into production.

## MLOps Life-cycle

```mermaid
  graph LR
    subgraph ML Model
    D([Monitor]) -.->|retrain when performance drops| B([1. Train])
    B --> C([2. Deploy])
    C --> D([3. Monitor])
    end
    A([Data & <br>Problem Design]) --->|if ML helps solve problem| B
```

- **Data & Problem Design**: Choose machine learning to solve a problem when there is no other more straightforward approach and the data has sufficient quality.
- 1️⃣ **Train**: Train and evaluate ML models and choose the best performing one.
- 2️⃣ **Deploy**: Integrate the chosen model into the production environment (web service, module, embedded system, etc.)
- 3️⃣ **Monitor**: Capture the model's performance in the production environment and define a threshold for an acceptable value.

## MLOps Maturity Model

The extent to which MLOps is implemented into a team or organization could be expressed as maturity. A framework for classifying different levels of MLOps maturity is listed below:
