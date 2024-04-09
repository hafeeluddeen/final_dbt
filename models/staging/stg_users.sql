with 
required_fields as(
    select _ID AS USER_ID,
    FIRSTNAME,
    LASTNAME,
    EMAIL,
    AGE,
    GENDER,
    FROM {{source('final_project','USERS_TABLE')}}
),

type_cast as (
    select 
             USER_ID
            ,FIRSTNAME
            ,LASTNAME
            ,CAST(AGE AS int) AS AGE
            ,GENDER
            ,EMAIL

            from required_fields
)
select * from type_cast
