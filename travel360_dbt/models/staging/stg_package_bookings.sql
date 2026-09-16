{{ config(materialized='table') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('travel360', 'package_bookings') }}

),

cleaned_data AS (

    SELECT
        booking_id,
        package_id,
        agent_id,
        customer_id,
        TRY_TO_DATE(TRIM(booking_date)) AS booking_date,
        TRY_TO_DATE(TRIM(travel_date)) AS travel_date,
        number_of_travelers,
        total_amount,
        TRIM(booking_status) AS booking_status
    FROM source_data

)

SELECT *
FROM cleaned_data