# 📚 CMS Gaps in Care Dashboard - Data Dictionary
## Comprehensive Field Definitions and Specifications

---

## 📊 Dataset Overview

**File Name:** `deidentified_output.xlsx`  
**File Format:** Microsoft Excel (.xlsx)  
**File Size:** 2.1 MB  
**Created:** 2019 (Vintage Data)  
**Status:** De-identified for HIPAA compliance

### Dataset Statistics
| Metric | Value |
|--------|-------|
| **Total Records** | 10,347 |
| **Total Columns** | 16 |
| **Unique Practices** | 85 medical groups |
| **Unique Locations** | 271 provider offices |
| **Patient Groups** | 12 ACO entities |
| **CMS Measures** | 34 quality measures |
| **Date Range** | 2019 (multiple export cycles) |
| **Grain** | One record per Practice-Location-Measure-Patient Group combination |

### Data Quality Metrics
- **Completeness:** 99.3% (missing values in 2 columns only)
- **Rate Calculation Accuracy:** 98.2% match between reported and calculated rates
- **Records Meeting Goal:** 4,368 (42.2%)
- **Records with Performance Gaps:** 5,979 (57.8%)
- **Total Patients Needing Gap Closure:** 64,631

---

## 📋 Core Data Fields

### 1. Source
**Column Name:** `Source`  
**Data Type:** Text (String)  
**Nullable:** No (Required)  
**Unique Values:** 2

**Definition:**  
Identifies the data source or reporting program that generated the quality measure data.

**Valid Values:**
| Value | Count | Percentage | Description |
|-------|-------|------------|-------------|
| **HEDIS** | 8,666 | 83.8% | Healthcare Effectiveness Data and Information Set measures |
| **GPRO** | 1,681 | 16.2% | Group Practice Reporting Option measures |

**Business Context:**
- **HEDIS:** National standard for measuring health plan performance, used primarily for commercial and Medicare Advantage populations
- **GPRO:** CMS quality reporting option for group practices in Medicare Shared Savings Programs (MSSP)

**Business Rules:**
- Each record must have a source designation
- Source determines measure methodology and benchmark calculations
- HEDIS and GPRO may have different performance thresholds for the same clinical measure

---

### 2. Patient Group
**Column Name:** `Patient Group`  
**Data Type:** Text (String)  
**Nullable:** No (Required)  
**Unique Values:** 12

**Definition:**  
The Accountable Care Organization (ACO) or insurance payer entity to which patients are attributed.

**Distribution:**
| Patient Group | Records | Percentage |
|---------------|---------|------------|
| Group Ohb | 1,681 | 16.2% |
| Group fno | 1,459 | 14.1% |
| Group gRV | 1,299 | 12.6% |
| Group GMb | 923 | 8.9% |
| Group JmT | 908 | 8.8% |
| Group AoC | 812 | 7.8% |
| Group LrZ | 794 | 7.7% |
| Group Vrp | 699 | 6.8% |
| Group PSI | 587 | 5.7% |
| Group oiV | 536 | 5.2% |
| Group Bcb | 435 | 4.2% |
| Group IfL | 214 | 2.1% |

**Sample Values:**
- "Group Ohb"
- "Group fno"
- "Group gRV"

**Business Rules:**
- De-identified using Faker library (original ACO names removed for HIPAA compliance)
- Each patient group represents a distinct ACO or insurance network
- Performance measured separately for each patient group
- Shared savings opportunities calculated at patient group level
- Different patient groups may have different CMS quality targets

**Data Quality:**
- No missing values
- Consistent 3-character group identifiers (e.g., "Ohb", "fno", "gRV")

---

### 3. Measure Name
**Column Name:** `Measure Name`  
**Data Type:** Text (String)  
**Max Length:** 150 characters  
**Nullable:** No (Required)  
**Unique Values:** 34

**Definition:**  
The specific CMS quality measure being tracked for performance and gap closure.

**Top 15 Measures by Record Count:**
| Rank | Measure Name | Records | Avg Rate |
|------|--------------|---------|----------|
| 1 | ★Colorectal Cancer Screening (COL) | 931 | 55.0% |
| 2 | ★Adult BMI Assessment (ABA) | 912 | 78.5% |
| 3 | ★Breast Cancer Screening (BCS) | 845 | 63.1% |
| 4 | ★Diabetes: Eye exam (retinal) performed | 691 | 68.4% |
| 5 | ★Diabetes: Medical attention for nephropathy | 691 | 90.0% |
| 6 | ★Controlling High Blood Pressure (CBP) | 689 | 80.5% |
| 7 | ★Diabetes: HbA1c control <8.0% | 615 | 65.7% |
| 8 | ★Medication Adherence for Hypertension (ACEi or ARB) and RASA | 575 | 83.5% |
| 9 | ★Medication Adherence for Oral Diabetes Medications | 517 | 81.6% |
| 10 | ★Medication Adherence for Cholesterol (Statins) | 401 | 83.0% |
| 11 | ★Disease-Modifying Anti-Rheumatic Drug Therapy for Rheumatoid Arthritis (ART) | 396 | 68.9% |
| 12 | ★Osteoporosis Management in Women Who Had a Fracture (OMW) | 366 | 44.5% |
| 13 | ★Unhealthy Alcohol Use Screening and Follow-Up (ASF) | 218 | 52.6% |
| 14 | Annual Wellness Bundle (THN) | 218 | 60.2% |
| 15 | ★Care for Older Adults (COA): Functional Status Assessment | 174 | 71.5% |

**Measure Categories:**
- **Cancer Screening** (3 measures): Colorectal, Breast, Cervical
- **Diabetes Management** (6 measures): HbA1c control, Eye exams, Nephropathy
- **Cardiovascular** (4 measures): Blood pressure, Medication adherence
- **Preventive Care** (8 measures): Depression screening, Tobacco cessation, Immunizations
- **Chronic Disease** (5 measures): COPD, Rheumatoid arthritis, Osteoporosis
- **Medication Adherence** (4 measures): Statins, Diabetes meds, Hypertension meds
- **Care for Older Adults** (3 measures): Functional status, Medication review, Pain assessment

