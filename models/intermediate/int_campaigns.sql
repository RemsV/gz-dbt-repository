select
*
FROM {{ref('stg_raw__adwords')}}
UNION ALL
select
*
FROM {{ref('stg_raw__bing')}}
UNION ALL
select
*
FROM {{ref('stg_raw__criteo')}}
UNION ALL
select
*
FROM {{ref('stg_raw__facebook')}}