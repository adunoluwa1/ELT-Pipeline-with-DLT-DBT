WITH users AS (
    SELECT * 
    FROM {{ref('stg_mc__users')}}
)

SELECT 
    user_id,
    {{coalesce_and_initcap("name")}} AS full_name,
    username,
    LOWER(email) email,
    {{coalesce_and_initcap("address__street")}} AS street,
    {{coalesce_and_initcap("address__suite")}} AS suite,
    {{coalesce_and_initcap("address__city")}} AS city,
    {{coalesce_and_initcap("address__zipcode",'')}} AS zipcode,
    address__geo__lat AS latitude,
    address__geo__lng AS longitude,
    phone,
    website,
    {{coalesce_and_initcap("company__name")}} AS company__name,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM users