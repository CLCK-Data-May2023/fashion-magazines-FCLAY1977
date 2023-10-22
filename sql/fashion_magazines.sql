SELECT
    c.customer_name AS Customer,
    PRINTF('$%.2f', SUM(s.price_per_month * s.subscription_length)) AS "Amount Due"
FROM
    customers AS c
INNER JOIN
    orders AS o ON c.customer_id = o.customer_id
INNER JOIN
    subscriptions AS s ON o.subscription_id = s.subscription_id
WHERE
    o.order_status = 'unpaid'
    AND s.description = 'Fashion Magazine'
GROUP BY
    c.customer_name;
