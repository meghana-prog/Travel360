{{ config(
    materialized='table',
    schema='INTERMEDIATE'
) }}

WITH bookings AS (

    SELECT *
    FROM {{ ref('stg_bookings') }}

),

hotels AS (

    SELECT *
    FROM {{ ref('stg_hotels') }}

),

final AS (

    SELECT
        b.booking_id,
        b.customer_id,
        b.destination_id,
        b.flight_id,
        b.booking_date,
        b.travel_date,
        b.booking_status,
        b.total_amount,
        h.hotel_id,
        h.hotel_name,
        h.city AS hotel_city,
        h.country AS hotel_country,
        h.star_rating,
        h.room_price
    FROM bookings b
    LEFT JOIN hotels h
        ON b.hotel_id = h.hotel_id

)

SELECT *
FROM final