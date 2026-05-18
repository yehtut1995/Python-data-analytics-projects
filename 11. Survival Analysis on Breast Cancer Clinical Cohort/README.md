# Advanced Breast Cancer Survival Analysis (METABRIC Cohort)

### Domain: Health Data Analytics & Biostatistics

## Project Overview
This project delivers an end-to-end biostatistical survival analysis utilizing clinical data from the **Molecular Taxonomy of Breast Cancer International Consortium (METABRIC)** cohort. The workflow transitions systematically from programmatic data sanitization and exploratory visualizations to non-parametric group testing and multivariate semi-parametric hazard modeling. 

The primary objective is to evaluate time-to-event outcomes (overall survival) and uncover how diagnostic indicators, clinical staging, and treatment selections interact to influence patient prognosis.

---

## Key Core Technical Features
* **Programmatic Data Pipeline:** A centralized, reproducible data cleaning function that automatically sanitizes string variances, converts complex textual patient states into biostatistical metrics, enforces logical constraints on clinical timelines, and engineers binary dummies optimized for regression.
* **Non-Parametric Estimation:** Group-stratified **Kaplan-Meier survival functions** tracking long-term survival trajectories alongside **Log-Rank statistical testing** to assess disparities across categorical cohorts.
* **Semi-Parametric Multivariate Modeling:** Implementation of a **Cox Proportional Hazards (Cox PH) model** via the `lifelines` engine to isolate independent **Hazard Ratios ($HR$)** while simultaneously controlling for clinical and molecular covariates.
* **Confounding Analysis:** Deep epidemiological evaluation uncovering hidden data confounding—specifically proving how unadjusted survival gaps observed in treatment routes (e.g., surgical type) are driven entirely by underlying baseline disease severity (`Tumor Stage`).

---

## Model Performance & Key Findings

* **Predictive Discrimination:** The trained Cox Proportional Hazards framework achieved a strong **Concordance Index ($C$-index) of 0.69**.
* **Primary Prognostic Driver:** **Tumor Stage** is identified as the single strongest independent risk factor ($HR = 2.16, p < 0.005$); advancing a single stage more than doubles a patient's mortality risk at any given time point.
* **Continuous Covariates:** Each additional year of **Age at Diagnosis** ($HR = 1.05, p < 0.005$) and millimeter of **Tumor Size** ($HR = 1.01, p < 0.005$) incrementally and precisely compounds mortality hazards.
* **Unveiling Treatment Confounding:** Categorical indicators such as `Type of Breast Surgery (Mastectomy)`, `ER Status`, and standard adjuvant therapies lost statistical significance ($p > 0.05$) under multivariate adjustment, demonstrating that their raw correlations with survival were heavily confounded by clinical staging and age distribution.
