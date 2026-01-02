WITH comments AS (
    SELECT * 
    FROM {{ref('stg_mc__comments')}}
)

SELECT 
    comment_id,
    post_id,
    {{coalesce_and_initcap("name")}} AS name,
    {{coalesce_and_initcap("email")}} AS email,
    {{coalesce_and_initcap("body")}} AS body,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM comments