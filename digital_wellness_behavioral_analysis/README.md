# 🧠 Digital Wellness & Lifestyle Behavioral Analysis

### 📋 Project Type:
Exploratory Data Analysis (EDA) + Predictive Modeling + Dashboard Visualization

### ⚙️ Tools Used:
Python, Pandas, Scikit-learn, Looker Studio, Matplotlib, Seaborn

***

## Objective
An exploratory data analysis of smart device usage habits to uncover consumer health trends and identify opportunities for improving engagement and digital wellness.  

### 📊 Business Context & Objective  

**The Challenge:**
Wearable device companies and digital wellness platforms need to understand how users' technology habits impact their mental and physical health. Without this understanding, product teams struggle to design features that genuinely improve user well-being or identify which interventions will drive sustained engagement.  

**The Opportunity:**
By analyzing the relationship between digital behaviors (screen time, app usage, sleep patterns) and wellness outcomes (stress levels, mental health scores, mood), companies can prioritize high-impact features and create data-driven wellness strategies.  

**This Analysis:**
This project uses smart device usage data to uncover consumer health trends and quantify which behavioral factors most strongly predict wellness outcomes. The analysis provides actionable insights for product design, user segmentation, and targeted intervention strategies.

### Analysis Goals  

**Primary Objective:**  
Develop a predictive model that identifies which lifestyle and digital behaviors drive mental health outcomes, enabling wellness platforms to prioritize feature development and personalize user experiences.  

**Supporting Objectives:**

Identify behavioral patterns linked to stress, sleep quality, and mental health across demographic segments
Engineer lifestyle metrics that capture overall wellness balance (e.g., stress-to-activity ratio, sleep efficiency)
Quantify feature importance to guide product teams on where interventions will have the greatest impact
Create an interactive dashboard for stakeholders to explore wellness patterns by age, gender, and location  

**Deliverables:**

Predictive model explaining ~86% of mental health variance
Ranked list of behavioral predictors with quantified effects
Interactive Looker Studio dashboard for dynamic exploration
Strategic recommendations for wellness product development

## What You Will Find in This Project

This portfolio piece demonstrates a **complete data science workflow** from business problem to operational dashboard:

| Section | Demonstrates |
|---------|--------------|
| **Business Context** | Stakeholder communication and problem framing |
| **Data Preparation** | Data cleaning, type handling, and encoding strategies |
| **Feature Engineering** | Domain knowledge application to create meaningful metrics |
| **Exploratory Analysis** | Statistical insight extraction and visualization |
| **Predictive Modeling** | Regression analysis with interpretable coefficients |
| **Dashboard Development** | Operational analytics and decision-support tools |
| **Strategic Recommendations** | Translation of technical findings to business action |


#### Data Source: [Tech Use and Stress Wellness Dataset](https://www.kaggle.com/datasets/nagpalprabhavalkar/tech-use-and-stress-wellness) from Kaggle
#### Source Code: [View Jupyter Notebook](scripts/wellness_data_analysis.ipynb)



***

## Data Overview & Preparation

- Encoded categorical variables (gender, location_type)
- Grouped continuous variables (e.g., age → age_group)
- Converted boolean fields for efficient computation
- Scaled numeric fields to normalize behavior metrics

### Data Source & Limitations
**Dataset:** [Tech Use and Stress Wellness Dataset](link_to_kaggle) from Kaggle  
**Sample Size:** 5,000 participants  
**Data Type:** Cross-sectional survey data (self-reported)  
**Time Period:** Single-point-in-time snapshot (not longitudinal)

**Key Limitations:**
- **Self-reported data**: Responses subject to recall bias and social desirability bias
- **Cross-sectional design**: Cannot establish causation—only associations between variables
- **Synthetic/survey data**: May not fully represent real device telemetry from wearable platforms
- **Limited demographics**: Dataset includes age, gender, and location type but lacks socioeconomic status, ethnicity, or clinical mental health diagnoses

These limitations are addressed through careful interpretation of findings as correlations rather than causal relationships.

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


### Inspecting the Dataset  

The following code provides an initial assessment of data structure, types, and completeness:

```

# Preview the dataset structure
data_df.info()

```


<img width="665" height="600" alt="exploring_data_structure_info" src="https://github.com/user-attachments/assets/2ef82f4a-6c55-40cb-b5e2-6645468e3e94" />


