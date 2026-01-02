WITH photos AS (
    SELECT * FROM {{ref('stg_mc__photos')}}
)

SELECT
    photo_id,
    album_id,
    {{coalesce_and_initcap("title")}} AS title,
    {{coalesce_and_initcap("url")}} AS url,
    {{coalesce_and_initcap("thumbnail_url")}} AS thumbnail_url,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM photos