
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

-- {{ config(materialized='table', alias='fist_model' , schema='TEST', database='analytics_test', post_hook='grant select on {{this}} to role analyst' ) }}
{{ config(materialized='table', alias='fist_model', tags=['nightly','example'] ) }}
-- dbt run --model tag:nightly

with source_data as (

    select 1 as id
    union all
    select null as id
    union all
    select 2 as id

)

select * --, {{ var('my_first_variable') }} as first_variable
from source_data
-- where id >= {{ var('my_third_variable') }}
/*
    Uncomment the line below to remove records with null `id` values
*/

