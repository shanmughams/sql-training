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
