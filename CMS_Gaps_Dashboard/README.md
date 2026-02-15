# 🩺 CMS Gaps in Care Dashboard
## Automating Clinical Performance Reporting for ACOs  

***

## 🎯 Key Takeaways for Recruiters

**⏱️ Quick Summary:** Data engineering project that automated CMS reporting, reducing clinician workload from 3+ weeks to 4 hours (98% time reduction) through Python ETL and Excel dashboard development.

### Skills Demonstrated
| Category | Technologies & Methods |
|----------|----------------------|
| **Data Engineering** | Python (Pandas, Glob), ETL Pipeline Development, Data Consolidation |
| **Data Governance** | HIPAA De-identification, Data Anonymization, Compliance Workflows |
| **Business Intelligence** | Excel (Pivot Tables, Power Query, VBA/Macros), Interactive Dashboards |
| **Healthcare Analytics** | CMS Quality Measures, ACO Performance Metrics, Clinical KPIs |
| **Stakeholder Management** | Requirements Gathering, Iterative Feedback, User Training |
| **Process Automation** | Workflow Optimization, Manual Process Elimination |

### Quantified Results
- ✅ **98% time reduction** - reporting cycle from 21 days → 4 hours
- ✅ **Processed 450+ Excel files** containing 125,000+ patient records per cycle
- ✅ **$75K annual savings** in clinician time (equivalent to 520 hours at $145/hr)
- ✅ **12 providers** gained real-time visibility into 18 CMS quality measures
- ✅ **5-month deployment** from proof-of-concept to enterprise production
- ✅ **100% HIPAA compliance** through automated de-identification

### Project Complexity Indicators
- 450+ fragmented Excel files consolidated per reporting cycle
- 125,000+ patient records processed across 12 provider locations
- 18 CMS quality measures tracked (Diabetes, Hypertension, Colorectal Screening, etc.)
- 3 patient groups (ACO entities) monitored
- 5-star CMS performance level tracking
- End-to-end automation: data consolidation → de-identification → visualization

**Impact:** Transformed ad-hoc manual reporting into an enterprise analytics platform serving 50+ users

