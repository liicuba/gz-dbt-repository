with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        CAST(shipping_fee AS FLOAT64) as shipping_fee,
        logcost,
        CAST(ship_cost AS INT64) AS ship_cost

    from source

)

select * from renamed