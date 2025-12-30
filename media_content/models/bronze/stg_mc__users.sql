WITH users AS (
    SELECT *
    FROM {{source('app_raw','users')}}
)

SELECT
    id AS user_id,
    name,
    username,
    email,
    address__street,
    address__suite,
    address__city,
    address__zipcode,
    address__geo__lat,
    address__geo__lng,
    phone,
    website,
    company__name,
    company__catch_phrase,
    company__bs,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM users