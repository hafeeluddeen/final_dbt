with required_fields as(
    select
     USERID as USER_ID,
    EVENTID as EVENT_ID

    from {{source('final_project','USER_AND_INTRESTED_EVENTS')}}
)

select * from required_fields