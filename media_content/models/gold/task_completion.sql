WITH todos AS (
    SELECT * FROM {{ref('int_mc__todos')}}
)

SELECT
    user_id,
    COUNT(*) as total_tasks,
    SUM(case when completed then 1 else 0 end) as completed_tasks,
    ROUND(
        AVG(case when completed then 1 else 0 end) :: NUMERIC,
        2
    ) as completion_rate
FROM todos
GROUP BY 1