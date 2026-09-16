{{ config(
    materialized='table',
    schema='MARTS'
) }}

WITH hotel_bookings AS (

    SELECT *
    FROM {{ ref('int_booking_hotels') }}

)

SELECT
    booking_id,
    customer_id,
    destination_id,
    flight_id,
    hotel_id,
    hotel_name,
    hotel_city,
    hotel_country,
    star_rating,
    room_price,
    booking_date,
    travel_date,
    booking_status,
    total_amount
FROM hotel_bookings