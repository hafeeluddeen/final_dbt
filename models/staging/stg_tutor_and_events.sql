with required_fields as (
    SELECT 
     TUTORID AS TUTOR_ID,
    EVENTID AS EVENT_ID
    from {{source('final_project','TUTOR_AND_EVENT_TABLE')}}
)
select * from required_fields