WITH todos AS (
    SELECT *
    FROM {{ref('stg_mc__todos')}}
)

SELECT
    task_id,
    user_id,
    {{coalesce_and_initcap("title")}} AS title,
    completed,
    {{dbt.current_timestamp()}} elt_load_timestamp
FROM todos