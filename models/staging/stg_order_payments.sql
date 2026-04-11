with source as (
    select * from {{ source('raw_olist', 'olist_order_payments_dataset') }}
),
renamed as (
    select
        order_id,
        payment_sequential,
        payment_type,
        payment_installments,
        payment_value
    from source
)
select * from renamed