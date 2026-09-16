{{ config(
    materialized='table',
    schema='MARTS'
) }}

WITH package_bookings AS (

    SELECT *
    FROM {{ ref('int_package_bookings') }}

)

SELECT
    booking_id,
    customer_id,
    first_name,
    last_name,
    email,
    package_id,
    package_name,
    duration_days,
    package_price,
    agent_id,
    agent_name,
    booking_date,
    travel_date,
    number_of_travelers,
    total_amount,
    booking_status
FROM package_bookings