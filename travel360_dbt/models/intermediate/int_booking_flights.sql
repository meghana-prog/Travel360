{{ config(
    materialized='table',
    schema='INTERMEDIATE'
) }}

WITH bookings AS (

    SELECT *
    FROM {{ ref('stg_bookings') }}

),

flights AS (

    SELECT *
    FROM {{ ref('stg_flights') }}

),

final AS (

    SELECT
        b.booking_id,
        b.customer_id,
        b.destination_id,
        b.hotel_id,
        b.booking_date,
        b.travel_date,
        b.booking_status,
        b.total_amount,
        f.flight_id,
        f.flight_number,
        f.origin,
        f.departure_date,
        f.departure_time,
        f.status AS flight_status
    FROM bookings b
    LEFT JOIN flights f
        ON b.flight_id = f.flight_id

)

SELECT *
FROM final