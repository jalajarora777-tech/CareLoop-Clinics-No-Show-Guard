USE noshowguard;
-- step2.1 
SELECT COUNT(*) AS total_clinics FROM clinics;
SELECT COUNT(*) AS total_appointments FROM appointments;

SELECT SUM(no_show) AS total_no_shows
FROM appointments;

-- step 2.1
SELECT 
    COUNT(*) AS total_appointments,
    SUM(no_show) AS total_no_shows,
    ROUND(SUM(no_show) * 100.0 / COUNT(*), 2) AS overall_noshow_rate_pct
FROM appointments;

-- Step 2.2 
SELECT 
    c.clinic_name,
    c.city,
    COUNT(a.appointment_id) AS appointments,
    SUM(a.no_show) AS no_shows,
    ROUND(100.0 * SUM(a.no_show) / COUNT(*), 3) AS no_show_pct
FROM appointments a
JOIN clinics c ON a.clinic_id = c.clinic_id
GROUP BY c.clinic_id, c.clinic_name, c.city
ORDER BY no_show_pct DESC;

-- Step 2.3 


SELECT 
    CASE 
        WHEN lead_days BETWEEN 1 AND 7 THEN '1-7'
        WHEN lead_days BETWEEN 8 AND 14 THEN '8-14'
        WHEN lead_days BETWEEN 15 AND 30 THEN '15-30'
        ELSE '31+'
    END AS lead_time_band,
    COUNT(*) AS appointments,
    SUM(no_show) AS no_shows,
    ROUND(100.0 * SUM(no_show) / COUNT(*), 1) AS no_show_pct
FROM appointments
GROUP BY lead_time_band
ORDER BY MIN(lead_days);

-- Step 2.4

WITH monthly AS (
    SELECT 
        SUBSTR(appt_date, 1, 7) AS month,
        COUNT(*) AS appointments,
        ROUND(100.0 * SUM(no_show) / COUNT(*), 1) AS no_show_pct
    FROM appointments
    GROUP BY month
)
SELECT 
    month,
    appointments,
    no_show_pct,
    ROUND(no_show_pct - LAG(no_show_pct) OVER (ORDER BY month), 1) AS change_pct_points
FROM monthly;

-- Step 2.5


WITH clinic_rates AS (
    SELECT 
        c.clinic_name AS clinic,
        c.city,
        ROUND(100.0 * SUM(a.no_show) / COUNT(*), 1) AS no_show_pct
    FROM appointments a
    JOIN clinics c ON a.clinic_id = c.clinic_id
    GROUP BY c.clinic_id, c.clinic_name, c.city
),
overall AS (
    SELECT ROUND(100.0 * SUM(no_show) / COUNT(*), 2) AS overall_pct FROM appointments
)
SELECT 
    cr.city,
    cr.clinic,
    cr.no_show_pct,
    RANK() OVER (PARTITION BY cr.city ORDER BY cr.no_show_pct DESC) AS rank_in_city,
    CASE 
        WHEN cr.no_show_pct > (SELECT overall_pct FROM overall) THEN 'above'
        WHEN cr.no_show_pct < (SELECT overall_pct FROM overall) THEN 'below'
        ELSE 'equal'
    END AS vs_overall
FROM clinic_rates cr
ORDER BY cr.city, rank_in_city;