**Naming Conventions:**
- ★ prefix indicates high-priority HEDIS measure
- (COL), (BCS), (ABA) = Standard HEDIS measure abbreviations
- (THN) suffix = Trinity Health Network custom measures

**See Appendix A for complete list of all 34 measures with detailed definitions**

---

### 4. Practice
**Column Name:** `Practice`  
**Data Type:** Text (String)  
**Max Length:** 100 characters  
**Nullable:** Yes (9 missing values, 0.1%)  
**Unique Values:** 85

**Definition:**  
The clinical organization or medical group responsible for patient care delivery.

**Top 20 Practices by Record Volume:**
| Rank | Practice Name | Records | Avg PNTRG |
|------|---------------|---------|-----------|
| 1 | Walter, Edwards and Rios | 1,761 | 5.8 |
| 2 | Morales-Jones | 902 | 6.2 |
| 3 | Baker, Mason and White | 859 | 7.1 |
| 4 | Wilkerson-Day | 788 | 5.4 |
| 5 | Garcia-James | 624 | 8.3 |
| 6 | Williams and Sons | 613 | 6.9 |
| 7 | Carlson-Cruz | 518 | 5.2 |
| 8 | Brooks, Lam and Hayes | 459 | 6.5 |
| 9 | Romero, Gonzalez and Brooks | 359 | 7.8 |
| 10 | Johnston, Sanchez and Kennedy | 215 | 4.9 |
| 11 | Snyder, Campos and Callahan | 191 | 5.3 |
| 12 | George Group | 147 | 8.1 |
| 13 | Hoffman, Baker and Richards | 133 | 6.7 |
| 14 | Abbott-Munoz | 122 | 7.4 |
| 15 | Mcclure, Ward and Lee | 122 | 5.9 |
| 16 | James Group | 121 | 6.2 |
| 17 | Flowers, Martin and Kelly | 121 | 7.0 |
| 18 | Rodriguez LLC | 118 | 8.5 |
| 19 | Burton Ltd | 117 | 6.4 |
| 20 | Ferrell, Rice and Maddox | 114 | 9.2 |

**Sample Values:**
- "Walter, Edwards and Rios"
- "Morales-Jones"
- "Baker, Mason and White"

**Business Rules:**
- De-identified using Faker library (original practice names removed)
- Each practice can have multiple locations
- Practice names must be unique across the dataset
- 85 unique practices managing 271 locations (avg 3.2 locations per practice)

**Relationships:**
- One practice → Many locations (1:N relationship)
- Average records per practice: 121.7

**Data Quality:**
- 9 missing values (0.1%) - records where practice assignment was unclear
- No duplicates or naming inconsistencies

---

### 5. Location
**Column Name:** `Location`  
**Data Type:** Text (String)  
**Max Length:** 150 characters  
**Nullable:** No (Required)  
**Unique Values:** 271

**Definition:**  
The individual provider office or clinic where patient care is delivered.

**Top 20 Locations by Record Volume:**
| Rank | Location Name | Records |
|------|---------------|---------|
| 1 | Smith-Bell Medical Group | 133 |
| 2 | Gibson Ltd Medical Group | 129 |
| 3 | Holmes, Williams and Wright Medical Group | 129 |
| 4 | Hernandez Inc Medical Group | 126 |
| 5 | Reed Group Medical Group | 124 |
| 6 | Riggs PLC Medical Group | 123 |
| 7 | Simmons, Meadows and Griffin Medical Group | 123 |
| 8 | Walsh LLC Medical Group | 122 |
| 9 | Tran, Jordan and Williams Medical Group | 122 |
| 10 | Shields, Cochran and Adams Medical Group | 121 |
| 11 | Rodriguez, Brennan and Garrison Medical Group | 121 |
| 12 | Hernandez Ltd Medical Group | 121 |
| 13 | Hooper PLC Medical Group | 121 |
| 14 | Meadows PLC Medical Group | 121 |
| 15 | Mitchell-Jordan Medical Group | 120 |
| 16 | Mccarthy Inc Medical Group | 120 |
| 17 | Campbell-Clark Medical Group | 119 |
| 18 | Harris-Walters Medical Group | 119 |
| 19 | Wagner-King Medical Group | 119 |
| 20 | Davis Group Medical Group | 119 |

**Naming Convention:**
- Format: `[Business Name] Medical Group`
- Examples: "Smith-Bell Medical Group", "Garcia, Humphrey and Baker Medical Group"

**Business Rules:**
- De-identified using Faker library
- Each location belongs to exactly one practice
- Multiple locations can exist under the same practice
- 271 unique locations across 85 practices
- Average locations per practice: 3.2

**Relationships:**
- Many locations → One practice (N:1 relationship)
- Average records per location: 38.2

**Data Quality:**
- No missing values
- All locations end with " Medical Group" suffix

---

### 6. Met
**Column Name:** `Met`  
**Data Type:** Integer  
**Range:** 0 to 3,366  
**Nullable:** No (Required)  

**Definition:**  
The number of patients who successfully met the clinical criteria for this quality measure.

**Statistical Summary:**
| Metric | Value |
|--------|-------|
| **Minimum** | 0 |
| **Maximum** | 3,366 |
| **Mean** | 32.6 patients |
| **Median** | 5 patients |
| **Total Across Dataset** | 337,226 patients |

**Distribution by Range:**
| Range | Count | Percentage |
|-------|-------|------------|
| 0 | 1,192 | 11.5% |
| 1-10 | 5,847 | 56.5% |
| 11-50 | 2,412 | 23.3% |
| 51-100 | 514 | 5.0% |
| 101-500 | 341 | 3.3% |
| 500+ | 41 | 0.4% |

