#!/usr/bin/env python3
"""
Re-computes every quantitative claim that can be reproduced from this repo's data,
then scans the READMEs for stale claims and broken links.

Run from the repo root:   python verification/verify_claims.py
Exit code 0 = all checks passed, 1 = at least one failed.
Requires: pandas, openpyxl
"""
import io, json, re, subprocess, sys, zipfile
from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parent.parent
RESULTS, FAILS = [], []

def check(area, claim, actual, expected, tol=0.0):
    ok = abs(actual - expected) <= tol if isinstance(expected, (int, float)) else actual == expected
    RESULTS.append((area, claim, actual, expected, ok))
    if not ok: FAILS.append((area, claim, actual, expected))

def read(p): return (ROOT / p).read_text(encoding="utf-8", errors="ignore")

# ------------------------------------------------------------------ CMS
cms = pd.read_excel(ROOT / "CMS_Gaps_Dashboard/Data/Consolidated/deidentified_output.xlsx")
ptrg = cms["Patients To Reach Program Goal"]
check("CMS", "records", len(cms), 10347)
check("CMS", "practices", cms["Practice"].nunique(), 85)
check("CMS", "provider locations", cms["Location"].nunique(), 271)
check("CMS", "CMS measures", cms["Measure Name"].nunique(), 34)
check("CMS", "patient groups", cms["Patient Group"].nunique(), 12)
check("CMS", "total patients needing gap closure (PNTRG)", int(ptrg.sum()), 64631)
check("CMS", "records with a gap (PNTRG > 0)", int((ptrg > 0).sum()), 5979)
check("CMS", "records with no remaining gap (PNTRG <= 0)", int((ptrg <= 0).sum()), 4368)
check("CMS", "avg record-level rate % (simple mean)", round(cms["Rate"].mean() * 100, 1), 61.3, 0.05)
check("CMS", "patient-weighted rate %", round(cms["Met"].sum() / cms["Denominator"].sum() * 100, 1), 65.1, 0.05)
check("CMS", "missing Program Level %", round(cms["Program Level"].isna().mean() * 100, 1), 12.0, 0.05)
loc = cms.groupby("Location")["Patients To Reach Program Goal"].sum().sort_values(ascending=False)
for n, exp_pts, exp_pct in [(1, 5361, 8.3), (5, 14461, 22.4), (20, 35058, 54.2)]:
    check("CMS", f"top {n} location(s): patients", int(loc.head(n).sum()), exp_pts)
    check("CMS", f"top {n} location(s): % of gaps", round(loc.head(n).sum() / loc.sum() * 100, 1), exp_pct, 0.05)
check("CMS", "top 10 locations: % of gaps", round(loc.head(10).sum() / loc.sum() * 100, 1), 35.9, 0.05)
by_measure = cms.groupby("Measure Name").agg(n=("Rate", "size"), avg=("Rate", "mean")).sort_values("n", ascending=False)
check("CMS", "top measure record count (Colorectal)", int(by_measure["n"].iloc[0]), 931)
for name, exp in [("★Colorectal Cancer Screening (COL)", 51.6), ("★Breast Cancer Screening (BCS)", 50.0),
                  ("★Diabetes: Eye exam (retinal) performed", 31.9), ("★Diabetes: HbA1c control <8.0%", 54.0)]:
    check("CMS", f"avg rate: {name}", round(by_measure.loc[name, "avg"] * 100, 1), exp, 0.05)
check("CMS", "top practice by record count", int(cms["Practice"].value_counts().iloc[0]), 1761)
check("CMS", "arithmetic: 445 of 450 files = 98.9%", round(445 / 450 * 100, 1), 98.9, 0.05)

# ------------------------------------------------------------------ B2B SQL
B = ROOT / "sql-b2b_marketing_perf_analysis"
with zipfile.ZipFile(B / "data/archive/archive.zip") as z:
    rd = lambda n: pd.read_csv(io.BytesIO(z.read(n)))
    orders = rd("orders.csv"); accts = rd("accounts.csv"); web = rd("web_events.csv")
    reps = rd("sales_reps.csv"); reg = rd("region.csv")
orders["occurred_at"] = pd.to_datetime(orders["occurred_at"]); web["occurred_at"] = pd.to_datetime(web["occurred_at"])
tot = orders["total_amt_usd"].sum()
check("B2B", "orders", len(orders), 4050); check("B2B", "accounts", len(accts), 351); check("B2B", "web events", len(web), 8273)
check("B2B", "total revenue $M", round(tot / 1e6, 2), 10.43, 0.005)
for col, exp in [("standard", 72.9), ("gloss", 11.9), ("poster", 15.2)]:
    check("B2B", f"{col} % of revenue", round(orders[col + "_amt_usd"].sum() / tot * 100, 1), exp, 0.05)
