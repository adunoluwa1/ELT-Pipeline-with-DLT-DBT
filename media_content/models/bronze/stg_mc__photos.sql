WITH photos AS (
    SELECT * FROM {{source('app_raw','photos')}}
)

SELECT
    id AS photo_id,
    album_id,
    title,
    url,
    thumbnail_url,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM photos