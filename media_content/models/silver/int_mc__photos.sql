WITH photos AS (
    SELECT * FROM {{ref('stg_mc__photos')}}
)

SELECT
    photo_id,
    album_id,
    title,
    url,
    thumbnail_url,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM photos