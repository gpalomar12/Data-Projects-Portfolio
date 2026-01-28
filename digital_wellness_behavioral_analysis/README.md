# 🧠 Digital Wellness & Lifestyle Behavioral Analysis

### 📋 Project Type:
Exploratory Data Analysis (EDA) + Predictive Modeling + Dashboard Visualizaiton

### ⚙️ Tools Used:
Python, Pandas, Scikit-learn, Looker Studio, Matplotlib, Seaborn

***

## Objective
An exploratory data analysis of smart device usage habits to uncover consumer health trends and identify opportunities for improving engagement and digital wellness.

The goal is to:
- Identify behavioral patterns linked to stress, sleep, and mental health
- Derive new behavioral metrics that represent lifestyle balance
- Develop a predictive model for wellness outcomes
- Visualize actionable insights using an interactive dashboard

## What You Will Find in This Project
- A complete data preparation workflow, including encoding, grouping, and feature creation
- Exploratory data analysis with visualizations of behavioral and wellness patterns
- A regression model predicting mental health outcomes
- A Looker Studio dashboard for interactive exploration
- Actionable insights for wellness strategy and product design


#### Data Source: [Kaggle-Tech Use and Stress Wellness Dataset](https://www.kaggle.com/datasets/nagpalprabhavalkar/tech-use-and-stress-wellness)
#### Source Code: [View Jupyter Notebook](scripts/wellness_data_analysis.ipynb)



***

## Data Overview & Preparation

- Encoded categorical variables (gender, location_type)
- Grouped continuous variables (e.g., age → age_group)
- Converted boolean fields for efficient computation
- Scaled numeric fields to normalize behavior metrics

 **Demographics Overview**
 <img width="1225" height="334" alt="data_demographic_distribution_overview" src="https://github.com/user-attachments/assets/89f20a4f-a02a-4c4f-bd8b-ed5dd7079173" />
 **Insights from Demographics**
>**Age:**
>The participant pool spans a wide range, with strong representation across all major adult life stages (20-
>70+).  This balanced distribution enables meaningful comparisons between younger and older populations in terms of
>stress, screen time, and wellness behavior.
>
>**Gender:**
>The dataset includes a balanced mix of gender categories, ensuring that subsequent analysis of lifestyle
>and mental health patterns are inclusive and not biased toward a single group.
>
>**Location Type:**
>Respondents are distributed across **urban**, **suburban**, and **rural** environments.  This diversity allows us to
>explore how environmental context influences digital behavior, stress levels, and overall well-being.


#### Inspecting the Dataset

```
# Preview the dataset structure
data_df.info()

```


<img width="665" height="600" alt="exploring_data_structure_info" src="https://github.com/user-attachments/assets/2ef82f4a-6c55-40cb-b5e2-6645468e3e94" />


> **Observation:**  
> The dataset includes 25 columns, mixing numerical, categorical, and boolean variables.
> No missing values were observed, and data types align with expected formats (floats for
> continuous measures, integers for counts, objects for categorical fields)

#### Data Cleaning & Type Adjustments

```
# Ensure boolean fields are formatted 
bool_columns = ['uses_wellness_apps','eats_healthy']
data_df[bool_columns] = data_df[bool_columns].astype(bool)

# Convert categorical variables
cat_columns = ['gender', 'location_type']
data_df[cat_columns] = data_df[cat_columns].astype('category')

```

>**Explanation:**  
>Ensuring correct data types allows for efficient aggregation, proper encoding, and a reduction in potential
>modeling errors.

#### Creating Age Groups

```
#defining age bins and labels 

bins= [0, 20, 30, 40, 50, 60, 70, float('inf')]
labels = ['<20','20-30', '30-40', '40-50', '50-60', '60-70', '70+']

# Create new age group column
data_df['age_group'] = pd.cut(data_df['age'], bins=bins, labels=labels, right=False)

```

>**Insight:**  
>Grouping continous variables like *age* into meaningful segments simplifies visualization and helps
>analyze mental health or digital behaviors by life stage.

#### Encoding Categorical Variables

```
# Encode gender and location type

data_df['gender_encoded'] = gender_encoder.fit_transform(data_df['gender'])
data_df['location_encoded'] = gender_encoder.fit_transform(data_df['location_type'])

```

>**Explanation:**  
>Label encoding converts categorical variables into a numeric format, enabling them to be used in
>regression or machine learning models later in the pipeline.

#### Summary Statistics

```
# Quick summary transposing the table and rounding decimals to 2 significant figures

data_df.describe().T.round(2)

```

<img width="780" height="753" alt="descibe_data" src="https://github.com/user-attachments/assets/dc9582a6-a616-45bb-ba74-75331e7321b7" />


>**Observation:**  
> Continuous variables such as screen time, sleep hours, and physical activity exhibit wide variation,
>suggesting diverse behavioral patterns across participants.
>This diversity will be key when analyzing correlations between lifestyle habits and mental health
>outcomes.

**Summary**
>The dataset is clean, well-structured, and ready for exploration.
>With demographic grouping and encoding complete, the data can now be analyzed to uncover how
>digital engagement and wellness behaviors relate to mental health outcomes.

***

#### Feature Engineering
New behavioral and lifestyle indicators were created to capture overall wellness balance better:

