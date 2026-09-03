with customers as (

    select * from (
        values
            ('C001', 'Meghana', 'Boddu', 'MEGHANA@EMAIL.COM', 'India'),
            ('C002', 'Rahul', 'Patil', 'rahul@email.com', 'India'),
            ('C003', 'Sneha', 'Sharma', 'SNEHA@EMAIL.COM', 'India'),
            ('C004', 'Amit', 'Joshi', 'amit@email.com', 'India')
    ) as t(customer_id, first_name, last_name, email, country)

)

select
    trim(customer_id) as customer_id,
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    lower(trim(email)) as email,
    trim(country) as country
from customers