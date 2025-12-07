# K-Pop Age & Success Analysis

## 📖 Overview
This project explores the relationship between **K-pop groups’ debut age/date** and their **achievements**, including:
- Awards (yearly & music show wins)
- Music video views
- Physical album sales
- Streaming scores

The goal is to uncover generational trends and correlations between debut timing and long-term success.

---

## 🛠 Tech Stack
- **dbt (Data Build Tool):** For data modeling, transformations, and testing.
- **Snowflake:** Cloud data warehouse storing cleaned and aggregated datasets.
- **Looker Studio:** Visualization layer for charts (scatter, line, heatmap, radar).

---

## 📂 Project Structure
- `analyses/` → Exploratory SQL queries and reports
- `macros/` → Custom dbt macros
- `models/` → Core dbt models (staging, intermediate, marts)
- `seeds/` → Static reference data (e.g., group metadata)
- `snapshots/` → Historical snapshots for tracking changes
- `tests/` → Data quality checks
- `requirements.txt` → Python dependencies
- `dbt_project.yml` → dbt project configuration

---

## 📊 Key Findings
The data collected included members of Kpop groups average ages during debut from teenage years to early twenties. Majority of the average debut age is around 17-20.

Most of the successfull groups are in so called 3rd generation of Kpop.
These groups' average debut age are also around 17-20. 

From this, the success and the members' average age during debut cannot be correlated, since groups from other generations also had the same average debut date but were not as successful.

![Alt text][def]

[def]: https://lookerstudio.google.com/embed/reporting/1ab5a344-2cd8-49c8-b76f-74893bed829b/page/p_mkuxipbtyd, "Kpop Groups' Average Debut Age"

---

## ℹ Sources
K-Pop Database dbkpop.com
Soribada soridata.com 