> **Observation:**  
> The dataset includes 25 columns, mixing numerical, categorical, and boolean variables.
> No missing values were observed, and data types align with expected formats (floats for
> continuous measures, integers for counts, objects for categorical fields)

### Data Cleaning & Type Adjustments  
The following code ensures proper data types for efficient processing and to prevent type-related errors during modeling:

```
# Ensure boolean fields are formatted 
bool_columns = ['uses_wellness_apps','eats_healthy']
data_df[bool_columns] = data_df[bool_columns].astype(bool)

# Convert categorical variables
cat_columns = ['gender', 'location_type']
data_df[cat_columns] = data_df[cat_columns].astype('category')

```

**Why This Matters:**  
Correct data types enable efficient aggregation operations, ensure proper encoding for machine learning models, and reduce memory usage. Boolean types allow for faster filtering, while categorical types optimize storage and enable appropriate statistical operations.

### Creating Age Groups  
This code transforms continuous age data into discrete life-stage segments for demographic analysis:

```
# Define age bins and labels for life-stage segmentation

bins= [0, 20, 30, 40, 50, 60, 70, float('inf')]
labels = ['<20','20-30', '30-40', '40-50', '50-60', '60-70', '70+']

# Create new age group column
data_df['age_group'] = pd.cut(data_df['age'], bins=bins, labels=labels, right=False)

```

**Insight:**  
Grouping continuous variables like age into meaningful segments simplifies visualization and enables life-stage analysis of mental health and digital behaviors. This segmentation allows product teams to identify age-specific patterns (e.g., "stress peaks in the 40-50 age group") and design targeted interventions.


### Encoding Categorical Variables  
The following code converts categorical variables to a numeric format, making them compatible with regression algorithms:

```
# Encode gender and location type for modeling

data_df['gender_encoded'] = gender_encoder.fit_transform(data_df['gender'])
data_df['location_encoded'] = gender_encoder.fit_transform(data_df['location_type'])

```

**Why This Matters:**  
Label encoding transforms categorical text values (e.g., "Male", "Female", "Urban") into numeric representations that regression models can process. This preprocessing step is essential for including demographic factors as predictors in the mental health model.


### Summary Statistics  
This code generates descriptive statistics to understand the distribution and variability of key behavioral metrics:


```
# Quick summary transposing the table and rounding decimals to 2 significant figures

data_df.describe().T.round(2)

```
**Observation:**  
Continuous variables such as screen time, sleep hours, and physical activity exhibit wide variation, suggesting diverse behavioral patterns across participants. This diversity is essential for regression analysis—sufficient variance in predictors enables the model to identify meaningful relationships with mental health outcomes.


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

| Feature | Description | Rationale |
|---------|-------------|-----------|
| total_screen_hours | Combined device usage (phone, laptop, tablet, TV) | Aggregates fragmented usage to capture total digital load, as different devices may have cumulative effects |
| sleep_efficiency | Sleep quality normalized by duration | Separates quality from quantity; addresses hypothesis that restful sleep matters more than total hours |
| stress_to_activity_ratio | Stress adjusted by activity hours | Identifies individuals with high stress relative to physical outlets, flagging those who may benefit from activity interventions |
| health_behavior_score | Composite of mindfulness, healthy eating, and wellness app use | Creates a single wellness engagement metric to test if combined healthy behaviors amplify individual effects |
| mood_vs_stress_diff | Emotional balance indicator | Quantifies emotional stability by comparing mood against stress levels |
| mindfulness_effect | Mindfulness buffering impact on stress | Tests whether mindfulness moderates stress's negative effects on mental health |


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

The EDA revealed quantifiable relationships between lifestyle behaviors and mental well-being:

- Sleep Quality is the second-strongest positive predictor (β = +1.84, standardized coefficient = +1.20), where each 1-point improvement in sleep quality corresponds to a 1.84-point increase in mental health score
- Physical Activity is the strongest positive predictor (β = +1.51, standardized coefficient = +3.47), with each additional hour of weekly activity improving mental health scores by 1.5 points
- Stress Level shows the largest negative impact (β = -2.97, standardized coefficient = -8.72), representing a 2.97-point decrease in mental health for every 1-point increase in stress—2.5x stronger than physical
  activity's positive effect
- Caffeine Intake has a negligible impact (β = -0.002, standardized coefficient = -0.14) compared to other behavioral factors
- Mindfulness Practice shows a small but measurable positive effect (β = +0.022, standardized coefficient = +0.15)

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
A multiple linear regression model was trained to quantify how behavioral and lifestyle variables predict mental health outcomes.  
**Model Performance Metrics:**  

