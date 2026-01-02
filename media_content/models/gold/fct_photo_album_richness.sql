WITH users AS (
    SELECT * FROM {{ref('int_mc__users')}}
),
photos AS (
    SELECT * FROM {{ref('int_mc__photos')}}
),
albums AS (
    SELECT * FROM {{ref('int_mc__albums')}}
)

SELECT 
    a.album_id,
    a.user_id,
    COUNT(p.photo_id) AS photo_count,
    MAX(p.elt_load_timestamp) AS last_updated
FROM photos p
LEFT JOIN albums a USING(album_id)
GROUP BY 1,2
ORDER BY 1,2