select
finance_days.date_date,
ROUND(SUM(finance_days.operational_margin - int_campaigns_day.ads_cost),2) AS ads_margin,
ROUND(SUM(finance_days.average_basket),2) AS average_basket,
ROUND(SUM(finance_days.operational_margin),2) AS operational_margin,
ROUND(SUM(int_campaigns_day.ads_cost),2) AS ads_cost,
ROUND(SUM(int_campaigns_day.ads_impression),2) AS ads_impression,
ROUND(SUM(int_campaigns_day.ads_clicks),2) AS ads_clicks,
ROUND(SUM(finance_days.total_products_sold),2) AS quantity,
ROUND(SUM(finance_days.revenue),2) AS revenue,
ROUND(SUM(finance_days.total_purchase_cost),2) AS purchase_cost,
ROUND(SUM(finance_days.margin),2) AS margin,
ROUND(SUM(finance_days.total_shipping_fees),2) AS shipping_fee,
ROUND(SUM(finance_days.total_log_costs),2) AS logcost,
ROUND(SUM(finance_days.total_ship_cost),2) AS ship_cost
FROM {{ref('finance_days')}}
LEFT JOIN {{ref('int_campaigns_day')}}
ON finance_days.date_date = int_campaigns_day.date_date
GROUP BY finance_days.date_date
ORDER BY finance_days.date_date DESC