- **R² = 0.856:** The model explains 85.6% of the variance in mental health scores
- **RMSE = 5.071:** Average prediction error of ±5.07 points
- **Interpretation:** For every 100 individuals, the model correctly predicts 86 of their mental health scores within ±5 points

This high R² value indicates that lifestyle and behavioral factors captured in this analysis are highly predictive of mental wellness outcomes. The remaining 14.4% of variance likely stems from unmeasured factors such as social support, genetic predisposition, life events, or measurement error in self-reported data.

#### Model Performance Summary  
The following code evaluates the model's predictive accuracy using two complementary metrics:


```
# R**2 and RMSE evaluation

print(f"R² Score: {r2:.3f}")
print(f"RMSE: {rmse:.3f}")
```

**Output:**
|Metric|Value|
|-------------------|----|
|**R<sup>2</sup> Score**|**RMSE**|
| 0.856|5.071|

**Interpretation:**  
The model explains 85.6% of the variance in mental health scores (R²), with an average prediction error of ±5.07 points (RMSE). This high R² indicates that the behavioral and wellness features captured in this analysis are strong predictors of psychological outcomes. For context, in social science research, R² > 0.70 is considered an excellent model fit.

#### Why Linear Regression?
Linear regression was chosen for this analysis for three key reasons:

1) **Interpretability:** Unlike black-box models, linear regression provides clear, quantifiable coefficients (e.g., "each hour of activity improves mental health by 1.51 points") that stakeholders can understand and act on
2) **Assumption Validation:** Exploratory analysis revealed approximately linear relationships between predictors and mental health scores, making linear regression appropriate for this use case
3) **Business Requirements:** Product teams need to understand how much each behavior matters, not just whether it matters, making coefficient interpretation essential

**Model Assumptions & Limitations:**

- Assumes linear relationships between features and outcomes (threshold effects may exist but are not captured)
- Cross-sectional data prevent causal inference—observed associations may reflect correlation rather than causation
- Self-reported survey data are subject to response bias and measurement error
- Model trained on available demographic and behavioral features; unmeasured factors (social support, genetics, life events) explain the remaining 14% of variance


#### Top predictors of mental health:


| Rank | Feature                | Coefficient | Standardized Effect | Impact Interpretation |
|------|------------------------|-------------|---------------------|-----------------------|
| 1    | Stress Level           |  -2.971     |  -8.824             | Each 1-point stress increase → -3.0 point mental health decline |
| 2    | Physical Activity      | +1.506      | +3.472              | Each additional hour/week → +1.5 point improvement |
| 3    | Sleep Quality          | +1.840      | +1.195              | Each 1-point sleep quality gain → +1.8 point improvement |
| 4    | Health Behavior Score  | -0.742      | -0.185              | Composite metric with minor negative effect¹ |
| 5    | Sleep Duration         | +0.214      | +0.090              | Each additional hour of sleep → +0.2 point improvement |
| 6    | Mindfulness Minutes    | +0.022      | +0.147              | Each additional daily minute → +0.02 point improvement |
| 7    | Caffeine Intake        | -0.002      | -0.136              | Minimal effect. 100 mg caffeine → -0.2 point change |

 **Notes:**
> ¹ Health Behavior Score's unexpected negative coefficient (β = -0.742) likely indicates multicollinearity. This composite metric overlaps with mindfulness_minutes and other features already in the model. When isolated
> in bivariate analysis, health behaviors show expected positive correlations with mental health. In future iterations, this feature should be excluded from the regression model to avoid redundancy with its component
> features.

<img width="1092" height="514" alt="Feature_importance_for_predicting_Mental_Health_Score" src="https://github.com/user-attachments/assets/d7718f95-677f-4359-9bfc-748b5dfce2b5" /> 


***

### Dashboard & Visualization

#### Purpose & Users  
This interactive Looker Studio dashboard operationalizes the regression findings, translating statistical insights into actionable business intelligence. The dashboard serves three primary user groups:  

#### Primary Users:

- **Product Managers** at wellness apps and wearable device companies to prioritize feature development based on behavioral impact data
- Wellness Program Coordinators to identify which user segments need targeted interventions and track program effectiveness over time
- Data Analysts supporting product and health teams to explore behavioral patterns, validate hypotheses, and generate ad-hoc reports for stakeholders

