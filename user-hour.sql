WITH week_data AS (
    SELECT 
        soeid,
        CASE 
            WHEN date_captured BETWEEN TO_DATE('2024-04-23', 'YYYY-MM-DD') AND TO_DATE('2024-04-29', 'YYYY-MM-DD') THEN 'week1'
            WHEN date_captured BETWEEN TO_DATE('2024-04-30', 'YYYY-MM-DD') AND TO_DATE('2024-05-06', 'YYYY-MM-DD') THEN 'week2'
            WHEN date_captured BETWEEN TO_DATE('2024-05-07', 'YYYY-MM-DD') AND TO_DATE('2024-05-13', 'YYYY-MM-DD') THEN 'week3'
            WHEN date_captured BETWEEN TO_DATE('2024-05-14', 'YYYY-MM-DD') AND TO_DATE('2024-05-20', 'YYYY-MM-DD') THEN 'week4'
            WHEN date_captured BETWEEN TO_DATE('2024-05-21', 'YYYY-MM-DD') AND TO_DATE('2024-05-25', 'YYYY-MM-DD') THEN 'week5'
        END AS week
    FROM 
        dta
    WHERE 
        date_captured BETWEEN TO_DATE('2024-04-23', 'YYYY-MM-DD') AND TO_DATE('2024-05-25', 'YYYY-MM-DD')
        AND TO_CHAR(date_captured, 'DY') NOT IN ('SAT', 'SUN')
),
soeid_week_count AS (
    SELECT 
        soeid,
        COUNT(DISTINCT week) AS week_count
    FROM 
        week_data
    GROUP BY 
        soeid
)
SELECT 
    soeid
FROM 
    soeid_week_count
WHERE 
    week_count <= 3;


---
SELECT 
    soeid,
    SUM(CASE 
            WHEN date_captured BETWEEN TO_DATE('2024-05-01', 'YYYY-MM-DD') AND TO_DATE('2024-05-07', 'YYYY-MM-DD') 
            THEN total_hours 
            ELSE 0 
        END) AS week1_hours,
    SUM(CASE 
            WHEN date_captured BETWEEN TO_DATE('2024-05-08', 'YYYY-MM-DD') AND TO_DATE('2024-05-14', 'YYYY-MM-DD') 
            THEN total_hours 
            ELSE 0 
        END) AS week2_hours,
    SUM(CASE 
            WHEN date_captured BETWEEN TO_DATE('2024-05-15', 'YYYY-MM-DD') AND TO_DATE('2024-05-21', 'YYYY-MM-DD') 
            THEN total_hours 
            ELSE 0 
        END) AS week3_hours,
    SUM(CASE 
            WHEN date_captured BETWEEN TO_DATE('2024-05-22', 'YYYY-MM-DD') AND TO_DATE('2024-05-28', 'YYYY-MM-DD') 
            THEN total_hours 
            ELSE 0 
        END) AS week4_hours
FROM 
    dta
WHERE 
    date_captured BETWEEN TO_DATE('2024-05-01', 'YYYY-MM-DD') AND TO_DATE('2024-05-31', 'YYYY-MM-DD')
GROUP BY 
    soeid;
-------------------------------------------------

WITH week_data AS (
    SELECT 
        soeid,
        CASE 
            WHEN date_captured BETWEEN TO_DATE('2024-05-01', 'YYYY-MM-DD') AND TO_DATE('2024-05-07', 'YYYY-MM-DD') THEN 'week1'
            WHEN date_captured BETWEEN TO_DATE('2024-05-08', 'YYYY-MM-DD') AND TO_DATE('2024-05-14', 'YYYY-MM-DD') THEN 'week2'
            WHEN date_captured BETWEEN TO_DATE('2024-05-15', 'YYYY-MM-DD') AND TO_DATE('2024-05-21', 'YYYY-MM-DD') THEN 'week3'
            WHEN date_captured BETWEEN TO_DATE('2024-05-22', 'YYYY-MM-DD') AND TO_DATE('2024-05-28', 'YYYY-MM-DD') THEN 'week4'
            WHEN date_captured BETWEEN TO_DATE('2024-05-29', 'YYYY-MM-DD') AND TO_DATE('2024-05-31', 'YYYY-MM-DD') THEN 'week5'
        END AS week
    FROM 
        dta
    WHERE 
        date_captured BETWEEN TO_DATE('2024-05-01', 'YYYY-MM-DD') AND TO_DATE('2024-05-31', 'YYYY-MM-DD')
),
soeid_week_count AS (
    SELECT 
        soeid,
        COUNT(DISTINCT week) AS week_count
    FROM 
        week_data
    GROUP BY 
        soeid
)
SELECT 
    soeid
FROM 
    soeid_week_count
WHERE 
    week_count <= 3;

