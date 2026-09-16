{{ config(materialized='table') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('travel360', 'flights') }}

),

cleaned_data AS (

    SELECT
        TRIM(flight_id) AS flight_id,
        TRIM(flight_number) AS flight_number,
        TRIM(origin) AS origin,
        TRIM(destination_id) AS destination_id,
        departure_date,
        departure_time,
        TRIM(status) AS status
    FROM source_data

)

SELECT *
FROM cleaned_data