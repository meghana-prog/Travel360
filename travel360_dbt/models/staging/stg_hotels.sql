{{ config(materialized='table') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('travel360', 'hotels') }}

),

cleaned_data AS (

    SELECT
        TRIM(hotel_id) AS hotel_id,
        TRIM(hotel_name) AS hotel_name,
        TRIM(city) AS city,
        TRIM(country) AS country,
        star_rating,
        room_price
    FROM source_data

)

SELECT *
FROM cleaned_data