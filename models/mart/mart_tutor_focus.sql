-- Tutors focus on events based on event format
{{
    config(
        tags=['mart']
    )
}}

with events as (
    select * from {{ref('transform_events')}}
),

tutors as (
    select * from {{ref('stg_tutors')}}
),

join_events_and_tutors as (
    select  events.event_id, tutors.experience,events.event_format , events.event_type from events inner join tutors on events.tutor_id = tutors.tutor_id
)
,
registered_events as (
    select * from {{ref('stg_user_and_registered_events')}}
)
,

reg_events_and_tutors as (
    select join_events_and_tutors.experience , join_events_and_tutors.event_format , join_events_and_tutors.event_type  from join_events_and_tutors inner join registered_events on registered_events.event_id = join_events_and_tutors.event_id
)


select reg_events_and_tutors.experience, reg_events_and_tutors.event_format,reg_events_and_tutors.event_type , count(experience) as total_sessions_taken from reg_events_and_tutors group by experience , event_format , event_type order by experience asc,event_format asc, event_type asc,  total_sessions_taken desc



