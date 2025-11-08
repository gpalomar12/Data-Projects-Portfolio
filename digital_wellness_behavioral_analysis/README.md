# 🧠 Digital Wellness & Lifestyle Behavioral Analysis

### 📋 Project Type:
Exploratory Data Analysis (EDA) + Predictive Modeling + Dashboard Visualizaiton

### ⚙️ Tools Used:
Python, Pandas, Scikit-learn, Looker Studio, Matplotlib, Seaborn

***

## Project Overview
This project explores the relationship between digital behaviors, lifestyle choices, and mental well-being
using a simulated data set representing daily screen usage, stress, sleep, and wellness habits.

The goal is to:

- Identify patterns between digital engagement and mental health
- Derive new behavioral metrics that represent lifestyle balance
- Develop a predictive model for wellness outcomes
- Visualize actionable insights using an interactive dashboard

***

## Data Overview & Preperation

>The dataset contains simulated information on 5,000 individuals, covering demographics, digital
>behavior, lifestyle habits, and mental health indicators.
>
>Each record represents one individual's daily screen usage patterns, wellness behaviors, and 
>self-reported mental health metrics.
>
>This section provides an overview of the data set's structure, verifies data quality, and prepares
>the features for analysis and modeling.

#### Python Libraries Used in the Analysis
```
# Standard Library Imports

import pandas as pd
import numpy as np

#These are the plotting modules and libraries we'll use

import matplotlib as mpl
import matplotlib.pyplot as plt
import seaborn as sns

# Scikit learn libraries to be used in model training

from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score, mean_squared_error
from sklearn.preprocessing import MinMaxScaler

# Initialize encoder
gender_encoder = LabelEncoder()
location_encoder = LabelEncoder()

#command so that plots appear inline in the iPython Notebook
%matplotlib inline

```
#### Inspecting the Dataset

```
# Preview the dataset structure
data_df.info()

# Displaying a few sample rows
data_df.head()

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

### Demographic Overview
> Understanding the demographic makeup of the dataset helps contextualize behavioral and mental health
> trends.
> This section explores how participants are distributed across **age, gender,** and **location type**, providing a
> foundation for later comparisons in the digital habits and wellness patterns.

#### Demographic Distribution Visualization


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

***

**Summary**
>The dataset’s diverse demographic representation provides a strong foundation for the upcoming Exploratory Data Analysis (EDA).
>In the next section, we will explore how digital habits, sleep patterns, and wellness behaviors differ across these demographic
>groups and how they relate to mental health outcomes.

### 🔍 Exploratory Data Analysis (EDA)


<img width="863" height="525" alt="Distribution of health behavior score" src="https://github.com/user-attachments/assets/911ebbb8-2c2e-4159-8ea0-288cfb57331c" />  


>**Insight:**
>
>The **Health Behavior Score**, which combines healthy eating, mindfulness, and wellness app usage, is skewed
>toward moderate values.
>This suggests that while some individuals adopt healthy habits consistently, most exhibit moderate
>wellness engagement, leaving room for behavioral improvement.

#### Relationship Between Sleep Quality and Mental Health
<img width="838" height="439" alt="sleep_qualityvmental_health_score" src="https://github.com/user-attachments/assets/07bd3a0a-91f1-47c2-b35e-ca3ee00ea916" />  


>**Insight:**
>
>A clear **positive trend** appears between sleep quality and mental health, with individuals reporting higher-quality
>sleep tends to be associated with better overall mental wellness.
>This relationship reinforces the connection between **sleep hygiene** and emotional stability.


#### Stress Level vs Physical Activity
<img width="834" height="426" alt="stress_level_v_physical_activity" src="https://github.com/user-attachments/assets/5e16ffc5-a4a7-443f-82b1-7e9da84027c1" />  

>**Insight:**
>
>Individuals who engage in **more physical activity** generally report **lower stress levels**.
>This pattern aligns with established wellness research, regular physical movement is associated with
>improved mood and reduced perceived stress.


#### Caffeine Intake and Mental Health
<img width="851" height="439" alt="caffeine_intake_v_mental_health_score" src="https://github.com/user-attachments/assets/0ff73b1d-2d9a-4d1e-aa99-b293add92100" />  



>**Insight:**
>
>There’s a slight negative association between caffeine intake and mental health score.
>Higher caffeine consumption may correspond to elevated stress or reduced sleep, both of
>which can negatively impact overall wellness.


#### Behavioral Balance: Health Behavior vs Mental Health  

<img width="880" height="546" alt="health_behavior_vs_mental_health" src="https://github.com/user-attachments/assets/ff8c9b4a-3007-4c97-afaa-68728dd2e314" />  

>**Insight:**
>
>The strong positive correlation indicates that **healthier daily behaviors**, such as mindfulness, exercise,
>and balanced routines, are closely related to **better mental health outcomes.**
>This finding sets the stage for our **feature engineering and modeling**, where we can quantify the relative
>impact of each behavioral factor.


**Summary**
>The EDA reveals clear behavioral drivers of mental wellness:
>- Better sleep and more physical activity improve mental health
>- High stress and excessive caffeine appear detrimental
>- Holistic wellness behaviors (mindfulness, healthy diet, and app-based self-care) correlate
>  strongly with higher mental health scores
>These insights inform which features to engineer and test in predictive models that explain or forecast
>**mental well-being**.

***

### Feature Engineering  

>After exploring behavioral and wellness trends, the next step is to create new, meaningful features that
>better represent lifestyle balance and mental health drivers.
>Feature engineering allows us to summarize complex dialy patterns, such as total screen exposure or
>lifestyle quality, into measurable predictors that improve model interpretability.


#### Deriving Behavioral and Wellness Features

```
# Total screen time exposure
data_df['total_screen_hours'] = (
                                data_df['phone_usage_hours'] +
                                data_df['laptop_usage_hours'] + 
                                data_df['tablet_usage_hours'] +
                                data_df['tv_usage_hours']
)

