WITH albums AS (
    SELECT * 
    FROM {{ref('stg_mc__albums')}}
)

SELECT 
    album_id,
    user_id,
    title,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM albums