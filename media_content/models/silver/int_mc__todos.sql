WITH todos AS (
    SELECT *
    FROM {{ref('stg_mc__todos')}}
)

SELECT
    task_id,
    user_id,
    title,
    completed,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM todos