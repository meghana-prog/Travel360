{{ config(materialized='table') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('travel360', 'travel_agents') }}

),

cleaned_data AS (

    SELECT
        agent_id,
        TRIM(agent_name) AS agent_name,
        TRIM(email) AS email,
        TRIM(phone) AS phone,
        TRIM(location) AS location
    FROM source_data

)

SELECT *
FROM cleaned_data