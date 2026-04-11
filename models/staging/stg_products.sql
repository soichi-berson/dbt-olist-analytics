with source as (
    select * from {{ source('raw_olist', 'olist_products_datase') }}
),
renamed as (
    select
        product_id,
        product_category_name,
        product_name_lenght,
        product_description_lenght,
        product_photos_qty,
        product_weight_g,
        product_length_cm,
        product_height_cm,
        product_width_cm
    from source
)
select * from renamed