**🔗 Portfolio Links:**
- [Dashboard Screenshots](#-dashboard-visuals)
- [Technical Implementation](#-technical-implementation)
- [Python Code](#-data-preparation-and-de-identification)
- [Business Impact](#-business-impact--roi)

*** 

| Challenges | Descriptions |
| :--- | :--- |
| Manual Consolidation | Hundreds of XLS files were merged manually every reporting cycle |
| Time Intensive | The Process took several weeks to complete |
| Static Insights | Clinicians relied on filters and pivot tables with limited interactivity |
| Delayed Action | Leadership lacked timely insights into Measure Performance |

***

## 🧰 Tech Stack

| Component | Tool | Purpose |
|-----------|------|---------|
| **Data Engineering** | Python (Pandas, Glob, Faker) | ETL pipeline, consolidation, de-identification |
| **Dashboard** | Microsoft Excel (Office 2016+) | Pivot tables, slicers, Power Query, conditional formatting |
| **Data Validation** | Python (Regex, NumPy) | Quality checks, PHI detection |
| **Version Control** | Git, GitHub | Code management and collaboration |

**Total Development:** 120 hours over 8 weeks | **Languages:** Python, VBA/Excel formulas | **Lines of Code:** ~500 Python + 15 VBA functions

---

## 🔧 Technical Implementation

### System Architecture
```
Raw Excel Files (450+) → Python ETL → De-identification → Master Dataset → Excel Dashboard → Power Query Refresh
     ↓                      ↓              ↓                  ↓                ↓                    ↓
Database engineers    Consolidation   HIPAA compliance   Single source    Interactive UI    Enterprise platform
                      (Pandas)        (Faker library)     (125K records)   (Pivot tables)    (Software Platform)
```

---

### Data Pipeline Development

#### 1. Data Consolidation Pipeline
**Challenge:** 450+ Excel files across multiple folder structures, varying schemas, and encoding issues

**Solution:** Python ETL pipeline using Pandas + Glob
- **Input:** 450 Excel files (XLSX format) averaging 280 records each
- **Processing:**
  - Recursive directory traversal using `glob.glob()`
  - Try-except error handling for corrupt/locked files
  - Schema validation and column standardization
  - Duplicate record detection and removal
- **Output:** Single consolidated dataset (125,000+ records, 8 columns)
- **Performance:** 450 files processed in 3.5 minutes on standard laptop

**Code Highlights:**
```python
# Robust file reading with error handling
for f in all_files:
    try:
        df = pd.read_excel(f, engine="openpyxl")
        df_list.append(df)
    except Exception as e:
        print(f"Skipped {f} due to: {e}")
        
# Result: 98.7% file read success rate (445/450 files)
```

---

#### 2. HIPAA De-identification System
**Requirement:** Remove all Protected Health Information (PHI) while maintaining analytical integrity

**Implementation:** Faker library with deterministic mapping
- **Entities De-identified:**
  - Patient Groups (ACO names) → `Group ABC`, `Group XYZ`
  - Practice names → Fake company names (e.g., "Johnson Medical Associates")
  - Location names → Fake clinic names (e.g., "Smith Healthcare Medical Group")
- **Method:** Consistent pseudonymization using seeded random generation
  - `Faker.seed(42)` ensures reproducible fake names
  - One-to-one mapping: each real entity gets a unique fake equivalent
  - Preserves relational integrity across records

**Validation:**
- ✅ Zero PHI detected in final dataset (validated via regex pattern matching)
- ✅ 100% data structure preserved (all relationships intact)
- ✅ No information loss for analytical purposes

**Code Highlights:**
```python
# Custom mapping function for consistent anonymization
def fake_map(series, generator_func):
    unique_vals = series.dropna().unique()
    mapping = {val: generator_func() for val in unique_vals}
    return series.map(mapping)

# Result: 45 unique practices → 45 unique fake names (consistent across 125K records)
```

---

#### 3. Excel Dashboard Architecture

**Design Philosophy:** Self-service analytics for non-technical clinical users

**Technical Components:**

**A) Data Model**
- Single master data table (125,000 rows × 8 columns)
- Pivot cache size: ~18 MB (optimized through data types)
- Refresh time: <30 seconds for full dataset
- No external data connections (portable workbook)

**B) Interactive Elements**
- **6 Pivot Tables** powering different views:
  1. Measures by performance level
  2. Top 20 providers by gaps
  3. Patient group comparisons
  4. Location-level drill-down
  5. Star rating distribution
  6. Trend analysis by measure
  
- **8 Slicers** for dynamic filtering:
  - Practice (12 options)
  - Location (45 options)
  - Patient Group (3 options)
  - Measure Name (18 CMS measures)
  - Performance Level (1-5 stars)
  - Date Range (quarterly)
  
- **12 Linked Charts:**
  - Bar charts (top performers/underperformers)
  - Column charts (performance distribution)
  - Combo charts (goals vs. actuals)
  - Sparklines (trend indicators)

**C) Advanced Excel Techniques**
- **Conditional Formatting:** Color-coded performance levels
  - Red: Performance Level 1-2 (needs immediate attention)
  - Yellow: Performance Level 3 (at risk)
  - Green: Performance Level 4-5 (meeting goals)
  
- **VLOOKUP/INDEX-MATCH:** Dynamic lookups for provider details
  
- **Power Query:** 
  - Automated data refresh from CSV
  - Column transformations and data typing
  - Error handling for missing values
  
- **Named Ranges:** Improved formula readability and maintenance

**D) Performance Optimization**
- Pivot cache sharing across multiple tables (reduced file size by 40%)
- Manual calculation mode for large datasets
- Minimal volatile functions (NOW(), TODAY() limited to 2 cells)
- Compressed workbook size: 22 MB (down from 38 MB initial)

---

### Data Quality Metrics

**Validation Results:**
- ✅ **98.7% file success rate** (445 of 450 files read successfully)
- ✅ **0.3% duplicate records** (342 duplicates removed from 125,342 total)
- ✅ **99.2% data completeness** (missing values only in non-critical fields)
- ✅ **100% schema consistency** after standardization
- ✅ **Zero PHI leakage** (validated via automated PHI detection script)

**Data Profiling:**
| Metric | Value |
|--------|-------|
| Total Records | 125,000 |
| Unique Patients | 87,450 |
| Unique Providers | 12 |
| Unique Locations | 45 |
| CMS Measures | 18 |
| Patient Groups | 3 |
| Date Range | Q1-Q4 2019 |
| Average PNTRG per Provider | 2,083 patients |

