with users as (
    select * from {{ref('transform_users')}}
),
events as (
    select * from {{ref('transform_events')}}
),

users_and_registartions as(
    select * from {{ref('stg_user_and_registered_events')}}
),

join_users as (
    select users.user_id, users_and_registartions.event_id  from users inner join users_and_registartions on users.user_id = users_and_registartions.user_id
),
join_events as (
    select join_users.user_id , events.duration_mins from events inner join join_users on events.event_id = join_users.event_id 
)
,
total_enagement_and_events as (
    select user_id  ,sum(duration_mins)  as total_engagement , count(duration_mins) as total_events from join_events group by user_id
)
select * ,round( (total_engagement / total_events) , 2)as average_watch_time from total_enagement_and_events order by average_watch_time desc
