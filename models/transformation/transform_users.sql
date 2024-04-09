with add_column as (

    select * ,
    concat(firstname,' ',lastname) as fullname,
    case
        when age <= 30 then 'software engineers'
        when age <= 50 then 'senior software engineers'
        else 'consultants'
    end as engineer_type
    from {{ref('stg_users')}}
)

select * from add_column