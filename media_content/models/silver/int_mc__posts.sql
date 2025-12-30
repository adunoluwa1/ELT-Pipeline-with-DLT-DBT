WITH posts AS (
    SELECT *
    FROM {{ref('stg_mc__posts')}}
)

SELECT
    post_id,
    user_id,
    title,
    body,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM posts