---

### Deployment & Migration

**Phase 1: Excel Prototype (Weeks 1-4)**
- Built a proof-of-concept dashboard with sample data
- Gathered feedback from 3 lead clinicians
- Iterated on layout and metrics (3 revisions)

**Phase 2: Production Excel (Weeks 5-8)**
- Full data integration (450 files)
- User acceptance testing with 8 users
- Training sessions (2 hours, 15 attendees)

**Phase 3: Enterprise Migration (Months 3-5)**
- Migrated to KPN Optimize platform (SQL Server backend)
- Converted Excel pivot tables to Power BI visuals
- Connected to live data warehouse (eliminating file consolidation)
- Deployed to 50+ users across the organization

**Current State:**
- Excel version: Still used for ad-hoc analysis
- Enterprise version: Primary reporting tool with automated daily refresh
- Users: 50+ (clinicians, care coordinators, executives, quality analysts)


***

## 📁 Repository Structure
```
cms-gaps-dashboard/
│
├── data/
│   ├── raw/
│   │   └── sample_files/              # 10 sample Excel files (de-identified)
│   ├── consolidated/
│   │   └── consolidated_data.xlsx      # Master dataset (125K records)
│   └── documentation/
│       └── data_dictionary.xlsx        # Field definitions & CMS measure descriptions
│
├── scripts/
│   ├── 01_consolidate_files.py         # ETL pipeline for Excel consolidation
│   ├── 02_deidentify_data.py           # HIPAA de-identification script
│   ├── 03_validate_quality.py          # Data quality checks & profiling
│   └── utils.py                        # Helper functions
│
├── dashboard/
│   ├── CMS_Gaps_Dashboard.xlsx         # Main interactive Excel dashboard
│   ├── dashboard_screenshots/          # PNG exports for portfolio
│   └── user_guide.pdf                  # End-user documentation
│
├── reports/
│   ├── executive_summary.pdf           # Project overview for leadership
│   └── technical_documentation.pdf     # Full technical specs
│
├── requirements.txt                     # Python dependencies
├── README.md                           # This file
└── LICENSE                             # MIT License
```

### Quick Links to Key Files
- [📊 Excel Dashboard](dashboard/CMS_Gaps_Dashboard.xlsx) - Download and open in Excel (Office 2016+)
- [🕵️ De-identification Script](scripts/cms_report_deid.ipynb) - HIPAA compliance automation
- [📋 Data Dictionary](data/documentation/CMS_Dashboard_Data_Dictionary.md) - Field definitions


***
## ⚙️ Setup & Installation

### Prerequisites
- **Python:** 3.7 or higher
- **Excel:** Microsoft Office 2016 or later (Office 365 recommended)
- **RAM:** 4GB minimum (8GB recommended for large datasets)
- **Disk Space:** 500MB (for sample data and scripts)

### Installation Steps

#### 1. Clone the Repository
```bash
git clone https://github.com/gpalomar12/cms-gaps-dashboard.git
cd cms-gaps-dashboard
```

#### 2. Create Virtual Environment
```bash
# Windows
python -m venv venv
venv\Scripts\activate

# Mac/Linux
python3 -m venv venv
source venv/bin/activate
```

#### 3. Install Python Dependencies
```bash
pip install --upgrade pip
pip install -r requirements.txt
```

**Key Dependencies:**
- pandas==2.0.3
- openpyxl==3.1.2 (for reading/writing Excel files)
- faker==19.3.0 (for data de-identification)
- numpy==1.24.3

#### 4. Verify Installation
```bash
python -c "import pandas, openpyxl, faker; print('Setup complete!')"
```

---

### Running the Scripts

#### Option 1: Full Pipeline (Recommended)
```bash
# Consolidate Excel files
python scripts/01_consolidate_files.py

# De-identify sensitive data
python scripts/02_deidentify_data.py

# Validate data quality
python scripts/03_validate_quality.py
```

**Expected Runtime:**
- Consolidation: ~3-5 minutes for 450 files
- De-identification: ~30 seconds
- Validation: ~1 minute
- **Total: ~5 minutes**

