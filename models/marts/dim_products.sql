with products as (
    select * from {{ ref('stg_products') }}
),

translation as (
    select * from {{ source('raw_olist', 'product_category_name_translation') }}
)

select
    products.product_id,
    products.product_category_name,
    translation.string_field_1 as product_category_name_english,
    products.product_weight_g,
    products.product_length_cm,
    products.product_height_cm,
    products.product_width_cm
from products
left join translation
    on products.product_category_name = translation.string_field_0