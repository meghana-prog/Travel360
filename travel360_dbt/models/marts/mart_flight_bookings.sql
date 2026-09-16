{{ config(
    materialized='table',
    schema='MARTS'
) }}

WITH flight_bookings AS (

    SELECT *
    FROM {{ ref('int_booking_flights') }}

)

SELECT
    booking_id,
    customer_id,
    destination_id,
    hotel_id,
    flight_id,
    flight_number,
    origin,
    departure_date,
    departure_time,
    flight_status,
    booking_date,
    travel_date,
    booking_status,
    total_amount
FROM flight_bookings