WITH comments AS (
    SELECT * 
    FROM {{ref('stg_mc__comments')}}
)

SELECT 
    comment_id,
    post_id,
    name,
    email,
    body,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM comments