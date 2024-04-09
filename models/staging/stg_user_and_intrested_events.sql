with required_fields as(
    select _ID as ID,
     USERID as USER_ID,
    EVENTID as EVENT_ID

    from {{source('final_project','USER_AND_INTRESTED_EVENTS')}}
)

select * from required_fields