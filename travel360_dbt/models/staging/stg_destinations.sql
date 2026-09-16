{{ config(materialized='table') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('travel360', 'destinations') }}

),

cleaned_data AS (

    SELECT
        TRIM(destination_id) AS destination_id,
        TRIM(city) AS city,
        TRIM(country) AS country,
        TRIM(airport_code) AS airport_code,
        TRIM(region) AS region
    FROM source_data

)

SELECT *
FROM cleaned_data