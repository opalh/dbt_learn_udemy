{{ config(materialized='table') }}
select
    o_orderdate
    ,o_totalprice
    ,sum(o_totalprice) over (partition by o_orderdate order by o_totalprice) as cumulative_total
from {{ source('sample', 'orders')}}

{% if target.name == 'dev' %}
where year(o_orderdate) = 1996
{% endif %}

order by o_orderdate, o_totalprice
