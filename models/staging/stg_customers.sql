with source as (
    select * from {{ source('raw_olist', 'olist_customers_dataset') }}
),
renamed as (
    select
        customer_id,
        customer_unique_id,
        customer_zip_code_prefix,
        {{ clean_string('customer_city') }} as customer_city,
        {{ clean_string('customer_state') }} as customer_state
    from source
)
select * from renamed