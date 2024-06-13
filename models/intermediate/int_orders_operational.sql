WITH op_margin as (
select
margin.orders_id
,margin.date_date
,margin.revenue
,margin.quantity
,margin.purchase_cost
,margin.margin
,ship.shipping_fee
,ship.logcost
,ship.ship_cost
 from {{ref("int_orders_margin")}} margin
join {{ref("stg_raw__ship")}} ship using (orders_id))
select
orders_id
,date_date
,round((margin + shipping_fee) - (logcost + ship_cost),2) as operational_margin
,revenue
,quantity
,purchase_cost
,margin
,shipping_fee
,logcost
,ship_cost
from op_margin
order by orders_id desc