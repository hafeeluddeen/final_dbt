--SELECT event_type, count(*) as total_events from {{ref('transform_events')}} group by event_type order by total_events desc
with users as (
    select user_id, engineer_type  from {{ref('transform_users')}} 
),
events as (
    select event_id, event_type, event_format from {{ref('transform_events')}}
),
users_and_registered_events as (
    select * from {{ref('stg_user_and_intrested_events')}}
),
join_users_with_event_ids as (
    select users.user_id, users.engineer_type , users_and_registered_events.event_id
    from users 
     join users_and_registered_events on users.user_id = users_and_registered_events.user_id
),

join_events as (
    select join_users_with_event_ids.* , events.event_format
    from join_users_with_event_ids inner join events
    on join_users_with_event_ids.event_id = events.event_id
)
select count(*) from join_events
