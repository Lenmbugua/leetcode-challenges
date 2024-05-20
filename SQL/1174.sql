WITH FirstOrders AS (
    SELECT 
        customer_id, 
        MIN(order_date) AS first_order_date
    FROM 
        Delivery
    GROUP BY 
        customer_id
),
ImmediateFirstOrders AS (
    SELECT 
        f.customer_id
    FROM 
        FirstOrders f
    JOIN 
        Delivery d ON f.customer_id = d.customer_id AND f.first_order_date = d.order_date
    WHERE 
        d.order_date = d.customer_pref_delivery_date
)

SELECT 
    ROUND(
        (COUNT(ifo.customer_id) * 100.0) / COUNT(fo.customer_id), 
        2
    ) AS immediate_percentage
FROM 
    FirstOrders fo
LEFT JOIN 
    ImmediateFirstOrders ifo ON fo.customer_id = ifo.customer_id;
