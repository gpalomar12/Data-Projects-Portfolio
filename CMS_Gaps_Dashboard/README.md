# CMS Gaps in Care Dashboard
## Automating Clinical Performance Reporting for ACOs  

***

### Project Overview
The CMS Gaps in Care Analytics Dashboard was developed to streamline the midyear reporting process for clinicians participating in an Accountable Care Organization (ACO).

Previously, clinicians manually consolidated hundreds of Excel files provided by database engineers — a process that often took several weeks. This dashboard automates data aggregation and visualization, reducing reporting time to hours while providing interactive insights into CMS performance metrics.

***

### Background
A clinician collaborator was responsible for identifying performance gaps and underperforming measures to help 
providers meet their CMS goals. Data was delivered as fragmented Excel files, requiring manual copy-and-paste
consolidation and extensive filtering.

I analyzed the workflow, identified key metrics, and built a fully interactive Excel dashboard that delivered
the same insights in real time.  The dashboard was later integrated into our production analytics platform,
Optimize, leveraging warhoused data to provide enterprise-level visibility.


| Challenges | Descriptions |
| :--- | :--- |
| Manual Consolidation | Hundreds of XLS files were merged manually every reporting cycle |
| Time Intensive | The Process took several weeks to complete |
| Static Insights | Clinicians relied on filters and pivot tables with limited interactivity |
| Delayed Action | Leadership lacked timely insights into Measure Performance |

***

### Tech Stack 
- Python (Data Consolidation and de-identifying data)
- Microsoft Excel
  - Pivot Tables
  - Vlookup/Index-Match
  - Conditional Formatting
  - Interactive Filters & Slicers
  - Charts & Dashboards
  - Power Query

***

### Role & Contribution
- Led development of a dashboard that consolidated hundreds of Excel reports into an interactive
  analytics tool for clinicians to monitor **"CMS Gaps in Care"** metrics.
- Automated manual data aggregation and visualization, reducing reporting time from weeks to hours.
- Collaborated with clinicians to refine KPIs through iterative feedback over three weeks.
- Supported the migration of the dashboard into the **"KPN Optimize Platform"**, connecting to our
  warehoused data for real-time insights.

***

### Key Features
- Automated data consolidation from hundreds of Excel files
- Interactive dashboard for clinicians and administrators
- Filter by provider, measure, or location
- Highlighted top underperforming measures and providers
- CMS goal tracking for proactive performance management

***

### Dashboard Visuals

> *Note: All data in these visuals has been de-identified to maintain HIPAA compliance*


<img width="740" height="375" alt="dashboard_overview" src="https://github.com/user-attachments/assets/97a7454b-80cf-46d7-9910-0bf8be7169c4" />  

#### Purpose:
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


<img width="740" height="375" alt="Top 20 Peformance" src="https://github.com/user-attachments/assets/9b77eb11-d90c-4b93-bb01-5d5c1b6c9732" />  

#### Purpose:
This visualization ranks the Top 20 provider locations (clinician offices) by the number of patients still
needing to close their CMS Care Gaps.  

**Insight:**  

It helps care coordinators and clinical leadership quickly identify which providers have the largest remaining patient gaps across all CMS measures.
By focusing on these top-performing opportunities, the team can:

- Target outreach to underperforming locations
- Allocate resources efficiently to high-impact offices
- Monitor improvement trends as interventions are implemented

**Business Value:**
This chart transformed a reactive, spreadsheet-heavy process into a data-driven prioritization tool, allowing leadership to act proactively on the locations most affecting CMS performance outcomes.

#### Purpose:
This visualization compares **CMS goal attainment across major Patient Groups**(insurance or ACO entities),
showing how many patients within each group still need to close their Care GAPs.


<img width="740" height="375" alt="Top_20_By_Patient_Grp" src="https://github.com/user-attachments/assets/4f7e1f87-1bc4-44f2-8462-da65def81083" />  

**Insight:**  
It enables stakeholders to see which payer groups are lagging behind CMS targets, helping clinical and
operational teams:  
- Identify systemic issues within specific ACO or insurance groups
- Develop targeted engagement strategies for underperforming populations
- Support executive reporting by summarizing overall group performance trends

**Business Value:**  
By providing a clear view of performance by payer, leadership can prioritize improvement efforts and
partnerships where they will yield the greatest impact toward CMS compliance and shared savings goals.


#### Purpose:  
This chart breaks down CMS Performance Levels (1-5) across each practice to illustrate variation
in clinical performance within the network.

 
<img width="740" height="375" alt="Distribution_By_Performance_Level" src="https://github.com/user-attachments/assets/269a4e90-4060-4da8-be1e-4d94ffd76a29" />  

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

***

### Impact

- Reduced clinician data preparation time from 3+ weeks to less than a day.
- Enabled data-driven decision-making on provider performance.
- Provided executive-level visibility into ACO CMS measures.
- Successfully deployed into production within 5 months, serving as a model for future clinical analytics
  modules.
- **From an individual clinician's request to an enterprise-grade reporting tool.**

***

### Key Takeaways
This project demonstrates how simple automation and dashboarding efforts can transform a time-consuming 
manual process into a scalable analytics solution that directly supports clinical and operational decision-making.

***

### Data Privacy Notice
All data showcased in this project has been fully de-identified in accordance with HIPAA compliance. No protected health information (PHI) is used or displayed.


 