#### Key Use Cases:

1) **User Segmentation:** Identify at-risk populations (high stress, low activity, poor sleep) for proactive outreach
2) **Intervention Design:** Determine which behavioral levers (sleep hygiene, activity goals, stress management) will yield the highest mental health ROI for specific demographics
3) **A/B Testing Support:** Establish baseline wellness metrics before launching new features and track changes post-implementation
4) **Executive Reporting:** Provide leadership with population-level wellness trends and justification for wellness product investments


#### Digital Wellness Overview

**Purpose:** Population-level wellness metrics for strategic planning and trend identification

<img width="821" height="581" alt="overall_dashboard_view_page1" src="https://github.com/user-attachments/assets/8a55ee74-2f10-4275-97f0-3dcb784d7fb1" />  

#### What This Page Enables:

- **Age-Based Segmentation:** Product managers can identify which age groups have the poorest sleep or highest stress levels, informing age-targeted feature releases (e.g., stress reduction tools for 30-40 year-olds if that segment shows elevated stress)
- **Feature Prioritization Validation:** The feature importance visualization confirms that stress reduction features should be prioritized over caffeine tracking, given stress's 8.7x standardized coefficient vs. caffeine's -0.14
- **Baseline Metrics:** Wellness coordinators can establish population averages (e.g., "average user sleeps 6.8 hours with stress level of 5.2") to benchmark individual users against
- **Resource Allocation:** Leadership can justify investing in stress management content over other wellness features based on quantified impact data

#### Specific Insights Displayed:

- Average sleep hours, stress levels, and physical activity segmented by age group
- Ranked feature importance showing stress reduction as the highest-value intervention target
- Caffeine intake vs. mental health correlation demonstrates a minimal direct relationship

#### Behavioral Patterns & Mental Health

**Purpose:** Detailed behavioral relationship exploration for intervention design and user education

<img width="821" height="581" alt="image" src="https://github.com/user-attachments/assets/30cfce00-8e62-409e-b649-af2abee73510" />  


#### What This Page Enables:

- **Personalized Recommendations:** Wellness coaches can use the mindfulness vs. stress visualization to set evidence-based targets (e.g., "Based on your stress level of 7, aim for 15+ daily mindfulness minutes to see measurable stress reduction")
- **Intervention Effectiveness Tracking:** Program coordinators can monitor whether users who increase physical activity show corresponding mental health score improvements over time
- **User Education Content:** Product teams can create in-app messaging like "Users who improve sleep efficiency from 0.5 to 0.7 report 2.8-point higher mood ratings on average"
- **Demographic-Specific Strategies:** Identify whether certain behavioral interventions (e.g., social media reduction) work better for specific age groups or locations (urban vs. rural)

#### Specific Insights Displayed:
1) **Mindfulness vs. Stress Level** → Longer mindfulness sessions correlate with lower stress, but the effect is modest (β = +0.022). Decision Enabled: Set realistic user expectations—mindfulness helps but isn't a silver bullet; combine with activity and sleep interventions for maximum impact.
2) **Physical Activity vs. Mental Health** → Strong positive relationship (β = +1.51) confirms that activity tracking features should be prominent. Decision Enabled: Prioritize activity goal-setting features and push notifications encouraging movement, as this is the #2 predictor of mental wellness.
3) **Mood vs. Sleep Efficiency** → Better sleep quality (not just duration) drives improved mood. Decision Enabled: Develop sleep quality assessment tools (sleep tracking, sleep environment tips) rather than just sleep duration counters.
4) **Social Media Ratio vs. Mood Rating** → Excessive social media use relative to total screen time correlates with lower mood. Decision Enabled: Create "digital wellness" features that alert users when social media consumption exceeds healthy thresholds, or implement "social media breaks" within the app.

#### Interactive Features & Filters  

The dashboard includes dynamic filters enabling users to:

- **Filter by Demographics:** Isolate patterns for specific age groups, genders, or location types (urban/suburban/rural) to design targeted interventions
- **Compare Cohorts:** View side-by-side comparisons (e.g., "high activity users vs. low activity users") to quantify behavioral impact
- **Track Temporal Changes:** Monitor how population wellness metrics shift over time as new features are released (requires dashboard updates with time-series data)

