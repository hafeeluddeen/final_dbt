-- Tutors focus on events based on event format

with events as (
    select * from {{ref('transform_events')}}
),

tutors as (
    select * from {{ref('stg_tutors')}}
),

join_events_and_tutors as (
    select  events.event_id, tutors.experience,events.event_format from events inner join tutors on events.tutor_id = tutors.tutor_id
)
,
registered_events as (
    select * from {{ref('stg_user_and_registered_events')}}
)
,

reg_events_and_tutors as (
    select join_events_and_tutors.experience , join_events_and_tutors.event_format  from join_events_and_tutors inner join registered_events on registered_events.event_id = join_events_and_tutors.event_id
)


select * , count(experience) as total_sessions_taken from reg_events_and_tutors group by experience , event_format order by experience asc, total_sessions_taken desc



