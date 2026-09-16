{{ config(materialized='table') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('travel360', 'payments') }}

),

cleaned_data AS (

    SELECT
        TRIM(payment_id) AS payment_id,
        TRIM(booking_id) AS booking_id,
        payment_date,
        amount,
        TRIM(payment_method) AS payment_method,
        TRIM(payment_status) AS payment_status
    FROM source_data

)

SELECT *
FROM cleaned_data