WITH FirstLogin AS (
    SELECT 
        player_id, 
        MIN(event_date) AS first_event_date
    FROM 
        Activity
    GROUP BY 
        player_id
),
ConsecutiveLogin AS (
    SELECT 
        DISTINCT f.player_id
    FROM 
        FirstLogin f
    JOIN 
        Activity a ON f.player_id = a.player_id AND a.event_date = DATE_ADD(f.first_event_date, INTERVAL 1 DAY)
)

SELECT 
    ROUND(
        (COUNT(DISTINCT cl.player_id) / COUNT(DISTINCT f.player_id)), 
        2
    ) AS fraction
FROM 
    FirstLogin f
LEFT JOIN 
    ConsecutiveLogin cl ON f.player_id = cl.player_id;