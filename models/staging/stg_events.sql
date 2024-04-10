{{ config(
    tags=["staging"]
) }}

with

required_fields as (

    select 
        _ID as EVENT_ID,
        NAME,
        TOTALCAPACITY AS TOTAL_CAPACITY,
        TUTOR AS TUTOR_ID,
        EVENTTYPE AS EVENT_TYPE,
        PROGRAMMINGLANGUAGE AS PROGRAMMING_LANGUAGE,
        FRAMEWORK,
        DURATION AS DURATION_MINS,
        MODE,
        LOCATION,
        TIME AS EVENT_TIMING

    from {{source('final_project','EVENTS_TABLE')}}
    
),

type_cast as (

    select
        EVENT_ID,
        NAME,
        CAST(TOTAL_CAPACITY AS int) AS TOTAL_CAPACITY,
        TUTOR_ID,
        EVENT_TYPE,
        PROGRAMMING_LANGUAGE,
        FRAMEWORK,
        CAST(DURATION_MINS AS int) AS DURATION_MINS,
        MODE,
        LOCATION,
        EVENT_TIMING

    from required_fields
)

select * from type_cast
