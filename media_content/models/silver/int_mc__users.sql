WITH users AS (
    SELECT * 
    FROM {{ref('stg_mc__users')}}
)

SELECT 
    user_id,
    name AS full_name,
    username,
    email,
    address__street AS street,
    address__suite AS suite,
    address__city AS city,
    address__zipcode AS zipcode,
    address__geo__lat AS latitude,
    address__geo__lng AS longitude,
    phone,
    website,
    company__name,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM users