WITH table_1 AS(
select
int_orders_margin.orders_id AS orders_id,
int_orders_margin.date_date AS date_date,
int_orders_margin.revenue AS revenue,
int_orders_margin.quantity AS quantity,
int_orders_margin.purchase_cost AS purchase_cost,
int_orders_margin.margin AS margin,
shipping_fee,
logcost,
ship_cost
FROM {{ref('int_orders_margin')}}
INNER JOIN {{ref('stg_raw__ship')}}
USING (orders_id))

select
orders_id,
date_date,
ROUND((margin + shipping_fee - logcost - ship_cost),2) AS operational_margin,
revenue,
quantity,
purchase_cost,
margin
FROM table_1