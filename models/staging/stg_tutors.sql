{{ config(
    tags=["staging"]
) }}

with

required_fields as (
    
    select 
        _id as tutor_id,
        name,
        email,
        gender,
        experience

    from {{source('final_project','TUTORS_TABLE')}}
    
)

select * from required_fields