WITH albums AS (
    SELECT * FROM {{source('app_raw','albums')}}
)

SELECT
    id AS album_id,
    user_id,
    title,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM albums