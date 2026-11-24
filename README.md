[# CareLoop-Clinics-No-Show-Guard


*From raw bookings to predictive insights and AI-assisted decisions.*

## Project Overview

CareLoop Clinics operates eight outpatient clinics across six Indian cities. Missed appointments result in unused doctor slots and reduced clinic efficiency.

This project analyses appointment booking data to understand where and why no-shows happen, predicts which appointments are at risk, and uses Generative AI to extract structured reasons from patient follow-up notes.

The project follows an end-to-end data analytics workflow using Python, SQL, Machine Learning and Generative AI.

## Business Question

**Which appointments are most likely to be missed, why do patients miss them, and what should CareLoop do first?**

## Project Workflow

### Part 1: Python and Data Foundations
- Read and validate raw appointment data using Python.
- Clean missing, duplicate and inconsistent records using Pandas.
- Analyse distributions and outliers using NumPy.
- Enrich clinic data using the Open-Meteo API.
- Export cleaned datasets and SQL insert statements.

### Part 2: SQL Analysis
- Create and populate a relational database.
- Calculate no-show rates by clinic.
- Analyse the relationship between booking lead time and no-shows.
- Track monthly no-show trends using CTEs and `LAG()`.
- Rank clinics within each city.

### Part 3: Machine Learning
- Prepare features and split the data into training and testing sets.
- Train Logistic Regression, Decision Tree and Random Forest models.
- Tune model parameters using GridSearchCV.
- Compare models using cross-validation and ROC-AUC.
- Select a classification threshold using out-of-fold predictions.
- Generate risk scores for test appointments.

### Part 4: Generative AI Analysis
- Use the Gemini API to analyse patient follow-up notes.
- Validate structured responses using Pydantic.
- Classify reasons for missed appointments into predefined categories.
- Compare prompt versions and test response validation.
- Combine AI-extracted reasons with appointment data for further analysis.

## Key Findings

The following figures should be updated with the final outputs from your notebooks and SQL queries.

1. **Python:** Cleaned 1,020 raw appointment records into **990 rows and 16 columns**, with 218 no-shows (22.0%).
2. **SQL:** Analysed **990 appointments across 8 clinics**, identifying [insert the clinic with the highest no-show rate and its rate].
3. **Machine Learning:** Selected **[model name]** with a test ROC-AUC of **[AUC]** and a classification threshold of **[threshold]**.
4. **Generative AI:** Analysed the first **10 follow-up notes**, with **[insert number] valid classifications**, and identified [insert the most frequent reason, if supported by your results].

## Business Recommendation

Based on the analysis, CareLoop Clinics should prioritise appointments with higher predicted no-show risk for proactive follow-up. The cleaned dataset contains 990 appointments, including 218 no-shows (22.0%). The clinic-level analysis found [insert clinic finding], while the lead-time analysis showed [insert relevant finding]. The selected [model name] achieved a ROC-AUC of [AUC] at a threshold of [threshold]. The follow-up note analysis identified [insert supported reason or finding]. CareLoop should use these findings to guide reminder and follow-up efforts, while monitoring the results before introducing a wider intervention.

## Model Selection

**Selected Model:** [Model name]

**Test ROC-AUC:** [Insert value]

**Classification Threshold:** [Insert value]

**Reason for Selection:** [Explain why this model was selected based on cross-validation performance and your model comparison.]

## Limitations

1. Only the first 10 follow-up notes were analysed using Generative AI. This is an illustration and may not represent the actual reasons for missed appointments across all clinics.
2. The train-test split is random rather than based on past-to-future appointment dates, so it may not fully represent how the model performs on future bookings.
3. The data are observational. Relationships between variables and no-shows do not necessarily establish cause and effect.

## Tools and Technologies

- **Python:** Pandas, NumPy, CSV, JSON, Requests
- **Database:** MySQL
- **Machine Learning:** Scikit-learn
- **Generative AI:** Gemini API, Pydantic
- **Data Enrichment:** Open-Meteo API
- **Development Environment:** Jupyter Notebook / Google Colab

## Repository Structure

```text
CareLoop-Clinics-No-Show-Guard/
│
├── data/
│   ├── appointments.csv
│   ├── clinics.csv
│   └── followup_notes.csv
│
├── 01_ingest_clean.ipynb
├── rejected_rows.json
├── appointments_clean.csv
├── clinics_enriched.csv
├── load_data.sql
│
├── 02_queries.sql
│
├── 03_model.ipynb
├── test_risk_scores.csv
│
├── 04_genai.ipynb
├── notes_analysed.csv
│
└── README.md
```

## Project Objective

This project demonstrates how raw operational data can be transformed into meaningful business insights through data cleaning, SQL analysis, predictive modelling and AI-assisted text analysis.

The ultimate goal is to help CareLoop Clinics identify high-risk appointments earlier and make better-informed decisions about patient follow-ups.

---

**Note:** This project is developed for educational and analytical purposes.
