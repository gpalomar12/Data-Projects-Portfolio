# Verification Ledger

Every number in this portfolio falls into one of four tiers. Run the checks yourself:

```bash
pip install pandas openpyxl
python verification/verify_claims.py      # exits 0 if everything passes
```

The script recomputes figures from the data in this repo, scans every README for claims that were removed, checks relative links, and confirms the resume PDF matches.

## Tier 1: Reproduced from data in this repo
| Project | Claims (all re-computed by the script) |
|---|---|
| CMS Gaps in Care | 10,347 records; 85 practices; 271 provider locations; 34 measures; 12 patient groups; 64,631 patients needing gap closure; 5,979 records with gaps (57.8%); 4,368 with none (42.2%); average rate 61.3% (65.1% patient-weighted); top location 8.3% of gaps, top 5 22.4%, top 10 35.9%, top 20 54.2%; per-measure record counts and average rates |
| SQL B2B | 4,050 orders; 351 accounts; 8,273 web events; $10.43M revenue; Standard 72.9% / Gloss 11.9% / Poster 15.2%; top 10 accounts $1.59M (15.3%); Northeast vs Midwest +164%; Dec 2013 $177K to Dec 2016 $916K (+417%); Dec 2016 +72% vs Nov 2016, 3.4x Dec 2015; largest MoM +103.9% / -30.7%; direct traffic 62.2% of events; mean 0.5-day lag from first web event to first order |
| Digital Wellness | R² 0.856 (about 86% of variance); 5,000 participants; stress standardized beta -8.724; stress is 2.5x physical activity and 7x sleep quality (standardized) |
| Hospital | 365 high-risk patients (37.1% of 985); 967 clean records; scenario arithmetic (each dollar figure below) |

## Tier 2: Author-reported (cannot be reproduced from de-identified data)
These come from the original KPN Health work. They are labeled *author-reported* in the README.

| Claim | Source of truth |
|---|---|
| CMS analysis time cut from 4-5 weeks to 2-3 days (~90%) | Clinician workload before and after the Python/Excel tool (calendar time) |
| Reviews moved from twice a year to monthly, ~30-day data lag | Reporting schedule before and after the commercial module |
| 450+ source files (445 read successfully, 98.9%) | Raw files are not in the repo (PHI); the arithmetic 445/450 is verified |
| 50+ users; 5-month deployment | Internal rollout records |

## Tier 3: Scenario assumptions (synthetic data, not realized results)
| Hospital scenario | Inputs | Value |
|---|---|---|
| Readmission reduction | 75 prevented × $7,500 + $125K penalties | $687,500 |
| Length of stay | ~130 bed-days × $4,000 | $520,000 |
| **Headline total** | | **$1,207,500 (~$1.2M)** |
| Cost management (excluded from headline) | 8-12% of $4.2M | $336K-$504K |
| Staffing (excluded from headline) | illustrative | $150K |

The "62% of costs from 3 conditions ($4.2M of $6.8M)" figure comes from the notebook output, but the raw dataset is not committed, so it is **not independently reproducible**. Commit the synthetic CSV to close this gap.

## Tier 4: Removed or corrected
| Was | Now | Why |
|---|---|---|
| CMS: 200 → 8 hours (96%); 21 days → 4 hours (98%); 3-4 weeks → hours (90%+) | 4-5 weeks → 2-3 days (~90%) | Three conflicting figures; replaced with the confirmed one |
| CMS: "3 cycles per year" | Twice a year | Contradicted the actual schedule |
| CMS: $75K savings, 1,983% ROI, 18-day payback, $500K avoided consulting, 200+ users | Removed | Modeled inputs; the 520-hour figure was back-solved and the math did not reconcile |
| CMS: stars 2.8 → 3.4, gap closure 15% → 28%, 45 → 18 days to close, 12x contact capacity | Removed | No measured source in the repo |
| CMS: two quoted testimonials (clinician, VP) | Removed | Unattributed quotes; restore only with written permission |
| CMS: "Downtown Primary Care" #1 location, 3,842 patients, top 5 = 30%, top 20 = 68%, 35% gap reduction story | #1 location 5,361 (8.3%); top 5 22.4%; top 20 54.2% | Did not match the data; location name is not in the de-identified file |
| CMS: average rate 61.0% | 61.3% | Recomputed |
| CMS: four per-measure average rates (COL, BCS, eye exam, HbA1c) | 51.6 / 50.0 / 31.9 / 54.0 | Recomputed |
| CMS: "real-time" visibility; "daily refresh" | Monthly, ~30-day lag | Matches how the module actually worked |
| CMS: 100% HIPAA compliance | Automated de-identification | A script cannot certify compliance |
| SQL: direct traffic 55.5% | 62.2% | Used a wrong denominator (9,273 instead of 8,273) |
| SQL: Standard 73.2% / 26.8% | 72.9% / 27.1% | Recomputed from orders |
| SQL: Dec 2016 "72% above previous December ($532K)" | 72% above November 2016; 3.4x Dec 2015 ($267K) | $532K is November 2016 |
| SQL: MoM range -30.67% to +25.31% | -30.7% to +103.9% | +25.31% was March 2016; the max is March 2015 |
| SQL: 416% growth | 417% | Rounding (416.8%) |
| SQL: 10,428+ orders; "predictable conversion window" | 4,050 orders; lag is under a day (exploratory) | 10,428 was revenue; both tables start on the same date |
| SQL: "5-10% mix shift worth $380K-$760K" | 5-10% of Standard revenue (sizing benchmark) | It is not a forecast of incremental revenue |
| Wellness: "3x more impactful"; "6x vs sleep" | 2.5x; 7x | Recomputed from standardized coefficients |
| Wellness: stress standardized -8.824 in JSON/KPI file | -8.724 | Notebook output is -8.724 |
| Hospital: LOS "15 beds × 85% × 365 × $4,000 = $520K" | ~130 bed-days × $4,000 | The old formula equals about $18.6M |
| Hospital: "$1.2M total" of four initiatives | $1.2M = readmission + LOS; four-initiative total ~$1.76M | The four listed items sum to $1,757,500 |
| Hospital: readmission rate 37% → 28% | -30% within the 250-patient cohort | 37% is the high-risk share; the overall readmission rate is 18% |
| Hospital: "dashboard deployed to 5 administrators", "12% overtime reduction", "reduces crisis management by 40%", "production-ready models deployed", "real-time risk scoring" | Removed or marked proposed | Synthetic demo; nothing was deployed |
| Hospital: "5 interactive dashboards" | 5-page Power BI report | Accurate description of the .pbix |
| Portfolio: "Power BI dashboard" for CMS | Excel/Power Query dashboard | Matches the repo tech stack |
| Resume PDF in repo (old numbers, "70 ACO analysts") | Current resume | Titles and metrics now match LinkedIn |