|**Feature**|**Description**|
|-----------|---------------|
|total_screen_hours|Combined device usage (phone, laptop, tablet, TV)|
|sleep_efficiency|Sleep quality normalized by duration|
|stress_to_activity_ratio|Stress adjusted by activity hours|
|health_behavior_score|Composite of mindfulness, healthy eating, and wellness app use|
|mood_vs_stress_diff|Emotional balance indicator|
|mindfulness_effect|Mindfulness buffering impact on stress|

**Validate New Feature Distributions**


<img width="617" height="309" alt="engineered_columns_validation" src="https://github.com/user-attachments/assets/edd2f5ae-19bc-4477-ab10-d24b1db42579" />  


>**Observation:**
>The engineered features have been successfully scaled or normalized, ensuring they are suitable for
>regression analysis and cross-variable comparisons.

**Summary**
>Feature engineering transforms raw behavioral data into interpretable lifestyle metrics that represent
>how individuals balance technology, sleep, activity, and self-care.
>These features now serve as inputs for modeling the predictors of mental health outcomes.


***

### Exploratory Data Analysis

The EDA uncovered clear relationships between digital habits and mental well-being:
- **Sleep Quality** strongly correlates with higher mental health scores
- **Physical activity** reduces stress and improves mood
- **Stress** has the largest negative correlation across all wellness outcomes
- **Caffeine intake** shows a mild negative relationship with wellness
- **Mindfulness practice** moderately improves emotional balance

**Health Behavior Score Distribution**

<img width="863" height="525" alt="Distribution of health behavior score" src="https://github.com/user-attachments/assets/911ebbb8-2c2e-4159-8ea0-288cfb57331c" />  


>**Insight:**
>
>The **Health Behavior Score**, which combines healthy eating, mindfulness, and wellness app usage, is skewed
>toward moderate values.
>This suggests that while some individuals adopt healthy habits consistently, most exhibit moderate
>wellness engagement, leaving room for behavioral improvement.


**Behavioral Balance: Health Behavior vs Mental Health**

<img width="880" height="546" alt="health_behavior_vs_mental_health" src="https://github.com/user-attachments/assets/ff8c9b4a-3007-4c97-afaa-68728dd2e314" />  

>**Insight:**
>
>The strong positive correlation indicates that **healthier daily behaviors**, such as mindfulness, exercise,
>and balanced routines, are closely related to **better mental health outcomes.**
>This finding sets the stage for our **feature engineering and modeling**, where we can quantify the relative
>impact of each behavioral factor.

***

### Modeling & Insights
A multiple linear regression model was trained to quantify how behavioral and lifestyle variables  
predict mental health outcomes.

#### Model Performance Summary

```
# R**2 and RSME evaluation

print(f"R² Score: {r2:.3f}")
print(f"RMSE: {rmse:.3f}")
```

**Output:**
|**R<sup>2</sup> Score**|**RMSE**|
|-------------------|----|
| 0.856|5.071|

>The model explains roughly 86% of the variance in mental health score, suggesting that the behavioral and
>wellness features are strong predictors of psychological outcomes.


#### Top predictors of mental health:

|**Rank**|**Feature**|**Effect**|**Direction**|
|--------|-----------|----------|-------------|
|1|Sleep Quality|Strong Positive|⬆️ Improves wellness|
|2|Physical Activity|Moderate Positive|⬆️ Reduces Stress|
|3|Stress Level|Strong Negative|⬇️ Lowers mental health|
|4|Mindufulness Minutes|Mild Positive|⬆️ Increase balance|
|5|Caffeine Intake|Mild Negative|⬇️ Reduces sleep quality|  

  

<img width="1092" height="514" alt="Feature_importance_for_predicting_Mental_Health_Score" src="https://github.com/user-attachments/assets/d7718f95-677f-4359-9bfc-748b5dfce2b5" /> 


***

### Dashboard & Visualization
An interactive Looker Studio dashboard was designed to visualize findings and allow dynamic 
exploration by gender, age, and location.



#### Digital Wellness Overview

Provides a population-level snapshot of wellness metrics:
- Average sleep hours, stress level, and activity by age
- Feature importance ranking of behavior predictors
- Caffeine intake vs mental health correlation

<img width="821" height="581" alt="overall_dashboard_view_page1" src="https://github.com/user-attachments/assets/8a55ee74-2f10-4275-97f0-3dcb784d7fb1" />  



#### Behavioral Patterns & Mental Health

Explore detailed behavioral relationships:
- Mindfulness vs Stress Level ➡️ longer session = lower stress
- Physical Activity vs Mental Health ➡️ higher activity improves wellness
- Mood vs Sleep Efficiency ➡️ better sleep leads to improved mood
- Social Ratio vs Mood Rating ➡️ excessive social media use lowers mood


<img width="821" height="581" alt="image" src="https://github.com/user-attachments/assets/30cfce00-8e62-409e-b649-af2abee73510" />


### Key Takeaways
- **Restful sleep and regular exercise** are the strongest contributors to mental wellness
- **Stress** remains the most harmful factor
- **Healthy behaviors** (mindfulness, diet, wellness apps) add incremental benefits
- Engineered lifestyle indicators explained ~**86% of mental health** variance
- Dashboard enables interactive analysis for targeted wellness strategy design


### Conclusion

This project bridges **data science and human behavior**, transforming raw digital lifestyle data into actionable 
wellness insights.
The combination of Python-based modeling and Looker Studio visualization offers a compelling end-to-end
example of **data-driven mental health analysis**.

[Home](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/README.md)