**Example Values:**
- `0` = No patients meeting criteria (100% gap)
- `5` = 5 patients meeting criteria
- `142` = 142 patients meeting criteria
- `3,366` = Largest volume (high-performing location)

**Business Rules:**
- Must be ≥ 0
- Cannot exceed Denominator value
- Used in rate calculation: Rate = Met / (Met + Not Met)

**Calculation Note:**
```
Met = Total_Eligible_Patients - Not_Met - Exclusions - Exceptions
```

---

### 7. Not Met
**Column Name:** `Not Met`  
**Data Type:** Integer  
**Range:** 0 to 1,768  
**Nullable:** No (Required)

**Definition:**  
The number of eligible patients who did not meet the clinical criteria for this quality measure (the "gap" population).

**Statistical Summary:**
| Metric | Value |
|--------|-------|
| **Minimum** | 0 |
| **Maximum** | 1,768 |
| **Mean** | 17.4 patients |
| **Median** | 3 patients |
| **Total Across Dataset** | 180,244 patients |

**Distribution by Range:**
| Range | Count | Percentage |
|-------|-------|------------|
| 0 | 2,799 | 27.0% |
| 1-10 | 5,236 | 50.6% |
| 11-50 | 1,814 | 17.5% |
| 51-100 | 329 | 3.2% |
| 101-500 | 157 | 1.5% |
| 500+ | 12 | 0.1% |

**Example Values:**
- `0` = All patients meeting criteria (no gap)
- `2` = 2 patients not meeting criteria
- `169` = 169 patients not meeting criteria (large gap)

**Business Rules:**
- Must be ≥ 0
- Cannot exceed Denominator value
- Represents the "performance gap" population

**Clinical Significance:**
- "Not Met" patients are targets for care coordination and outreach
- Priority for gap closure interventions
- Direct impact on practice's performance level

---

### 8. Denominator
**Column Name:** `Denominator`  
**Data Type:** Integer  
**Range:** 0 to 3,554  
**Nullable:** No (Required)

**Definition:**  
The total number of clinically eligible patients for this measure (Met + Not Met).

**Statistical Summary:**
| Metric | Value |
|--------|-------|
| **Minimum** | 0 (rare, indicates no eligible patients) |
| **Maximum** | 3,554 |
| **Mean** | 50.1 patients |
| **Median** | 10 patients |
| **Total Across Dataset** | 517,853 patients |

**Calculation Formula:**
```
Denominator = Met + Not Met
```

**Validation:**
In 98.7% of records, this formula holds true. Discrepancies (1.3%) occur when:
- Records have zero in both Met and Not Met fields
- Data entry errors in source system

**Distribution:**
| Range | Count | Percentage |
|-------|-------|------------|
| 0 | 35 | 0.3% |
| 1-10 | 5,689 | 55.0% |
| 11-50 | 2,934 | 28.4% |
| 51-100 | 983 | 9.5% |
| 101-500 | 644 | 6.2% |
| 500+ | 62 | 0.6% |

**Business Rules:**
- Should equal Met + Not Met (excluding Exclusions and Exceptions)
- Represents the total population eligible for performance calculation
- Does not include excluded or excepted patients

**Example Scenario:**
```
Practice: Garcia-James
Measure: Diabetes HbA1c Control
Met: 360 patients
Not Met: 140 patients
Denominator: 500 patients
Rate: 360/500 = 72%
```

---

### 9. Exclusions
**Column Name:** `Exclusions`  
**Data Type:** Integer  
**Range:** 0 to 511  
**Nullable:** No (Required)

**Definition:**  
Number of patients excluded from the measure due to clinical contraindications, ineligibility criteria, or other valid reasons defined by CMS.

**Statistical Summary:**
| Metric | Value |
|--------|-------|
| **Minimum** | 0 |
| **Maximum** | 511 |
| **Mean** | 1.6 patients |
| **Median** | 0 patients |
| **Total Across Dataset** | 16,659 patients |

**Distribution:**
| Value | Count | Percentage |
|-------|-------|------------|
| 0 | 8,542 | 82.6% |
| 1-5 | 1,402 | 13.6% |
| 6-10 | 211 | 2.0% |
| 11-50 | 161 | 1.6% |
| 50+ | 31 | 0.3% |

**Common Exclusion Reasons by Measure:**

**Colorectal Cancer Screening:**
- Total colectomy (colon removal)
- Terminal illness with limited life expectancy
- Patient declined screening

**Breast Cancer Screening:**
- Bilateral mastectomy
- Age > 74 (not included in standard measure)

**Diabetes HbA1c Control:**
- Gestational diabetes only
- Steroid-induced diabetes (temporary)

**Blood Pressure Control:**
- End-stage renal disease
- Pregnancy
- Hospice care

**Business Rules:**
- Excluded patients are NOT counted in Denominator
- Exclusions reduce the eligible population
- Must have clinical documentation supporting exclusion
- Exclusions improve accuracy of performance measurement

**Impact on Calculations:**
```
Total_Initial_Population = Met + Not Met + Exclusions + Exceptions
Eligible_Population (Denominator) = Met + Not Met
```

---

### 10. Exceptions
**Column Name:** `Exceptions`  
**Data Type:** Integer  
**Range:** 0 to 213  
**Nullable:** No (Required)

**Definition:**  
Number of patients with documented valid exceptions (e.g., patient refusal, medical reasons) who are removed from both numerator and denominator.

**Statistical Summary:**
| Metric | Value |
|--------|-------|
| **Minimum** | 0 |
| **Maximum** | 213 |
| **Mean** | 0.4 patients |
| **Median** | 0 patients |
| **Total Across Dataset** | 3,725 patients |

**Distribution:**
| Value | Count | Percentage |
|-------|-------|------------|
| 0 | 9,718 | 93.9% |
| 1-5 | 549 | 5.3% |
| 6-10 | 56 | 0.5% |
| 11-20 | 19 | 0.2% |
| 20+ | 5 | 0.05% |