check("B2B", "standard revenue $M", round(orders["standard_amt_usd"].sum() / 1e6, 2), 7.60, 0.005)
check("B2B", "5% of Standard revenue ($K)", round(orders["standard_amt_usd"].sum() * 0.05 / 1e3), 380, 1)
check("B2B", "10% of Standard revenue ($K)", round(orders["standard_amt_usd"].sum() * 0.10 / 1e3), 760, 1)
acct_rev = orders.groupby("account_id")["total_amt_usd"].sum().sort_values(ascending=False)
check("B2B", "top 10 accounts revenue $M", round(acct_rev.head(10).sum() / 1e6, 2), 1.59, 0.005)
check("B2B", "top 10 accounts % of revenue", round(acct_rev.head(10).sum() / tot * 100, 1), 15.3, 0.05)
check("B2B", "accounts above $150K lifetime", int((acct_rev > 150000).sum()), 4)
m = orders.merge(accts[["id", "sales_rep_id"]], left_on="account_id", right_on="id") \
          .merge(reps[["id", "region_id"]], left_on="sales_rep_id", right_on="id", suffixes=("", "_s")) \
          .merge(reg, left_on="region_id", right_on="id", suffixes=("", "_r"))
rr = m.groupby("name")["total_amt_usd"].sum()
check("B2B", "Northeast vs Midwest gap %", round((rr["Northeast"] / rr["Midwest"] - 1) * 100, 1), 164.0, 0.05)
mo = orders.groupby(orders["occurred_at"].dt.to_period("M"))["total_amt_usd"].sum()
check("B2B", "Dec 2013 revenue $K", round(mo["2013-12"] / 1e3), 177, 0.5)
check("B2B", "Dec 2016 revenue $K", round(mo["2016-12"] / 1e3), 916, 0.5)
check("B2B", "Dec 2013 -> Dec 2016 growth %", round((mo["2016-12"] / mo["2013-12"] - 1) * 100), 417, 0.5)
check("B2B", "Dec 2016 vs Nov 2016 %", round((mo["2016-12"] / mo["2016-11"] - 1) * 100), 72, 0.5)
check("B2B", "Dec 2016 / Dec 2015 (x)", round(mo["2016-12"] / mo["2015-12"], 1), 3.4, 0.05)
mom = (mo.pct_change() * 100).iloc[1:]
check("B2B", "largest MoM increase %", round(mom.max(), 1), 103.9, 0.05)
check("B2B", "largest MoM decline % (excl. partial Jan 2017)", round(mom.iloc[:-1].min(), 1), -30.7, 0.05)
check("B2B", "rolling 3-month peak $M", round(mo.rolling(3).sum().max() / 1e6, 2), 2.06, 0.005)
ch = web["channel"].value_counts()
check("B2B", "direct web events", int(ch["direct"]), 5149)
check("B2B", "direct % of web events", round(ch["direct"] / len(web) * 100, 1), 62.2, 0.05)
check("B2B", "direct > all other channels combined", bool(ch["direct"] > ch.drop("direct").sum()), True)
first_o = orders.groupby("account_id")["occurred_at"].min()
first_w = web.groupby("account_id")["occurred_at"].min()
lag = (first_o - first_w).dropna().dt.total_seconds() / 86400
check("B2B", "mean days first web event -> first order", round(lag.mean(), 1), 0.5, 0.05)
check("B2B", "median first-order lag is under 1 hour", bool(lag.median() < 1 / 24), True)

# ------------------------------------------------------------------ Hospital (scenario arithmetic + published model outputs)
hp = json.loads(read("hospital_operations_analysis/results/model_performance.json"))
rs = hp["readmission_prediction_model"]["risk_segmentation"]
check("Hospital", "high-risk patients", rs["high_risk_count"], 365)
check("Hospital", "high-risk % of patients", round(rs["high_risk_count"] / rs["total_patients"] * 100, 1), 37.1, 0.05)
check("Hospital", "clean records after removing 18", 985 - 18, 967)
check("Hospital", "readmission savings: 75 x $7,500", 75 * 7500, 562500)
check("Hospital", "readmission total incl. $125K penalties", 75 * 7500 + 125000, 687500)
check("Hospital", "LOS value: 130 bed-days x $4,000", 130 * 4000, 520000)
check("Hospital", "headline total (readmission + LOS)", 687500 + 520000, 1207500)
check("Hospital", "four-initiative total", 687500 + 520000 + 400000 + 150000, 1757500)
check("Hospital", "cost mgmt low: 8% of $4.2M", round(4.2e6 * 0.08), 336000)
check("Hospital", "cost mgmt high: 12% of $4.2M", round(4.2e6 * 0.12), 504000)
check("Hospital", "OLD LOS formula (15 beds x 85% x 365 x $4,000) is NOT $520K", round(15 * 0.85 * 365 * 4000) != 520000, True)

