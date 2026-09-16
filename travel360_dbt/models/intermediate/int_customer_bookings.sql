{{ config(
    materialized='table',
    schema='INTERMEDIATE'
) }}

WITH customers AS (

    SELECT *
    FROM {{ ref('stg_customers') }}

),

bookings AS (

    SELECT *
    FROM {{ ref('stg_bookings') }}

),

final AS (

    SELECT
        b.booking_id,
        b.booking_date,
        b.travel_date,
        b.booking_status,
        b.total_amount,
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        c.phone,
        c.city,
        c.country
    FROM bookings b
    LEFT JOIN customers c
        ON b.customer_id = c.customer_id

)

SELECT *
FROM final