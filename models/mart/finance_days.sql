{{ config(materialized='table') }}

select
date_date,
COUNT(orders_id) AS nb_transactions,
ROUND(SUM(revenue),1) AS revenue,
ROUND(SUM(revenue) / COUNT(orders_id),2) AS average_basket,
ROUND(SUM(margin),1) AS margin,
ROUND(SUM(operational_margin),1) AS operational_margin,
ROUND(SUM(purchase_cost),1) AS total_purchase_cost,
ROUND(SUM(shipping_fee),1) AS total_shipping_fees,
ROUND(SUM(logcost),1) AS total_log_costs,
ROUND(SUM(quantity),1) AS total_products_sold
FROM {{ref('int_orders_operational')}}
GROUP BY date_date
ORDER BY date_date