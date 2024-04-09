with 
required_fields as (
    select _ID as ID,
    USERID as USER_ID,
    EVENTID as EVENT_ID
    
    FROM {{source('final_project','USER_AND_REGISTERED_EVENTS_TABLE')}}
)

select * from required_fields