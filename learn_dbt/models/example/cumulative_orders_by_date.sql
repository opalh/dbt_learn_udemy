{{ config(materialized='table') }}
select
    o_orderdate
    ,o_totalprice
    ,sum(o_totalprice) over (partition by o_orderdate order by o_totalprice) as cumulative_total
from {{ source('sample', 'orders')}}
order by o_orderdate, o_totalprice
