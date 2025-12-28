
-- Total Bookings & Overall Cancellation Rate
SELECT 
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_percent
FROM hotel_booking;

-- Cancellation Rate by Hotel Type
SELECT 
    hotel,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS cancellations,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_percent
FROM hotel_bookings
GROUP BY hotel
ORDER BY cancellation_rate_percent DESC;

-- Average Lead Time: Cancelled vs Not Cancelled
SELECT 
    CASE 
        WHEN is_canceled = 1 THEN 'Cancelled'
        ELSE 'Not Cancelled'
    END AS booking_status,
    ROUND(AVG(lead_time), 2) AS avg_lead_time_days
FROM hotel_bookings
GROUP BY is_canceled;

-- Monthly Cancellation Trend
SELECT 
    arrival_date_year,
    arrival_date_month,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS cancellations,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_percent
FROM hotel_bookings
GROUP BY arrival_date_year, arrival_date_month
ORDER BY arrival_date_year, arrival_date_month;

-- Revenue Loss Due to Cancellations
SELECT 
    ROUND(
        SUM(
            CASE 
                WHEN is_canceled = 1 
                THEN adr * (stays_in_weekend_nights + stays_in_week_nights)
                ELSE 0
            END
        ), 
    2) AS estimated_revenue_loss
FROM hotel_bookings;

-- Revenue Loss by Hotel Type
SELECT 
    hotel,
    ROUND(
        SUM(
            CASE 
                WHEN is_canceled = 1 
                THEN adr * (stays_in_weekend_nights + stays_in_week_nights)
                ELSE 0
            END
        ), 
    2) AS revenue_loss
FROM hotel_bookings
GROUP BY hotel
ORDER BY revenue_loss DESC;

-- Top 5 Customer Segments with Highest Cancellation %
WITH customer_cancellations AS (
    SELECT 
        customer_type,
        COUNT(*) AS total_bookings,
        SUM(is_canceled) AS cancellations,
        ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_percent
    FROM hotel_bookings
    GROUP BY customer_type
)
SELECT *
FROM (
    SELECT *,
           RANK() OVER (ORDER BY cancellation_rate_percent DESC) AS rank_by_cancellation
    FROM customer_cancellations
)
WHERE rank_by_cancellation <= 5;

-- BONUS: High-Risk Lead Time Buckets 
SELECT 
    CASE
        WHEN lead_time <= 30 THEN '0–30 Days'
        WHEN lead_time <= 90 THEN '31–90 Days'
        WHEN lead_time <= 180 THEN '91–180 Days'
        ELSE '180+ Days'
    END AS lead_time_bucket,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS cancellations,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_percent
FROM hotel_bookings
GROUP BY lead_time_bucket
ORDER BY cancellation_rate_percent DESC;