**Common Exception Reasons:**
1. **Patient Refusal** - Documented declined screening or treatment
2. **Medical Reasons** - Contraindications not meeting exclusion criteria
3. **System Issues** - Unable to perform due to equipment unavailability
4. **Patient Circumstances** - Language barriers, transportation issues

**Difference Between Exclusions and Exceptions:**
| Factor | Exclusions | Exceptions |
|--------|-----------|------------|
| **Timing** | Known before measurement period | Occur during measurement period |
| **Reason** | Clinical contraindication | Patient refusal, situational barriers |
| **Impact** | Removed from initial population | Removed after eligibility determined |
| **Documentation** | Must have clinical reason | Requires patient interaction note |

**Example:**
```
Initial Population: 100 patients
Exclusions: 5 (removed - not eligible)
Eligible for Measure: 95 patients
Exceptions: 3 (patient refused mammogram)
Final Denominator: 92 patients
```

**Business Rules:**
- Exceptions do NOT count in Denominator
- Exceptions do NOT count in Numerator (Met)
- Requires documentation in medical record
- Fewer exceptions = better performance opportunity

---

### 11. Rate
**Column Name:** `Rate`  
**Data Type:** Decimal (Float)  
**Range:** 0.0 to 1.0 (0% to 100%)  
**Precision:** 5 decimal places  
**Nullable:** No (Required)

**Definition:**  
The practice's actual performance percentage for this measure, calculated as the proportion of eligible patients meeting the measure criteria.

**Statistical Summary:**
| Metric | Value |
|--------|-------|
| **Minimum** | 0.0% (0 patients met criteria) |
| **Maximum** | 100.0% (all patients met criteria) |
| **Mean** | 61.0% |
| **Median** | 70.0% |
| **Standard Deviation** | 31.2% |

**Distribution by Performance Tier:**
| Performance Range | Count | Percentage | Performance Level |
|------------------|-------|------------|-------------------|
| 90-100% | 2,799 | 27.0% | Excellent (5 stars) |
| 80-89% | 1,458 | 14.1% | Good (4 stars) |
| 70-79% | 1,685 | 16.3% | Average (3 stars) |
| 60-69% | 1,240 | 12.0% | Below Average (2 stars) |
| 0-59% | 3,165 | 30.6% | Poor (1 star) |

**Calculation Formula:**
```
Rate = Met / Denominator
Rate = Met / (Met + Not Met)
```

**Validation Check:**
- 98.2% of records match calculated rate (10,164 / 10,347)
- 1.8% discrepancies due to:
  - Rounding differences
  - Denominator = 0 cases
  - Data entry errors

**Example Calculations:**

**Example 1: High Performer**
```
Practice: Morales-Jones
Measure: Breast Cancer Screening
Met: 1 patient
Not Met: 0 patients
Denominator: 1 patient
Rate: 1 / 1 = 1.0 (100%)
```

**Example 2: Moderate Performer**
```
Practice: Blake and Sons
Measure: Breast Cancer Screening
Met: 5 patients
Not Met: 2 patients
Denominator: 7 patients
Rate: 5 / 7 = 0.71429 (71.4%)
```

**Example 3: Low Performer**
```
Practice: Ferrell, Rice and Maddox
Measure: Influenza Immunization
Met: 142 patients
Not Met: 169 patients
Denominator: 311 patients
Rate: 142 / 311 = 0.45659 (45.7%)
```

**Business Rules:**
- Rate displayed as decimal (0.0 to 1.0) in data
- Convert to percentage for reporting (multiply by 100)
- Rate cannot be calculated if Denominator = 0 (results in NULL or 0)
- Rate determines Performance Level and star rating

**Interpretation:**
- Rate ≥ Program Goal = Meeting target
- Rate < Program Goal = Performance gap exists
- Gap % = Program Goal - Rate

---

### 12. Performance Level
**Column Name:** `Performance Level`  
**Data Type:** Integer  
**Range:** 0 to 90  
**Nullable:** No (Required)

**Definition:**  
A numeric indicator representing the practice's performance tier for this measure, based on CMS benchmarks or percentile rankings.

**Distribution:**
| Performance Level | Count | Percentage | Interpretation |
|------------------|-------|------------|----------------|
| **0** | 1,460 | 14.1% | No data / Not calculated |
| **1** | 2,671 | 25.8% | Lowest performance tier |
| **2** | 1,085 | 10.5% | Below average |
| **3** | 990 | 9.6% | Average |
| **4** | 685 | 6.6% | Above average |
| **5** | 2,799 | 27.0% | Highest performance tier |
| **30** | 45 | 0.4% | 30th percentile (GPRO) |
| **40** | 59 | 0.6% | 40th percentile (GPRO) |
| **50** | 83 | 0.8% | 50th percentile (GPRO) |
| **60** | 115 | 1.1% | 60th percentile (GPRO) |
| **70** | 130 | 1.3% | 70th percentile (GPRO) |
| **80** | 100 | 1.0% | 80th percentile (GPRO) |
| **90** | 125 | 1.2% | 90th percentile (GPRO) |

**Two Different Rating Systems:**

**System 1: HEDIS Star Rating (0-5)**
Used for HEDIS measures (83.8% of records)
| Stars | Performance Level | Percentile | Description |
|-------|------------------|------------|-------------|
| 5 ⭐⭐⭐⭐⭐ | 5 | ≥ 90th | Excellent |
| 4 ⭐⭐⭐⭐ | 4 | 75th-89th | Good |
| 3 ⭐⭐⭐ | 3 | 50th-74th | Average |
| 2 ⭐⭐ | 2 | 25th-49th | Below Average |
| 1 ⭐ | 1 | < 25th | Poor |
| 0 | 0 | N/A | Not Calculated |

**System 2: GPRO Percentile (30-90)**
Used for GPRO measures (16.2% of records)
- Values represent actual percentile ranking (30, 40, 50, 60, 70, 80, 90)
- 90 = 90th percentile (top 10% performance)
- 30 = 30th percentile (bottom 70%)

