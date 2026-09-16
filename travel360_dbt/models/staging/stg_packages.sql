{{ config(materialized='table') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('travel360', 'packages') }}

),

cleaned_data AS (

    SELECT
        package_id,
        TRIM(package_name) AS package_name,
        destination_id,
        duration_days,
        price,
        TRIM(description) AS description
    FROM source_data

)

SELECT *
FROM cleaned_data