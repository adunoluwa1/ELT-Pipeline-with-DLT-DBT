WITH todos AS (
    SELECT *
    FROM {{source('app_raw','todos')}}
)

SELECT
    id AS task_id,
    user_id,
    title,
    completed,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM todos