# ------------------------------------------------------------------ Wellness
wp = json.loads(read("digital_wellness_behavioral_analysis/results/regression_results.json"))
check("Wellness", "R-squared", wp["model_performance"]["r_squared"], 0.856, 0.0005)
check("Wellness", "participants", wp["dataset_info"]["total_participants"], 5000)
std = {k: v["standardized_coefficient"] for k, v in wp["regression_coefficients"].items() if isinstance(v, dict) and "standardized_coefficient" in v}
check("Wellness", "stress standardized beta", std["stress_level"], -8.724, 0.0005)
check("Wellness", "stress / physical activity (x)", round(abs(std["stress_level"]) / std["physical_activity"], 1), 2.5, 0.05)
check("Wellness", "stress / sleep quality (x)", round(abs(std["stress_level"]) / std["sleep_quality"]), 7, 0.5)
check("Wellness", "notebook output contains -8.724 for stress", "-8.724" in read("digital_wellness_behavioral_analysis/scripts/wellness_data_analysis.ipynb"), True)

# ------------------------------------------------------------------ Stale-claim scan
STALE = ["200 → 8", "200 to 8 hours", "98% time reduction", "3+ weeks to 4 hours", "21 days", "3 cycles", "1,983%", "18 days",
         "$75K", "$75,000", "520 hours", "$500K", "Downtown Primary Care", "55.5%", "73.2%", "26.8%", "416%", "+25.31%",
         "9,273", "10,428+", "reactive crisis management by 40%", "production-ready ML models deployed", "deployed to 5 hospital",
         "cut my reporting time from 3 weeks", "VP of Clinical Operations", "5 interactive dashboards", "5 interactive Power BI", "link_to_kaggle", "[Immediate]", "real-time", "real time", "KPN Optimize",
         "6x larger than sleep", "3x more impactful", "70 ACO analysts", "15 beds × 85%"]
docs = [p for p in ROOT.rglob("*.md") if p.name != "VERIFICATION.md" and ".git" not in p.parts]
for phrase in STALE:
    hits = [str(p.relative_to(ROOT)) for p in docs if phrase.lower() in p.read_text(encoding="utf-8", errors="ignore").lower()]
    check("Stale claims", f'"{phrase}" absent from all READMEs', len(hits), 0)
    if hits: FAILS[-1] = FAILS[-1][:3] + (f"0 (found in {', '.join(hits)})",)

# ------------------------------------------------------------------ Link check (relative links in project READMEs)
broken = []
for p in docs:
    for target in re.findall(r"\]\((\.{1,2}/[^)#\s]+)", p.read_text(encoding="utf-8", errors="ignore")):
        if not (p.parent / target).resolve().exists(): broken.append(f"{p.relative_to(ROOT)} -> {target}")
check("Links", "broken relative links", len(broken), 0)
if broken: FAILS[-1] = FAILS[-1][:3] + ("0 (broken: " + "; ".join(broken[:5]) + ")",)

# ------------------------------------------------------------------ Resume PDF in repo matches current story
pdf = next((ROOT / "resume").glob("*.pdf"), None)
if pdf:
    try:
        txt = subprocess.run(["pdftotext", str(pdf), "-"], capture_output=True, text=True, check=True).stdout
        check("Resume PDF", "contains '4-5 weeks to 2-3 days'", "4-5 weeks to 2-3 days" in txt, True)
        check("Resume PDF", "no stale '200 to 8 hours'", "200 to 8" not in txt, True)
        check("Resume PDF", "no unverified '70 ACO analysts'", "70 ACO" not in txt, True)
    except Exception as e:
        print(f"(resume PDF check skipped: {e})")

# ------------------------------------------------------------------ Report
w = max(len(r[1]) for r in RESULTS) + 2
for area, claim, actual, expected, ok in RESULTS:
    print(f"{'PASS' if ok else 'FAIL'}  {area:<12}{claim:<{w}}actual={actual}  expected={expected}")
print(f"\n{len(RESULTS) - len(FAILS)}/{len(RESULTS)} checks passed")
if FAILS:
    print("\nFAILED:"); [print(" -", f) for f in FAILS]
sys.exit(1 if FAILS else 0)
