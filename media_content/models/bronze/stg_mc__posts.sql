WITH posts AS (
    SELECT *
    FROM {{source('app_raw','posts')}}
)

SELECT
    id AS post_id,
    user_id,
    title,
    body,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM posts