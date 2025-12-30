WITH comments AS (
    SELECT * FROM {{source('app_raw','comments')}}
)

SELECT
    id AS comment_id,
    post_id,
    name,
    email,
    body,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM comments