**Dashboard Color Coding:**
- 🟢 **Green** (Levels 4-5 or 80-90): Meeting goals
- 🟡 **Yellow** (Level 3 or 60-70): At risk
- 🔴 **Red** (Levels 1-2 or 30-50): Needs immediate attention
- ⚪ **Gray** (Level 0): No data

**Business Rules:**
- Performance Level determined by CMS based on national benchmarks
- Updated quarterly as new benchmark data becomes available
- Practices with average < 3 stars may face CMS penalties
- Used for public reporting and shared savings calculations

**Relationship to Rate:**
Generally (but not always):
- Rate ≥ 90% → Performance Level 5
- Rate 80-89% → Performance Level 4
- Rate 70-79% → Performance Level 3
- Rate 60-69% → Performance Level 2
- Rate < 60% → Performance Level 1

Note: Exact thresholds vary by measure based on national performance distribution

---

### 13. Program Goal
**Column Name:** `Program Goal`  
**Data Type:** Decimal (Float)  
**Range:** 0.0 to 0.98 (0% to 98%)  
**Precision:** 4 decimal places  
**Nullable:** No (Required)

**Definition:**  
The CMS target percentage that practices must achieve for this quality measure to receive full credit and avoid penalties.

**Distribution of Goals:**
| Goal % | Count | Percentage | Typical Measures |
|--------|-------|------------|------------------|
| **0.0%** | 1,239 | 12.0% | No goal set / Not applicable |
| **71.0%** | 21 | 0.2% | Difficult measures |
| **78.0%** | 345 | 3.3% | Cancer screening |
| **79.0%** | 820 | 7.9% | Preventive care |
| **80.0%** | 805 | 7.8% | Diabetes management |
| **81.0%** | 76 | 0.7% | Blood pressure |
| **82.0%** | 1,336 | 12.9% | Medication adherence |
| **84.0%** | 102 | 1.0% | Chronic disease |
| **85.0%** | 517 | 5.0% | Immunizations |
| **86.0%** | 124 | 1.2% | Care coordination |
| **87.0%** | 1,016 | 9.8% | Preventive services |
| **88.0%** | 575 | 5.6% | Screening programs |
| **89.0%** | 368 | 3.6% | High-priority measures |
| **90.0%** | 558 | 5.4% | Core measures |
| **90.73%** | 111 | 1.1% | Hypertension control |
| **92.0%** | 348 | 3.4% | Medication reconciliation |
| **92.3%** | 120 | 1.2% | Depression screening |
| **97.0%** | 789 | 7.6% | BMI assessment |
| **98.0%** | 988 | 9.5% | Tobacco screening |

**Common Goals by Category:**
- **Cancer Screening:** 70-80% (challenging due to patient compliance)
- **Diabetes Management:** 80-85% (standard of care)
- **Cardiovascular:** 75-85% (blood pressure, statins)
- **Medication Adherence:** 80-85% (pharmacy-based)
- **Immunizations:** 85-90% (public health priority)
- **Screening Programs:** 90-98% (easily documentable)

**Business Rules:**
- Goals set annually by CMS based on national feasibility studies
- Goals may vary by:
  - Patient population (Medicare vs Commercial)
  - Geographic region
  - Historical performance data
- Achieving goal = 5-star performance level (or 90th percentile for GPRO)
- Goals generally increase over time as national performance improves

**Relationship to Other Fields:**
```
If Rate ≥ Program Goal:
    Patients To Reach Program Goal = 0 (or negative)
    Performance Level = 5 (or 90)
    
If Rate < Program Goal:
    Patients To Reach Program Goal > 0
    Performance Level = 1-4 (or 30-80)
```

**Example Interpretation:**
```
Measure: Breast Cancer Screening
Program Goal: 0.90 (90%)
Practice Rate: 0.71 (71%)
Gap: 90% - 71% = 19 percentage points
Action: Need to screen 19 more patients per 100 to reach goal
```

---

### 14. Program Level
**Column Name:** `Program Level`  
**Data Type:** Text (String)  
**Nullable:** Yes (1,239 missing, 12.0%)  
**Unique Values:** 2

**Definition:**  
Categorical indicator of the performance benchmark tier that the practice must achieve.

**Distribution:**
| Program Level | Count | Percentage | Description |
|---------------|-------|------------|-------------|
| **5 STAR** | 8,230 | 79.5% | HEDIS 5-star performance benchmark |
| **90th** | 878 | 8.5% | 90th percentile GPRO benchmark |
| **NULL** | 1,239 | 12.0% | No benchmark assigned |

**Interpretation:**

**"5 STAR":**
- Indicates this is a HEDIS measure
- Practice must achieve 5-star rating (≥90th percentile nationally)
- Associated with Program Goal ranging from 78% to 98%
- Failure to achieve results in lower star rating

**"90th":**
- Indicates this is a GPRO measure
- Practice must achieve 90th percentile performance
- Associated with Program Goal of 90%
- Used for Medicare Shared Savings Program (MSSP) reporting

**NULL Values:**
- Occur in 12% of records
- Typically seen when:
  - Measure is informational only (no performance target)
  - Measure is new and benchmark not yet established
  - Data is from pilot program

**Business Rules:**
- Program Level aligns with Source field:
  - Source = "HEDIS" → Program Level = "5 STAR"
  - Source = "GPRO" → Program Level = "90th"
- Program Level determines which benchmark to use for performance evaluation

**Relationship to Performance Level:**
```
If Performance Level = 5 (or 90):
    Practice has achieved Program Level benchmark
    
If Performance Level < 5 (or < 90):
    Practice has NOT achieved Program Level benchmark
```

---

### 15. Patients To Reach Program Goal
**Column Name:** `Patients To Reach Program Goal`  
**Data Type:** Integer  
**Range:** -56 to 1,214  
**Nullable:** No (Required)

