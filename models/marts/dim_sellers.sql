with sellers as (
    select * from {{ ref('stg_sellers') }}
),

reviews as (
    select
        order_id,
        review_score
    from {{ ref('stg_order_reviews') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

seller_stats as (
    select
        order_items.seller_id,
        count(distinct order_items.order_id) as total_orders,
        round(avg(reviews.review_score),1) as avg_review_score
    from order_items
    left join reviews using (order_id)
    group by order_items.seller_id
)

select
    sellers.seller_id,
    sellers.seller_city,
    sellers.seller_state,
    {{ coalesce_columns(['seller_stats.total_orders']) }} as total_orders,
    {{ coalesce_columns(['seller_stats.avg_review_score']) }} as avg_review_score
from sellers
left join seller_stats using (seller_id)