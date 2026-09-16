{{ config(
    materialized='table',
    schema='MARTS'
) }}

WITH customer_bookings AS (

    SELECT *
    FROM {{ ref('int_customer_bookings') }}

)

SELECT
    booking_id,
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    city,
    country,
    booking_date,
    travel_date,
    booking_status,
    total_amount
FROM customer_bookings