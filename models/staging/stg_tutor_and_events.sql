with required_fields as(
    select _ID as ID,
     TUTORID as TUTOR_ID,
    EVENTID as EVENT_ID

    from {{source('final_project','TUTOR_AND_EVENT_TABLE')}}
)

select * from required_fields