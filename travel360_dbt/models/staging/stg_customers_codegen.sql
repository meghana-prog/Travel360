

with source as (

    select * from {{ source('travel360', 'customers') }}

),

renamed as (

    select
        customer_id,
        first_name,
        last_name,
        email,
        phone,
        city,
        country

    from source

)

select * from renamed

