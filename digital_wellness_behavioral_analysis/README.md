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




### Creating Features Code


### Composite Health Behavior Score


***
 
