with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select
        customer_id,
        count(order_id) as total_orders,
        count(case when order_status = 'delivered' then 1 end) as delivered_orders,
        count(case when order_status = 'canceled' then 1 end) as cancelled_orders,
        sum(case when order_status = 'delivered' then total_payment_value else 0 end) as total_spent
    from {{ ref('fct_orders') }}
    group by customer_id
)

select
    customers.customer_id,
    customers.customer_unique_id,
    customers.customer_city,
    customers.customer_state,
    customers.customer_zip_code_prefix,
    coalesce(orders.total_orders, 0) as total_orders,
    coalesce(orders.delivered_orders, 0) as delivered_orders,
    coalesce(orders.cancelled_orders, 0) as cancelled_orders,
    round(coalesce(orders.total_spent, 0),2) as total_spent
from customers
left join orders using (customer_id)