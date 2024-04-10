{{ config(
    tags=["transformation"]
) }}

with 

add_column as (

    select 
        *, 
        case
            when duration_mins <= 60 then 'short format'
            when duration_mins <=90 then 'medium formt'
            else 'long format'
        end as event_format

    from {{ref('stg_events')}}
    
)

select * from add_column