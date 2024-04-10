{{ config(
    tags=["transformation"]
) }}


with add_column as (

    select * ,
    concat(firstname,' ',lastname) as fullname,
    case
        when age <= 30 then 'Early Career'
        when age <= 50 then 'Mid Career'
        else 'Late Career'
    end as engineer_type
    from {{ref('stg_users')}}
)

select * from add_column