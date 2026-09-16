{{ config(
    materialized='table',
    schema='INTERMEDIATE'
) }}

WITH package_bookings AS (

    SELECT *
    FROM {{ ref('stg_package_bookings') }}

),

packages AS (

    SELECT *
    FROM {{ ref('stg_packages') }}

),

travel_agents AS (

    SELECT *
    FROM {{ ref('stg_travel_agents') }}

),

customers AS (

    SELECT *
    FROM {{ ref('stg_customers') }}

),

final AS (

    SELECT
        pb.booking_id,
        pb.booking_date,
        pb.travel_date,
        pb.number_of_travelers,
        pb.total_amount,
        pb.booking_status,
        p.package_id,
        p.package_name,
        p.duration_days,
        p.price AS package_price,
        a.agent_id,
        a.agent_name,
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email
    FROM package_bookings pb
    LEFT JOIN packages p
        ON pb.package_id = p.package_id
    LEFT JOIN travel_agents a
        ON pb.agent_id = a.agent_id
    LEFT JOIN customers c
        ON TO_VARCHAR(pb.customer_id) = c.customer_id

)

SELECT *
FROM final