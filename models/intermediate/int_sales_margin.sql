WITH table_1 AS(
select
date_date,
orders_id,
products_id,
revenue,
quantity,
purchase_price,
FROM {{ref('stg_raw__sales')}}
INNER JOIN {{ref('stg_raw__product')}}
USING (products_id))

, table_2 AS(
select
*,
quantity * purchase_price AS purchase_cost,
from table_1)

select
*,
ROUND(revenue - purchase_cost,2) AS margin,
{{ margin_percent('revenue', 'purchase_cost') }} AS margin_percent
FROM table_2



