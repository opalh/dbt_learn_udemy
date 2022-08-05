with sample_customer as (
    select * from {{ source('sample_2', 'customer')}}
    )
select c_custkey,c_mktsegment, c_acctbal from sample_customer