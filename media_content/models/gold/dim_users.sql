WITH users AS (
    SELECT * FROM {{ref('int_mc__users')}}
)

SELECT 
    user_id,
    full_name,
    email,
    street,
    city,
    zipcode,
    phone,
    company_name,
    elt_load_timestamp
FROM users