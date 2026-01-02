WITH users AS (
    SELECT * FROM {{ref('int_mc__users')}}
),
posts AS (
    SELECT * FROM {{ref('int_mc__posts')}}
),
comments AS (
    SELECT * FROM {{ref('int_mc__comments')}}
)

SELECT 
    p.post_id,
    p.user_id,
    COUNT(c.comment_id) AS comment_count,
    MAX(p.elt_load_timestamp) AS last_updated
FROM posts p
LEFT JOIN comments c USING(post_id)
GROUP BY 1,2
ORDER BY 1,2