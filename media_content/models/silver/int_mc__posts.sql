WITH posts AS (
    SELECT *
    FROM {{ref('stg_mc__posts')}}
)

SELECT
    post_id,
    user_id,
    {{coalesce_and_initcap("title")}} AS title,
    {{coalesce_and_initcap("body")}} AS body,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM posts