#### Example Use Case:
>A product manager notices the dashboard shows 40-50 year-olds have the highest stress levels (avg. 6.1) but the lowest physical activity (2.3 hrs/week). Using the activity vs. mental health chart, they estimate that >increasing activity to 5 hrs/week could improve mental health scores by ~4.1 points for this segment. This insight justifies developing age-targeted activity challenges or partnerships with fitness apps that appeal to >middle-aged users.

**Technical Documentation:** Feature engineering logic and coefficient calculations are documented in the [Jupyter Notebook](./scripts/wellness_data_analysis.ipynb) for reproducibility and validation.
  
### Key Takeaways

1) **Stress Management is Critical (3x more impactful than any positive factor)**
Stress Level has the strongest effect on mental health (β = -2.97, standardized = -8.72), with an impact 2.5x larger than physical activity and 6x larger than sleep quality. Wellness interventions targeting stress reduction offer the highest potential ROI.
2) **Physical Activity Delivers the Strongest Positive Impact**
Each additional hour of weekly physical activity improves mental health scores by +1.51 points (standardized = +3.47). A person increasing activity from 2 to 5 hours/week could expect a ~4.5-point mental health improvement, assuming other factors remain constant.
3) **Sleep Quality Matters More Than Sleep Duration**
Sleep quality (β = +1.84) has an 8.6x greater impact than sleep duration (β = +0.21), suggesting that wellness programs should prioritize sleep hygiene interventions over simply encouraging more hours of sleep.
4) **Mindfulness and Caffeine Have Minimal Direct Effects**
Despite popular perception, mindfulness minutes (β = +0.022) and caffeine intake (β = -0.002) show negligible individual impact. However, these may work indirectly through their effects on sleep quality and stress levels.
5) **Model Enables Predictive Wellness Scoring**
The regression model (R² = 0.856, RMSE = 5.07) can predict mental health outcomes with 86% accuracy, enabling wellness platforms to identify at-risk users and personalize interventions before mental health declines become severe.
6) **Dashboard Translates Analysis into Operational Insights**
The Looker Studio dashboard operationalizes these findings, allowing product teams to segment users by behavioral patterns, track intervention effectiveness, and identify which demographics would benefit most from specific wellness features.


## Conclusion

### Project Summary
This analysis successfully identified and quantified the behavioral drivers of mental wellness using smart device usage data. By engineering lifestyle metrics and training an interpretable regression model (R² = 0.856), the project delivers actionable insights for wellness product development.

### Key Finding
**Stress management emerges as the single highest-priority intervention area**, with a negative impact (β = -2.97) 2.5x larger than the strongest positive factor (physical activity). This finding suggests that wellness platforms should prioritize stress-reduction features over other interventions to maximize mental health outcomes for users.

### Business Value
This analysis provides wellness companies and wearable device manufacturers with a **data-driven framework** to:
- Prioritize feature development based on quantified behavioral impact
- Segment users by risk profiles (high stress, low activity, poor sleep)
- Personalize interventions using predictive mental health scoring
- Justify product investments with evidence-based ROI projections

### Next Steps & Extensions
Future iterations of this analysis could:
1. **Incorporate temporal data** to track behavioral changes over time and validate intervention effectiveness
2. **Add interaction terms** to test whether combining interventions (e.g., activity + mindfulness) produces synergistic effects beyond individual contributions
3. **Segment modeling** to build demographic-specific models (age-stratified coefficients may reveal that sleep matters more for older adults while activity matters more for younger users)
4. **Causal inference methods** using propensity score matching or instrumental variables to move beyond correlation and estimate causal effects of behavioral changes

### Portfolio Demonstration
This project showcases end-to-end data science capabilities:
- ✅ Business problem framing and stakeholder communication
- ✅ Feature engineering and domain knowledge application
- ✅ Statistical modeling with interpretable results
- ✅ Dashboard development for operational analytics
- ✅ Translation of technical findings into strategic recommendations

## 🛠️ How to Use This Repository

### Files & Structure
```
├── data/
│   ├── mental_health_features.csv          # Processed dataset with engineered features
│   └── feature_importance.csv              # Model coefficients and rankings
├── notebooks/
│   └── wellness_data_analysis.ipynb        # Full analysis workflow
├── visualizations/
│   ├── dashboard_screenshots/              # Looker Studio dashboard images
│   └── eda_plots/                          # Exploratory analysis charts
└── README.md                                # This file
```


[**Contact**](https://www.linkedin.com/in/gabrielpalomarez)

[Home](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/README.md)
