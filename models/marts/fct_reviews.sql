with reviews as (
    select * from {{ ref('stg_order_reviews') }}
),

orders as (
    select * from {{ ref('fct_orders') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['reviews.review_id', 'reviews.order_id']) }} as review_sk,
    reviews.review_id,
    reviews.order_id,
    reviews.review_score,
    {{ clean_string('reviews.review_comment_title') }} as review_comment_title,
    orders.total_payment_value,
    orders.order_status,
    orders.order_purchase_timestamp,
    orders.order_delivered_customer_date,
    orders.order_estimated_delivery_date,
    date_diff(
        date(orders.order_delivered_customer_date),
        date(orders.order_purchase_timestamp),
        day
    ) as delivery_days

from reviews
left join orders
    on reviews.order_id = orders.order_id