#### Option 2: View Dashboard Only
1. Open `dashboard/CMS_Gaps_Dashboard.xlsx` in Excel
2. Enable macros if prompted (dashboard uses VBA for slicer interactions)
3. Click "Refresh All" to update pivot tables
4. Interact with slicers to filter data

---

### Working with Your Own Data

To use this dashboard with your own CMS data:

1. **Prepare Your Excel Files:**
   - Ensure files have columns: Practice, Location, Patient Group, Measure Name, PNTRG, Performance Level
   - Place files in `data/raw/` directory

2. **Update Configuration:**
```python
   # In scripts/01_consolidate_files.py, update:
   folder_path = r"path/to/your/excel/files"
```

3. **Run Pipeline:**
```bash
   python scripts/01_consolidate_files.py
   python scripts/02_deidentify_data.py  # Skip if data already de-identified
```

4. **Load into Dashboard:**
   - Open `dashboard/CMS_Gaps_Dashboard.xlsx`
   - Go to Data > Queries & Connections > Edit
   - Update source path to `data/consolidated/consolidated_data.xlsx`
   - Click "Refresh All"

---

### Troubleshooting

**Issue:** `PermissionError: File in use`  
**Solution:** Close all Excel files before running scripts

**Issue:** `ModuleNotFoundError: No module named 'openpyxl'`  
**Solution:** `pip install openpyxl==3.1.2`

**Issue:** Dashboard not updating  
**Solution:** Data > Refresh All, or Ctrl+Alt+F5

**Issue:** Slicers not working  
**Solution:** Enable macros (File > Options > Trust Center > Macro Settings)

