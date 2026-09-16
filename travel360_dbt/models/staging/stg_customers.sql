{{ config(materialized='table') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('travel360', 'customers') }}

),

cleaned_data AS (

    SELECT
        TRIM(customer_id) AS customer_id,
        TRIM(first_name) AS first_name,
        TRIM(last_name) AS last_name,
        TRIM(email) AS email,
        TRIM(phone) AS phone,
        TRIM(city) AS city,
        TRIM(country) AS country
    FROM source_data

)

SELECT *
FROM cleaned_data