**Definition:**  
The number of additional patients who must close their care gap for the practice/location to meet the CMS target goal for this specific measure. This is the **primary action metric** in the dashboard.

**Statistical Summary:**
| Metric | Value |
|--------|-------|
| **Minimum** | -56 (exceeding goal) |
| **Maximum** | 1,214 (largest gap) |
| **Mean** | 6.2 patients |
| **Median** | 1 patient |
| **Total Across Dataset** | 64,631 patients |

**Distribution:**
| Range | Count | Percentage | Priority |
|-------|-------|------------|----------|
| **≤ 0** (Meeting/Exceeding Goal) | 4,368 | 42.2% | ✅ Maintain |
| **1-5** | 3,189 | 30.8% | 🟡 Monitor |
| **6-10** | 1,223 | 11.8% | 🟠 Act |
| **11-20** | 819 | 7.9% | 🔴 Urgent |
| **21-50** | 523 | 5.1% | 🔴 Critical |
| **51-100** | 163 | 1.6% | 🔴 Critical |
| **100+** | 62 | 0.6% | 🔴 Critical |

**Calculation Formula:**
```
PNTRG = (Program_Goal × Denominator) - Met

Where:
- Program_Goal = CMS target percentage (e.g., 0.90 = 90%)
- Denominator = Total eligible patients (Met + Not Met)
- Met = Patients currently meeting criteria

Example:
Program Goal = 90%
Denominator = 100 patients
Met = 71 patients

PNTRG = (0.90 × 100) - 71
PNTRG = 90 - 71
PNTRG = 19 patients
```

**Detailed Example:**
```
Practice: Garcia-James
Location: Campbell-Clark Medical Group
Measure: Breast Cancer Screening
Program Goal: 0.90 (90%)
Met: 87 patients
Not Met: 28 patients
Denominator: 115 patients (87 + 28)
Exclusions: 2 patients

Current Rate: 87 / 115 = 75.7%
PNTRG: (0.90 × 115) - 87 = 103.5 - 87 = 17 patients

Interpretation: Need 17 additional patients to receive mammograms to reach 90% goal
```

**Special Cases:**

**Negative Values (-56 to -1):**
- Indicates performance **exceeding** the goal
- Example: PNTRG = -10 means practice is 10 patients above the required target
- 81 records (0.8%) have negative PNTRG
- These practices have "cushion" and can maintain current level

**Zero Values:**
- Practice is exactly at goal (Rate = Program Goal)
- 1,287 records (12.4%) have PNTRG = 0

**High Values (100+):**
- Indicate significant performance gaps
- Require major intervention efforts
- Often seen in:
  - Large practices with many attributed patients
  - Measures with low baseline compliance (e.g., colorectal screening)
  - New measures where processes not yet established

**Business Uses:**

1. **Prioritization:**
   - Rank locations by PNTRG to identify highest-impact opportunities
   - Focus resources on top 10-20 locations (Pareto principle)

2. **Resource Allocation:**
   - Assign care coordinators to locations with PNTRG > 50
   - Deploy outreach campaigns to practices with PNTRG 20-50
   - Monitor practices with PNTRG 1-20

3. **Goal Tracking:**
   - Track PNTRG reduction quarter-over-quarter
   - Calculate gap closure rate: (PNTRG_Q1 - PNTRG_Q2) / PNTRG_Q1

4. **ROI Calculation:**
   - Each gap closed = $7,500 savings (avg readmission cost)
   - Total opportunity = 64,631 patients × $7,500 = $484M potential savings

**Dashboard Visualization:**
- **Top 20 bar chart:** Locations ranked by PNTRG (descending)
- **Color coding:** 
  - Green: PNTRG ≤ 0 (meeting goal)
  - Yellow: PNTRG 1-10 (small gap)
  - Orange: PNTRG 11-50 (moderate gap)
  - Red: PNTRG > 50 (large gap)
- **Filters:** By Practice, Patient Group, Measure Name

---

### 16. Export Timestamp
**Column Name:** `Export Timestamp`  
**Data Type:** DateTime  
**Format:** YYYY-MM-DD HH:MM:SS.mmm  
**Timezone:** Eastern Time (ET)  
**Nullable:** No (Required)

**Definition:**  
The date and time when this data record was extracted from the source system and exported to the reporting file.

**Statistical Summary:**
| Metric | Value |
|--------|-------|
| **Earliest Timestamp** | 2019-09-10 10:52:55.051 |
| **Latest Timestamp** | 2019-12-15 16:43:22.384 |
| **Unique Timestamps** | 157 distinct export times |
| **Most Common Date** | 2019-09-10 (1,681 records - 16.2%) |

**Distribution by Month:**
| Month | Records | Percentage |
|-------|---------|------------|
| September 2019 | 3,245 | 31.4% |
| October 2019 | 2,876 | 27.8% |
| November 2019 | 2,559 | 24.7% |
| December 2019 | 1,667 | 16.1% |

**Sample Values:**
- "2019-09-10 10:52:55.051"
- "2019-10-15 14:23:17.892"
- "2019-11-20 09:15:43.234"
- "2019-12-15 16:43:22.384"

**Business Context:**
- Data extracted quarterly for mid-year and end-of-year reporting
- Different timestamps indicate multiple export cycles (data refreshes)
- Used to track data lineage and version control
- Helps identify which reporting period a record belongs to

**Business Rules:**
- All records in a single export batch have the same timestamp
- Timestamp indicates data is current as of that point in time
- Performance metrics may have changed since export timestamp
- Dashboard users should check Export Timestamp to know data freshness

**Use Cases:**
1. **Version Control:** Identify which export cycle data came from
2. **Trend Analysis:** Compare performance across different timestamps
3. **Data Freshness:** Alert users if data is >90 days old
4. **Audit Trail:** Track when data was last updated

