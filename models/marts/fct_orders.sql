with orders as ( 
    select * from {{ ref('stg_orders')}} 
),

order_items as (
    select * from {{ref('stg_order_items')}}
),

order_payments as (
    select*from {{ref('stg_order_payments')}}

),

order_totals as (
    select
        order_id,
        sum(payment_value) as total_payment_value,
        sum(price) as total_price,
        sum(freight_value) as total_freight_value,
        count(order_item_id) as total_items
    from order_items
    left join order_payments using (order_id)
    group by order_id
)



select
    orders.order_id,
    orders.customer_id,
    orders.order_status,
    orders.order_purchase_timestamp,
    orders.order_delivered_customer_date,
    orders.order_estimated_delivery_date,
    order_totals.total_payment_value,
    order_totals.total_price,
    order_totals.total_freight_value,
    order_totals.total_items
from orders
left join order_totals using (order_id)