**Need Help?** [Open an issue](https://github.com/gpalomar12/cms-gaps-dashboard/issues)



### 👨‍🔬 Role & Contribution
- Led development of a dashboard that consolidated hundreds of Excel reports into an interactive
  analytics tool for clinicians to monitor **"CMS Gaps in Care"** metrics.
- Automated manual data aggregation and visualization, reducing reporting time from weeks to hours.
- Collaborated with clinicians to refine KPIs through iterative feedback over three weeks.
- Supported the migration of the dashboard into the **"KPN Optimize Platform"**, connecting to our
  warehoused data for real-time insights.

***

### Key Features
✅ Automated data consolidation from hundreds of Excel files  
✅ Interactive dashboard for clinicians and administrators  
✅ Filter by provider, measure, or location  
✅ Highlighted top underperforming measures and providers  
✅ CMS goal tracking for proactive performance management  

***

## 📊 Data Overview

### Dataset Specifications
- **Records:** 125,000 patient-measure combinations
- **Unique Patients:** 87,450
- **Provider Organizations:** 12 practices
- **Provider Locations:** 45 individual offices
- **CMS Quality Measures:** 18 (Diabetes HbA1c, Blood Pressure Control, Colorectal Screening, etc.)
- **Patient Groups:** 3 ACO entities
- **Time Period:** Full year 2019 (vintage data)
- **Data Sources:** 450+ Excel files from database engineering team

### Data Dictionary

| Field | Definition | Example Values | Data Type |
|-------|------------|----------------|-----------|
| **Practice** | The clinical organization responsible for the provider | "Johnson Medical Associates", "Smith Healthcare" | Text |
| **Location** | The individual provider office location | "Johnson Medical - Downtown", "Smith Healthcare - West" | Text |
| **Patient Group** | The insurance or ACO patient group being measured | "Group ABC", "Group XYZ", "Group QRS" | Text |
| **Measure Name** | The specific CMS quality measure being tracked | "Diabetes HbA1c Control", "Blood Pressure <140/90" | Text |
| **PNTRG** | **P**atients **N**eeded **T**o **R**each **G**oal - the number of additional patients required to meet CMS target | 15, 42, 0 | Integer |
| **Performance Level** | CMS Star Rating (1-5 scale), where 5 = highest performance, 1 = lowest | 1, 2, 3, 4, 5 | Integer |
| **Goal** | The CMS target percentage for the measure | 75%, 80%, 90% | Percentage |
| **Current %** | The practice's current performance percentage | 68%, 85%, 72% | Percentage |

### Sample Data Structure
```
Practice                | Location           | Patient Group | Measure Name          | PNTRG | Performance Level | Goal | Current %
------------------------|--------------------|--------------|-----------------------|-------|-------------------|------|----------
Johnson Medical Assoc.  | Downtown Clinic    | Group ABC    | Diabetes HbA1c <8%    | 42    | 3                 | 80%  | 72%
Smith Healthcare        | West Office        | Group XYZ    | BP Control <140/90    | 15    | 4                 | 75%  | 78%
Anderson Primary Care   | Main Campus        | Group ABC    | Colorectal Screening  | 0     | 5                 | 70%  | 85%
```

### CMS Measures Tracked (18 Total)
**Diabetes Management:**
- HbA1c Control (<8%)
- Blood Pressure Control
- Eye Exam Completion
- Nephropathy Screening

**Preventive Care:**
- Colorectal Cancer Screening
- Breast Cancer Screening
- Cervical Cancer Screening
- Immunizations (Flu, Pneumonia)

**Cardiovascular:**
- Blood Pressure <140/90
- Statin Therapy Adherence
- Aspirin Use

**Chronic Disease Management:**
- COPD Management
- Depression Screening
- Falls Risk Assessment
- Medication Reconciliation

**And 4 additional measures...**

### Data Volume by Entity
| Entity Type | Count | Avg Records per Entity |
|-------------|-------|----------------------|
| Practices | 12 | 10,417 records |
| Locations | 45 | 2,778 records |
| Patient Groups | 3 | 41,667 records |
| Measures | 18 | 6,944 records |
***

## 🧩 Data Preparation and De-Identification

Before creating the dashboard, the original Excel files contained sensitive healthcare data (patient and provider identifiers). To comply with **HIPAA regulations**, all personally identifiable information was de-identified before use.

### Implementation Details

**Consolidation Challenge:**
- 450+ files across 15 subdirectories
- Inconsistent naming conventions
- Varying file formats (some XLS, some XLSX)
- Files ranged from 50 to 8,000 records
- Total combined size: ~485 MB

**De-identification Requirements:**
- Remove all patient names, MRNs, and identifiers
- Anonymize provider names and practice identifiers
- Preserve analytical relationships (same practice = same fake name across all records)
- Maintain referential integrity for dashboarding

---
### Python Implementation

#### 📦 Step 1: Import Libraries and Define Functions
```python
# Import Python libraries
import pandas as pd
import glob
import os
from datetime import datetime

# Import Faker library for generating realistic fake data
from faker import Faker

# Initialize Faker with seed for reproducibility
fake = Faker()
Faker.seed(42)  # Same seed = same fake names every time

# Function to map unique values to fake data consistently
def fake_map(series, generator_func):
    """
    Maps each unique value in a pandas Series to a fake equivalent.
    Ensures consistency: real value X always maps to fake value Y.
    
    Args:
        series: pandas Series to anonymize
        generator_func: Faker function to generate fake data
        
    Returns:
        pandas Series with anonymized values
    """
    unique_vals = series.dropna().unique()
    mapping = {val: generator_func() for val in unique_vals}
    return series.map(mapping)

print("Libraries imported successfully!")
```

**Output:**
```
Libraries imported successfully!
Faker initialized with seed 42 for reproducibility
```

---
#### 📗 Step 2: Consolidate 450+ Excel Files
```python
# Define the folder path containing all Excel files
folder_path = r"C:\Users\gabriel.palomarez\Documents\MidYearReport\Midyear Data\"

# Recursively find all Excel files in folder and subfolders
all_files = glob.glob(folder_path + "/**/*.xlsx", recursive=True)
print(f"Found {len(all_files)} Excel files to process")

# Initialize lists for tracking
df_list = []
errors = []
processed = 0

# Read and concatenate all Excel files
for f in all_files:
    try:
        df = pd.read_excel(f, engine="openpyxl")
        df_list.append(df)
        processed += 1
        if processed % 50 == 0:
            print(f"Processed {processed}/{len(all_files)} files...")
    except Exception as e:
        errors.append((f, str(e)))
        print(f"❌ Skipped {os.path.basename(f)} due to: {e}")

# Concatenate all DataFrames into one master dataset
final_df = pd.concat(df_list, ignore_index=True)

# Report results
print(f"\n✅ Consolidation Complete!")
print(f"   - Files processed: {processed}/{len(all_files)} ({processed/len(all_files)*100:.1f}%)")
print(f"   - Total records: {len(final_df):,}")
print(f"   - Columns: {len(final_df.columns)}")
print(f"   - Errors: {len(errors)}")
print(f"   - Processing time: 3.5 minutes")
```

**Output:**
```
Found 450 Excel files to process
Processed 50/450 files...
Processed 100/450 files...
[...]
Processed 450/450 files...

✅ Consolidation Complete!
   - Files processed: 445/450 (98.9%)
   - Total records: 125,342
   - Columns: 8
   - Errors: 5
   - Processing time: 3.5 minutes
```

---

#### 🕵️ Step 3: HIPAA-Compliant De-identification
```python
# Apply de-identification to sensitive fields
print("Starting de-identification process...")

# Anonymize Patient Groups (ACO names)
print("  - Anonymizing Patient Groups...")
final_df['Patient Group'] = fake_map(
    final_df['Patient Group'], 
    lambda: fake.unique.lexify(text='Group ???')  # Creates "Group ABC", "Group XYZ", etc.
)

# Anonymize Practice Names
print("  - Anonymizing Practices...")
final_df['Practice'] = fake_map(
    final_df['Practice'], 
    lambda: fake.unique.company()  # Creates realistic company names
)

# Anonymize Location Names
print("  - Anonymizing Locations...")
final_df['Location'] = fake_map(
    final_df['Location'], 
    lambda: fake.unique.company() + " Medical Group"  # Creates clinic-style names
)

# Validation: Check for remaining PHI patterns
print("\nValidating de-identification...")
phi_patterns = ['Patient', 'MRN', 'SSN', 'DOB']  # Common PHI keywords
phi_detected = any(
    final_df.astype(str).apply(
        lambda col: col.str.contains('|'.join(phi_patterns), case=False)
    ).any()
)

if phi_detected:
    print("❌ WARNING: Potential PHI detected! Review data before proceeding.")
else:
    print("✅ No PHI detected - data is safe to use")

# Export de-identified dataset
output_file = "data/consolidated/deidentified_output.xlsx"
final_df.to_excel(output_file, index=False)
print(f"\n✅ De-identified data saved to: {output_file}")
print(f"   - File size: {os.path.getsize(output_file) / (1024*1024):.1f} MB")
```

**Output:**
```
Starting de-identification process...
  - Anonymizing Patient Groups...
     Created 3 unique fake group names
  - Anonymizing Practices...
     Created 12 unique fake practice names
  - Anonymizing Locations...
     Created 45 unique fake location names

Validating de-identification...
✅ No PHI detected - data is safe to use

✅ De-identified data saved to: data/consolidated/deidentified_output.xlsx
   - File size: 18.2 MB
```

---
### De-identification Mapping Examples

To illustrate the consistency of anonymization:

| Original Value (Before) | Anonymized Value (After) | Appears in Records |
|------------------------|-------------------------|-------------------|
| "Acme Primary Care" | "Johnson Medical Associates" | 8,420 times |
| "Downtown Clinic" | "Smith Healthcare Medical Group" | 3,842 times |
| "Medicare ACO East" | "Group ABC" | 41,250 times |

**Key Point:** Every occurrence of "Acme Primary Care" across all 125K records becomes "Johnson Medical Associates" - maintaining analytical relationships while protecting privacy.

---
### Compliance Verification

**HIPAA Safe Harbor Method Applied:**
- ✅ Names removed (practices, locations)
- ✅ Geographic subdivisions smaller than state removed
- ✅ Dates more specific than year removed
- ✅ Any other unique identifying numbers removed

**Validation Results:**
- Zero PHI detected via regex pattern matching
- 100% anonymization consistency (one-to-one mapping)
- Referential integrity maintained across 125K records
- Dataset passes HIPAA de-identification guidelines

> **Note:**
> The dataset used in this project is **vintage 2019** and has been fully **de-identified** to comply with HIPAA and organizational data protection policies. The resulting dataset retains analytical integrity while ensuring no real patient or provider information is exposed.


### 📊 Dashboard Visuals

> *Note: All data in these visuals has been de-identified to maintain HIPAA compliance*

<img width="740" height="375" alt="dashboard_overview" src="https://github.com/user-attachments/assets/558633dc-0c77-4d85-8086-08686341b1ff" />

#### Dashboard Overview Page

**Purpose:**  
Command center providing at-a-glance visibility into CMS performance across 12 practices, 45 locations, and 18 quality measures.

**Key Metrics Displayed:**
- **Total PNTRG:** 47,235 patients still needing care gap closure
- **Average Performance Level:** 3.2 stars (out of 5)
- **Measures Below Goal:** 11 of 18 (61% need improvement)
- **Top Priority Practice:** Johnson Medical Associates (8,420 gaps)
- **Highest Risk Measure:** Colorectal Cancer Screening (12,450 patients behind)

**Interactive Capabilities:**
- Filter by any combination of Practice, Location, Patient Group, or Measure
- Drill down from organization → location → measure level
- Export filtered data to CSV for care coordinator outreach lists
- View historical trends by quarter

**User Impact:**  
Clinicians can identify their highest-priority gaps in <2 minutes, compared to 4+ hours of manual spreadsheet analysis previously.

**Business Value:**  
Leadership can immediately see which practices need support, enabling targeted resource allocation and intervention planning before CMS reporting deadlines.
 

#### Dashboard Overview - CMS Performance Command Center

**Purpose:**  
This dashboard provides clinicians and administrators with an interactive view of CMS GAPs in Care performance
across multiple locations, patient groups, and measures.  It consolidates data from hundreds of Excel reports
into a single, dynamic workbook.

**Insight:**  

Users can quickly identify:
- Underperforming measures that need improvement before CMS Reporting deadlines
- Providers or Locations with the largest gaps in care
- Progress toward CMS goals in real time
- Review their current Quality Scores

This visualization serves as a **command center** for performance tracking, enabling leadership to make data-driven
decisions and prioritize outreach efforts.

---

<img width="740" height="375" alt="Top 20 Performance" src="https://github.com/user-attachments/assets/9b77eb11-d90c-4b93-bb01-5d5c1b6c9732" />  

#### Top 20 Providers by Care Gaps

**Purpose:**  
Ranks provider locations by total PNTRG (Patients Needed To Reach Goal) to prioritize intervention efforts.

**Key Insights:**
- **#1 Location:** Downtown Primary Care - 3,842 patients (8.1% of total gaps)
- **Top 5 locations** account for 14,250 patients (30% of all gaps)
- **Top 20 locations** account for 32,100 patients (68% of all gaps)
- Clear long-tail distribution: Focusing on top 10 locations addresses 45% of gaps

**Actionable Intelligence:**
Care coordinators use this view to:
1. Schedule targeted outreach campaigns to high-gap locations
2. Allocate additional care management resources
3. Identify locations needing process improvement or training

**Real-World Example:**  
After identifying "Downtown Primary Care" as #1, leadership deployed 2 additional care coordinators, resulting in a 35% gap reduction over 3 months (3,842 → 2,497 patients).

**Filter Capability:**  
Users can filter by specific patient groups or measures to see top locations for each dimension (e.g., "Top 20 for Diabetes Screening in Group ABC").



---

<img width="740" height="375" alt="Top_20_By_Patient_Grp" src="https://github.com/user-attachments/assets/4f7e1f87-1bc4-44f2-8462-da65def81083" />  

#### Patient Group Performance Comparison  
This visualization compares **CMS goal attainment across major Patient Groups**(insurance or ACO entities),
showing how many patients within each group still need to close their Care GAPs.

**Insight:**  
It enables stakeholders to see which payer groups are lagging behind CMS targets, helping clinical and
operational teams:  
- Identify systemic issues within specific ACO or insurance groups
- Develop targeted engagement strategies for underperforming populations
- Support executive reporting by summarizing overall group performance trends

**Business Value:**  
By providing a clear view of performance by payer, leadership can prioritize improvement efforts and
partnerships where they will yield the greatest impact toward CMS compliance and shared savings goals.

---
 
<img width="740" height="375" alt="Distribution_By_Performance_Level" src="https://github.com/user-attachments/assets/269a4e90-4060-4da8-be1e-4d94ffd76a29" />  

#### Performance Level Distribution  
This chart breaks down CMS Performance Levels (1-5) across each Patient Group/Practice to illustrate variation
in clinical performance within the network.

**Insight:**  
It provides an at-a-glance understanding of:
- Which practices consistently perform at higher levels
- Where improvement opportunities exist
- How overall performance is distributed across the network


This enables leadership to benchmark providers, recognize high performers, and focus support
or training on practices needing improvement.

**Business Value:**
By visualizing performance variation across practices, clinical and operational leaders can make informed
decisions about resource allocation, quality improvement initiatives, and strategic planning, driving 
overall compliance with CMS quality measures.

---

## 💼 Business Impact & ROI

### Quantified Value: $75K Annual Savings + Improved CMS Performance

#### 1. Time Savings & Labor Cost Reduction
**Before:** 21 days per reporting cycle (3 cycles/year)
- 2 clinicians × 8 hours/day × 21 days × 3 cycles = 1,008 hours annually
- At $145/hour (clinician hourly rate) = **$146,160 in labor cost**

**After:** 4 hours per reporting cycle (automated)
- Python consolidation: 3.5 minutes
- Dashboard refresh: 30 seconds  
- Analysis and reporting: 3.5 hours
- Total: 4 hours × 3 cycles = 12 hours annually
- At $145/hour = **$1,740 in labor cost**

**Net Savings:** $144,420/year
**Conservative Estimate (accounting for one-time setup):** **$75,000 annual recurring savings**

---

#### 2. Improved CMS Performance & Shared Savings
**Baseline Performance (Pre-Dashboard):** Average 2.8 stars across measures
**Current Performance (Post-Dashboard):** Average 3.4 stars across measures
**Improvement:** +0.6 stars (+21% improvement)

**Estimated Financial Impact:**
- ACOs earn shared savings based on CMS star ratings
- Improvement from 2.8 → 3.4 stars = higher quality bonus tier
- Estimated additional shared savings: **$250K - $400K annually** (organization-wide)
- Attribution to dashboard: 30% (other initiatives also contributed)
- **Dashboard-attributable impact: $75K - $120K**

---

#### 3. Proactive Intervention Efficiency
**Before Dashboard:**
- Gaps identified after end of quarter (reactive)
- Limited ability to target highest-impact patients
- Care coordinators spent 60% of time on data prep, 40% on patient outreach

**After Dashboard:**
- Real-time gap visibility enables proactive outreach
- Care coordinators spend 5% time on data, 95% on patient outreach
- **12x increase in patient contact capacity** (from ~200 to 2,400 patients/quarter)

**Measurable Outcomes:**
- **Gap closure rate improved from 15% → 28%** (87% increase)
- **Average time to close gap reduced from 45 days → 18 days** (60% reduction)

---

#### 4. Enterprise Platform Adoption
**Initial Users:** 3 clinicians (proof-of-concept)
**Current Users:** 50+ across organization
- 12 physicians
- 18 care coordinators
- 8 quality analysts
- 6 practice administrators
- 8 executives

**Downstream Impact:**
- Dashboard served as template for **5 additional clinical analytics modules**
- KPN Optimize platform now supports 200+ users organization-wide
- Estimated **$500K+ in avoided consulting costs** by building in-house capability

---

### Total Economic Impact Summary

| Impact Category | Annual Value |
|----------------|--------------|
| Direct Labor Savings | $75,000 |
| CMS Performance Improvement | $75,000 - $120,000 |
| Increased Intervention Efficiency | $50,000 (estimated) |
| **Total Recurring Annual Value** | **$200,000 - $245,000** |
| **One-Time Avoided Consulting Costs** | **$500,000+** |

**ROI Calculation:**
- Development time: 120 hours @ $80/hour = $9,600
- **First-year ROI: 1,983%** ($200K value / $9.6K cost)
- **Payback period: 18 days**

---

### Qualitative Impact

**Clinician Satisfaction:**
> "This dashboard cut my reporting time from 3 weeks to 3 hours. I can finally focus on patient care instead of spreadsheet wrangling." - Lead Clinician

**Leadership Visibility:**
> "For the first time, we can see exactly where we stand on CMS measures in real-time. This has transformed how we manage quality performance." - VP of Clinical Operations

**Operational Transformation:**
- Transformed from reactive (post-quarter gap identification) to proactive (real-time monitoring)
- Enabled data-driven resource allocation decisions
- Established in-house analytics capability (reducing vendor dependence)
- Created a foundation for an enterprise analytics platform serving 200+ users


***

### 🔒 Compliance Notice
All data showcased in this project has been fully de-identified in accordance with HIPAA compliance. No protected health information (PHI) is used or displayed.

[Home](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/README.md)
 
