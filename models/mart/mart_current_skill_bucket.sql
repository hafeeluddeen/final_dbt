{{ config(
    tags=["mart"]
) }}


with events as (
    select * from {{ref('transform_events')}}
),

users_and_registartions as (
    select * from {{ref('stg_user_and_registered_events')}}
)
,

join_users_and_registered_events as (
    select events.programming_language , events.framework  from users_and_registartions inner join events on events.event_id = users_and_registartions.event_id
)

select join_users_and_registered_events.programming_language , join_users_and_registered_events.framework , count(programming_language) as current_talent_pool from join_users_and_registered_events group by 1, 2 order by current_talent_pool desc