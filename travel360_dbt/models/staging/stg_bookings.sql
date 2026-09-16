{{ config(materialized='table') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('travel360', 'bookings') }}

),

cleaned_data AS (

    SELECT
        TRIM(booking_id) AS booking_id,
        TRIM(customer_id) AS customer_id,
        TRIM(destination_id) AS destination_id,
        TRIM(hotel_id) AS hotel_id,
        TRIM(flight_id) AS flight_id,
        TRY_TO_DATE(TRIM(booking_date)) AS booking_date,
        TRY_TO_DATE(TRIM(travel_date)) AS travel_date,
        TRIM(booking_status) AS booking_status,
        total_amount
    FROM source_data

)

SELECT *
FROM cleaned_data