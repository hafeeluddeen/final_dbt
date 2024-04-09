
-- select count(*) from u_i inner join users on u_i.user_id = users.user_id
-- select count(*) from tut inner join eve on tut.tutor_id = eve.tutor_id

select * from {{ref('stg_events')}}