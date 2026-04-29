###Healthcare No-Show Prediction & Patient Segmentation System

## Project Overview

This project is an end-to-end healthcare data analytics solution that combines **Business Intelligence (Power BI)** with **Machine Learning (Python)** to improve operational efficiency, reduce missed appointments, and support data-driven decision-making.

Using a dataset of **5,000+ patients** and **20,000+ appointments**, the project uncovers critical inefficiencies and builds predictive systems to proactively address them.



## Business Problem

Healthcare providers face significant operational and financial losses due to high appointment no-show and cancellation rates.

In this dataset:
- **66% of appointments were not completed**
- Leads to wasted resources and revenue leakage
- Poor scheduling efficiency and patient management

### Project Goals:
- Predict which patients are likely to miss appointments  
- Identify behavioral patterns across patient groups  
- Enable targeted interventions to improve attendance and revenue  



## Project Structure

healthcare-analytics-project/

│
├── data/ → Raw and processed datasets

├── sql/ → Data extraction and transformation queries

├── powerbi/ → Power BI dashboard (.pbix file)

├── notebooks/ → Machine Learning notebooks (Classification & Clustering)

├── assets/ → Visuals (dashboard screenshots, model outputs)

├── powerpoint_presentation ([structured executive-style presentation](https://drive.google.com/file/d/1oTVWKHrvHAJoAtvlOmIowgl54abUct9j/view?usp=sharing))

└── README.md




## Tech Stack

**Data Engineering:**
- SQL (MySQL)
- Python (Pandas, NumPy)

**Business Intelligence:**
- Power BI (DAX, Data Modeling)

**Machine Learning:**
- Scikit-learn (Random Forest, K-Means)
- SMOTE (Imbalanced Data Handling)
- StandardScaler



## Data Modeling

A relational data model was designed to integrate multiple healthcare datasets:

- **Patients → Appointments** (1:M)  
- **Appointments → Billing** (1:M)  
- **Appointments → Doctors** (M:1)  
- **Appointments → Diagnosis** (1:M)  
- **Patients → Medications** (1:M)  

This structure enabled efficient aggregation across clinical, financial, and operational metrics.



## Feature Engineering

To enhance model performance and extract deeper insights, the following features were created:

- **Age** (derived from Date of Birth)  
- **Age Groups** (1–4, 5–14, 15–19, 20–39, 40–64, 65+)  
- **Appointment Month**  
- **Day of Week**  
- **Encoded variables** (Gender, City)

These features helped uncover patterns influencing patient attendance behavior.



##Part 1: Descriptive Analytics (Power BI)

An interactive dashboard was built to analyze healthcare performance across multiple dimensions:

### Key Insights:

- **Only 34% of appointments were completed**
- No-show rate ≈ 33%, Cancellation rate ≈ 33%
- **Insurance contributes 57% of total revenue**
- Patient volume does NOT directly correlate with revenue
- Chronic conditions (e.g., Hypothyroidism, Hypertension) dominate
- Orthopedics generates the highest revenue and diagnosis volume



##Part 2: Predictive Modeling (No-Show Classification)

A **Random Forest Classifier** was developed to predict patient no-shows.

### Key Techniques:
- Applied **SMOTE** to handle class imbalance  
- Engineered temporal and behavioral features  
- Evaluated using Confusion Matrix, Precision, and Recall  

### Model Performance:
- Successfully identified ~80% of no-show cases  
- Flagged over **3,300 high-risk appointments**  
- Reduced scheduling uncertainty significantly  



## Part 3: Patient Segmentation (K-Means Clustering)

To move beyond prediction, unsupervised learning was used to identify behavioral patterns.

### Key Insight:
Not all patients behave the same — a single reminder strategy is ineffective.

### Identified Personas:
- **Reliable Patients** (Low Risk)
- **Moderate Risk Group**
- **High-Risk No-Show Group**
- **Vulnerable Seniors** (High miss rates)
- **High-Intensity Patients** (Multiple medications, critical care needs)



## Business Recommendations

Based on insights from both analytics and machine learning:

- **Targeted Reminders:** Focus on high-risk patient groups  
- **Logistical Support:** Provide transport solutions for elderly patients  
- **Care Coordination:** Monitor high-intensity patients closely  
- **Smart Scheduling:** Prioritize high-risk slots with predictive insights  



## Impact

This project demonstrates how healthcare systems can shift from:

> Reactive → Proactive Decision-Making

By combining dashboards with machine learning:
- Predict patient behavior before it happens  
- Optimize hospital operations  
- Improve patient outcomes and revenue performance  



## Presentation & Resources

- **Power BI:** *([Power BI Dashboard](https://docs.google.com/presentation/d/1F0UyNVeUZtaAz6usr2oOz0A0VoQMHGj4/edit?usp=sharing&ouid=102368251228123665722&rtpof=true&sd=true))*  
- **Powerpoint Presentation:** *([Structured Executive-Style Presentation](https://drive.google.com/file/d/1oTVWKHrvHAJoAtvlOmIowgl54abUct9j/view?usp=sharing))*  
- **Machine Learning Notebooks:** *([Clustering](https://colab.research.google.com/drive/1REFAVpikRebEYQ_6zFY4dY9KdkkeLbSX?usp=sharing)), ([Classification](https://colab.research.google.com/drive/1kz7skrIqGQcul9e62-_c8aTg96a7Z_pT?usp=sharing))*  



## Author

**Uda Mary Imeabasi**  
Data Science & Analytics | ETL Pipeline Engineering • Predictive Analytics • ML | Health Educator | Python & SQL Specialist | Women Techster Fellow 



## Acknowledgment

This project showcases the integration of data analytics, machine learning, and business strategy to solve real-world healthcare challenges.
