{{
    config(
        tags=['mart']
    )
}}

with 

events as (

    select 
        * 

    from {{ref('transform_events')}}

),

users_and_intrested as (
    
    select 
        * 

    from {{ref('stg_user_and_intrested_events')}}

),

join_users_and_intrested_events as (
    select 
        events.programming_language,
        events.framework  
        
    from users_and_intrested 
    inner join events 
    
    on events.event_id = users_and_intrested.event_id
)

select 
    *,
    count(programming_language) as future_expected_talent_pool

from join_users_and_intrested_events
group by 1, 2 
order by future_expected_talent_pool desc