**Example Query:**
```sql
-- Get most recent data for each practice-measure combination
SELECT *
FROM cms_data
WHERE Export_Timestamp = (
    SELECT MAX(Export_Timestamp)
    FROM cms_data
)
```

---

## 📊 Appendix A: Complete CMS Measure List

### All 34 Quality Measures with Definitions

#### Cancer Screening Measures (3)

**1. ★Colorectal Cancer Screening (COL)**
- **Records:** 931
- **Average Rate:** 55.0%
- **Typical Goal:** 70%
- **Definition:** Percentage of adults aged 50-75 who had appropriate colorectal cancer screening
- **Screening Methods:** Colonoscopy (10 years), FIT test (annual), Cologuard (3 years)

**2. ★Breast Cancer Screening (BCS)**
- **Records:** 845
- **Average Rate:** 63.1%
- **Typical Goal:** 78-90%
- **Definition:** Percentage of women aged 50-74 who had mammogram within 27 months

**3. Breast Cancer Screening** (GPRO version)
- **Records:** 100
- **Average Rate:** 71.2%
- **Typical Goal:** 90%
- **Definition:** Similar to HEDIS BCS but with GPRO methodology

#### Diabetes Management Measures (6)

**4. ★Diabetes: HbA1c control <8.0%**
- **Records:** 615
- **Average Rate:** 65.7%
- **Typical Goal:** 80%
- **Definition:** Percentage of diabetic patients aged 18-75 with HbA1c < 8.0%

**5. ★Diabetes: HbA1c Poor control (≥8.0%)**
- **Records:** 79
- **Average Rate:** 34.3% (inverse measure)
- **Typical Goal:** <20%
- **Definition:** Percentage with poor control (lower is better)

**6. Diabetes: Hemoglobin A1c Poor Control**
- **Records:** 89
- **Average Rate:** 31.2%
- **Typical Goal:** <15%

**7. ★Diabetes: Eye exam (retinal) performed**
- **Records:** 691
- **Average Rate:** 68.4%
- **Typical Goal:** 85%
- **Definition:** Diabetic retinal eye exam within 12 months

**8. ★Diabetes: Medical attention for nephropathy**
- **Records:** 691
- **Average Rate:** 90.0%
- **Typical Goal:** 90%
- **Definition:** Urine protein test or ACE/ARB medication

**9. Diabetes: Hemoglobin A1c Control (< 8.0%) (THN)**
- **Records:** 90
- **Average Rate:** 67.8%
- **Typical Goal:** 80%

**10. Diabetes: Hemoglobin A1c Control (< 9.0%) (THN)**
- **Records:** 90
- **Average Rate:** 79.4%
- **Typical Goal:** 85%

**11. Diabetes: Medical Attention for Nephropathy (THN)**
- **Records:** 90
- **Average Rate:** 89.3%
- **Typical Goal:** 90%

#### Cardiovascular Measures (4)

**12. ★Controlling High Blood Pressure (CBP)**
- **Records:** 689
- **Average Rate:** 80.5%
- **Typical Goal:** 82%
- **Definition:** BP < 140/90 mmHg

**13. Hypertension (HTN): Controlling High Blood Pressure**
- **Records:** 111
- **Average Rate:** 78.9%
- **Typical Goal:** 90.73%

**14. ★Medication Adherence for Hypertension (ACEi or ARB) and RASA**
- **Records:** 575
- **Average Rate:** 83.5%
- **Typical Goal:** 88%

**15. Statin Therapy for the Prevention and Treatment of Cardiovascular Disease**
- **Records:** 108
- **Average Rate:** 74.2%
- **Typical Goal:** 92%

#### Medication Adherence Measures (3)

**16. ★Medication Adherence for Oral Diabetes Medications**
- **Records:** 517
- **Average Rate:** 81.6%
- **Typical Goal:** 87%

**17. ★Medication Adherence for Cholesterol (Statins)**
- **Records:** 401
- **Average Rate:** 83.0%
- **Typical Goal:** 87%

#### Preventive Care & Screening (8)

**18. ★Adult BMI Assessment (ABA)**
- **Records:** 912
- **Average Rate:** 78.5%
- **Typical Goal:** 97%

**19. ★Unhealthy Alcohol Use Screening and Follow-Up (ASF)**
- **Records:** 218
- **Average Rate:** 52.6%
- **Typical Goal:** 79%

**20. Preventive Care and Screening: Influenza Immunization**
- **Records:** 118
- **Average Rate:** 61.4%
- **Typical Goal:** 92.3%

**21. Preventive Care and Screening: Screening for Clinical Depression and Follow-up Plan**
- **Records:** 120
- **Average Rate:** 68.9%
- **Typical Goal:** 92.3%

**22. Preventive Care and Screening: Tobacco Use: Screening and Cessation Intervention**
- **Records:** 120
- **Average Rate:** 83.3%
- **Typical Goal:** 98%

**23. Falls: Screening for Future Fall Risk**
- **Records:** 111
- **Average Rate:** 62.7%
- **Typical Goal:** 87%

**24. Colorectal Cancer Screening** (GPRO version)
- **Records:** 109
- **Average Rate:** 69.8%
- **Typical Goal:** 90%

#### Chronic Disease Management (5)

**25. ★Disease-Modifying Anti-Rheumatic Drug Therapy for Rheumatoid Arthritis (ART)**
- **Records:** 396
- **Average Rate:** 68.9%
- **Typical Goal:** 87%

**26. ★Osteoporosis Management in Women Who Had a Fracture (OMW)**
- **Records:** 366
- **Average Rate:** 44.5%
- **Typical Goal:** 71%

**27. Depression Remission at Twelve Months**
- **Records:** 56
- **Average Rate:** 38.2%
- **Typical Goal:** 10%

#### Care for Older Adults (3)

**28. ★Care for Older Adults (COA): Functional Status Assessment**
- **Records:** 174
- **Average Rate:** 71.5%
- **Typical Goal:** 87%