# Non-Working screen time
data_df['non_work_screen_hours'] = data_df['total_screen_hours'] - data_df['work_related_hours']

# Ratios capturing how users spend screen time
data_df['social_ratio'] = data_df['social_media_hours'] / data_df['total_screen_hours']
data_df['entertainment_ratio'] = data_df['entertainment_hours'] / data_df['total_screen_hours']
data_df['gaming_ratio'] = data_df['gaming_hours'] / data_df['total_screen_hours']

```

>**Rationale:**
>These derived variables capture how much and how purposefully users engage with digital devices.
>For example, a high social_ratio or entertainment_ratio may indicate excessive leisure usage, while
>higher work_related_hours reflect structured, productive engagement.

#### Sleep and Activity Balance Indicators

```
# Sleep efficiency: (quality per hour of rest)
data_df['sleep_efficiency'] = data_df['sleep_quality']/data_df['sleep_duration_hours']

# Balance between activity and rest
data_df['activity_sleep_balance'] = data_df['physical_activity_hours_per_week'] / (data_df['sleep_duration_hours'] * 7)

```

>**Rationale:**
>These metrics assess lifestyle equilibrium.
>A balanced routine of rest and physical activity supports mental well-being, while low sleep efficiency or
>poor activity balance often correlates with higher stress and fatigue.


#### Stress and Caffeine Relationships

```
# Caffeine normalized by awake hours
data_df['caffeine_per_hour_awake'] = (
    data_df['caffeine_intake_mg_per_day'] / (24- data_df['sleep_duration_hours']
)

# Stress normalized by activity level
data_df['stress_to_activity_ratio'] = (
    data_df['stress_level'] / (data_df['physical_activity_hours_per_week'] + 1)
)

```

>**Rationale:**
>These ratios quantify stress and stimulant impact relative to lifestyle context.
>They help model subtle variations, for instance, someone with high stress but high physical activity
>may exhibit different outcomes than a sedentary individual with the same stress level.


#### Holistic Wellness Metrics

```
# Normalize mindfulness_minutes per day to 0-1 scale
scaler = MinMaxScaler()
overall_df['mindfulness_norm'] =  scaler.fit_transform(overall_df[['mindfulness_minutes_per_day']])

# Compute the composite health behavior score
overall_df['health_behavior_score'] = (
    overall_df['eats_healthy'].astype(int) +
    overall_df['uses_wellness_apps'].astype(int) +
    overall_df['mindfulness_norm']
) / 3

```

>**Rationale:**
>The Health Behavior Score summarizes three key aspects of well-being:
>- Nutrition habits
>- Mindfulness engagement
>- Use of digital wellness tools
>
This composite metric helps quantify lifestyle quality and its impact on mental health.

#### Emotional Composite Indicators

```
# Combine mental wellness metrics for a balanced index
data_df['mental_health_composite'] = (
    data_df['mental_health_score'] +
    data_df['weekly_anxiety_score'] +
    data_df['weekly_depression_score']
)/3

# Mood vs Stress difference
data_df['mood_vs_stress_diff'] = data_df['mood_rating'] - data_df['stress_level']

# Mindfulness buffering effect
data_df['mindfulness_effect'] = data_df['mindfulness_minutes_per_day'] / (data_df['stress_level'] + 1)

```

>**Rationale:**
>These emotional indicators capture psychological balance:
>- "mental_health_composite" provides a holistic snapshot of well-being
>- "mood_vs_stress_diff" reflects resilience
>- "mindfulness_effect" measures how mindfulness mitigates stress
>


***

#### Validate New Feature Distributions  


<img width="617" height="309" alt="engineered_columns_validation" src="https://github.com/user-attachments/assets/edd2f5ae-19bc-4477-ab10-d24b1db42579" />  


>**Observation:**
>The engineered features have been successfully scaled or normalized, ensuring they are suitable for
>regression analysis and cross-variable comparisons.


**Summary**
>Feature engineering transforms raw behavioral data into interpretable lifestyle metrics that represent
>how individuals balance technology, sleep, activity, and self-care.
>These features now serve as inputs for modeling the predictors of mental health outcomes.



