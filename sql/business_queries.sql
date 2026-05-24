# QUERY 1 — TOP PERFORMING CAMPAIGNS

top_campaigns_sql = pd.read_sql_query("""

SELECT
    campaign_name,
    SUM(amount_spent_usd) AS total_spend,
    SUM(results) AS total_results,
    ROUND(AVG(cost_per_result), 2) AS avg_cost_per_result
FROM campaigns
GROUP BY campaign_name
ORDER BY total_results DESC;

""", conn)

print("Top Performing Campaigns")
print(top_campaigns_sql.head(10))

top_campaigns_sql.to_csv(
    "data/top_campaigns_sql.csv",
    index=False
)


# QUERY 2 — PIPELINE DISTRIBUTION

pipeline_distribution_sql = pd.read_sql_query("""

SELECT
    stage,
    COUNT(*) AS total_opportunities
FROM opportunities
GROUP BY stage
ORDER BY total_opportunities DESC;

""", conn)

print("\nPipeline Distribution")
print(pipeline_distribution_sql)

pipeline_distribution_sql.to_csv(
    "data/pipeline_distribution_sql.csv",
    index=False
)

# QUERY 3 — REVENUE BY STAGE

revenue_by_stage_sql = pd.read_sql_query("""

SELECT
    stage,
    SUM(lead_value) AS total_lead_value
FROM opportunities
GROUP BY stage
ORDER BY total_lead_value DESC;

""", conn)

print("\nRevenue by Pipeline Stage")
print(revenue_by_stage_sql)

revenue_by_stage_sql.to_csv(
    "data/revenue_by_stage_sql.csv",
    index=False
)


# QUERY 4 — LEAD SOURCES

lead_sources_sql = pd.read_sql_query("""

SELECT
    source,
    COUNT(*) AS total_leads
FROM opportunities
GROUP BY source
ORDER BY total_leads DESC;

""", conn)

print("\nLead Sources")
print(lead_sources_sql)

lead_sources_sql.to_csv(
    "data/lead_sources_sql.csv",
    index=False
)