**29. ★Care for Older Adults (COA): Medication Review**
- **Records:** 174
- **Average Rate:** 80.2%
- **Typical Goal:** 87%

**30. ★Care for Older Adults (COA): Pain Assessment**
- **Records:** 174
- **Average Rate:** 74.8%
- **Typical Goal:** 87%

#### Wellness & Visits (4)

**31. Annual Wellness Bundle (THN)**
- **Records:** 218
- **Average Rate:** 60.2%
- **Typical Goal:** 85%

**32. Visits: Annual Wellness Visit (THN)**
- **Records:** 123
- **Average Rate:** 54.7%
- **Typical Goal:** 80%

**33. Visits: Visit at PCP Location (THN)**
- **Records:** 123
- **Average Rate:** 68.3%
- **Typical Goal:** 85%

**34. Visits: Wellness Bundle (THN)**
- **Records:** 123
- **Average Rate:** 58.9%
- **Typical Goal:** 85%

---

## 🔍 Data Relationships & Keys

### Primary Key
No single primary key exists. Unique record identifier is a composite key:
```
PRIMARY KEY = Practice + Location + Measure Name + Patient Group + Export Timestamp
```

### Foreign Key Relationships
1. **Practice → Location** (1:N)
   - One practice has multiple locations
   - Average: 3.2 locations per practice

2. **Patient Group → Multiple Records** (1:N)
   - Each patient group appears across multiple practices and measures

3. **Measure Name → Multiple Records** (1:N)
   - Each measure tracked across all practices and patient groups

### Entity Relationship Diagram
```
┌─────────────┐       ┌──────────────┐       ┌───────────────┐
│  Practice   │1─────N│  Location    │1─────N│    Record     │
│ (85 unique) │       │ (271 unique) │       │   (10,347)    │
└─────────────┘       └──────────────┘       └───────────────┘
                                                      │N
                                                      │
                                                      │1
                                              ┌───────────────┐
                                              │ Patient Group │
                                              │  (12 unique)  │
                                              └───────────────┘
                                                      │N
                                                      │
                                                      │1
                                              ┌───────────────┐
                                              │ Measure Name  │
                                              │  (34 unique)  │
                                              └───────────────┘
```

---

## ✅ Data Quality Validation Rules

### Field-Level Validations

1. **Rate Calculation Accuracy**
   ```
   Calculated_Rate = Met / (Met + Not Met)
   ASSERT: ABS(Rate - Calculated_Rate) < 0.01
   Current Pass Rate: 98.2%
   ```

2. **Denominator Integrity**
   ```
   Denominator = Met + Not Met
   ASSERT: Denominator = Met + Not Met
   Current Pass Rate: 98.7%
   ```

3. **PNTRG Calculation**
   ```
   PNTRG = (Program_Goal × Denominator) - Met
   ASSERT: PNTRG matches calculation within ±1
   ```

4. **Performance Level Consistency**
   ```
   IF Rate ≥ Program_Goal THEN Performance_Level ∈ {5, 90}
   IF Rate < Program_Goal THEN Performance_Level ∈ {0, 1, 2, 3, 4, 30-80}
   ```

5. **Non-Negative Constraints**
   ```
   ASSERT: Met ≥ 0
   ASSERT: Not_Met ≥ 0
   ASSERT: Denominator ≥ 0
   ASSERT: Exclusions ≥ 0
   ASSERT: Exceptions ≥ 0
   ```

6. **Rate Range**
   ```
   ASSERT: Rate ≥ 0.0 AND Rate ≤ 1.0
   ```

7. **Program Goal Range**
   ```
   ASSERT: Program_Goal ≥ 0.0 AND Program_Goal ≤ 1.0
   ```

### Record-Level Validations

1. **Required Fields**
   - All fields except Practice and Program Level must be non-null

2. **Practice-Location Relationship**
   - Each Location must belong to exactly one Practice

3. **Source-Program Level Alignment**
   - IF Source = "HEDIS" THEN Program_Level = "5 STAR" (when not null)
   - IF Source = "GPRO" THEN Program_Level = "90th" (when not null)

---

## 📊 Sample Data Records

### High Performer (Meeting Goal)
```
Source: GPRO
Patient Group: Group Ohb
Measure Name: Breast Cancer Screening
Practice: Morales-Jones
Location: Mcdaniel, Bentley and Mclaughlin Medical Group
Met: 1
Not Met: 0
Denominator: 1
Rate: 1.0 (100%)
Performance Level: 90
Program Goal: 0.9 (90%)
PNTRG: 0
```

### Small Gap
```
Source: GPRO
Patient Group: Group Ohb
Measure Name: Breast Cancer Screening
Practice: Blake and Sons
Location: Garcia, Humphrey and Baker Medical Group
Met: 5
Not Met: 2
Denominator: 7
Rate: 0.71429 (71.4%)
Performance Level: 70
Program Goal: 0.9 (90%)
PNTRG: 2
```

### Large Gap
```
Source: GPRO
Patient Group: Group Ohb
Measure Name: Preventive Care and Screening: Influenza Immunization
Practice: Ferrell, Rice and Maddox
Location: Lewis-Murphy Medical Group
Met: 142
Not Met: 169
Denominator: 311
Rate: 0.45659 (45.7%)
Performance Level: 40
Program Goal: 0.9 (90%)
PNTRG: 138
```

---

## 📝 Version History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2019-Q4 | Initial data consolidation | G. Palomarez |
| 2.0 | 2024 | De-identified for portfolio, comprehensive data dictionary | G. Palomarez |

---

## 📧 Questions or Issues?

For questions about this data dictionary or the CMS Dashboard project:

**Contact:** Gabriel Palomarez  
**GitHub:** [@gpalomar12](https://github.com/gpalomar12)  
**Project:** [CMS Gaps in Care Dashboard](https://github.com/gpalomar12/Data-Projects-Portfolio)

---

**Last Updated:** February 2026  
**Document Status:** Complete
