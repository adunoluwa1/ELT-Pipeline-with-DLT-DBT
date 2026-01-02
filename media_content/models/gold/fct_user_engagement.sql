WITH users AS (
    SELECT * FROM {{ref('int_mc__users')}}
),
posts AS (
    SELECT * FROM {{ref('int_mc__posts')}}
),
comments AS (
    SELECT * FROM {{ref('int_mc__comments')}}
),
albums AS (
    SELECT * FROM {{ref('int_mc__albums')}}
),
photos AS (
    SELECT * FROM {{ref('int_mc__photos')}}
),
todos AS (
    SELECT * FROM {{ref('int_mc__todos')}}
),
post_comments AS (
    SELECT
        c.post_id,
        COUNT(c.comment_id) AS total_comments_per_post
    FROM comments c
    GROUP BY 1
)

SELECT
u.user_id,
COUNT(p.post_id) total_posts,
COUNT(c.comment_id) total_comments,
ROUND(AVG(pc.total_comments_per_post::NUMERIC),0) avg_comment_per_post,
COUNT(a.album_id) total_albums,
COUNT(ph.photo_id) total_photos,
COUNT(t.task_id) total_tasks,
SUM(CASE WHEN t.completed THEN 1 ELSE 0 END) AS total_completed_tasks,
MAX(u.elt_load_timestamp) AS last_updated
FROM users u 
LEFT JOIN posts p USING(user_id)
LEFT JOIN comments c USING(post_id)
LEFT JOIN post_comments pc USING(post_id)
LEFT JOIN albums a USING(user_id)
LEFT JOIN photos ph USING(album_id)
LEFT JOIN todos t USING(user_id)
GROUP BY 1
ORDER BY 1