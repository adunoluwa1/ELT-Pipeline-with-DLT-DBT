WITH albums AS (
    SELECT * 
    FROM {{ref('stg_mc__albums')}}
)

SELECT 
    album_id,
    user_id,
    {{coalesce_and_initcap("title",'Unknown')}} AS title,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM albums