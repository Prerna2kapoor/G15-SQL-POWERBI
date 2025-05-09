-- 1) Retrieve the total number of orders placed. 
-- select count(order_id) as total_orders from orders;
-- 2) calculate the total revenue from the generated from the pizza sales
-- SELECT 
--     ROUND(SUM(orders_details.quantity * pizzas.price),
--             2) AS total_sales
-- FROM
--     orders_details
--         JOIN
--     pizzas ON pizzas.pizza_id = orders_details.pizza_id

-- 3) Identify the highest price pizza
-- SELECT 
--     pizza_types.name, pizzas.price
-- FROM
--     pizza_types
--         JOIN
--     pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
-- ORDER BY pizzas.price DESC
-- LIMIT 1;

-- 4.) Identify the most common pizza size ordered.
-- SELECT 
--     pizzas.size,
--     COUNT(orders_details.order_details_id) AS order_count
-- FROM
--     pizzas
--         JOIN
--     orders_details ON pizzas.pizza_id = orders_details.pizza_id
-- GROUP BY pizzas.size
-- ORDER BY order_count DESC;-- 

-- 5.) List the top 5 most ordered pizza types along with their quantities.
-- SELECT 
--     pizza_types.name, SUM(orders_details.quantity) AS quantity
-- FROM
--     pizza_types
--         JOIN
--     pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
--         JOIN
--     orders_details ON orders_details.pizza_id = pizzas.pizza_id
-- GROUP BY pizza_types.name
-- ORDER BY quantity DESC
-- LIMIT 5;


-- 6.) join the necessary tables to find the total quantity of each pizza category ordered.
--  SELECT 
--     pizza_types.category,
--     SUM(orders_details.quantity) AS quantity
-- FROM
--     pizza_types
--         JOIN
--     pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
--         JOIN
--     orders_details ON orders_details.pizza_id = pizzas.pizza_id
-- GROUP BY pizza_types.category
-- ORDER BY quantity DESC;

-- 7.) join relevant tables to find the category-wise distribution of pizzas.
-- SELECT 
--     category, COUNT(name)
-- FROM
--     pizza_types
-- GROUP BY category

-- 8.) Group the orders by date and calculate the average number of pizzas orderd per day.
-- SELECT 
--     ROUND(AVG(quantity), 0) as avg_pizza_ordered_per_day
-- FROM
--     (SELECT 
--         orders.date, SUM(orders_details.quantity) AS quantity
--     FROM
--         orders
--     JOIN orders_details ON orders.order_id = orders_details.order_id
--     GROUP BY orders.date) AS orders_quantity;

-- 9 Determine the top 3 most orederd pizza types based on revenue.
-- SELECT 
--     pizza_types.name,
--     ROUND(SUM(orders_details.quantity * pizzas.price)) AS revenue
-- FROM
--     pizza_types
--         JOIN
--     pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
--         JOIN
--     orders_details ON orders_details.pizza_id = pizzas.pizza_id
-- GROUP BY pizza_types.name
-- ORDER BY revenue DESC
-- LIMIT 3;-- 

-- 10.) Calculate he percentage contribution of each pizza type to total revenue.
-- SELECT 
--     pizza_types.category,
--     ROUND(SUM(orders_details.quantity * pizzas.price) / (SELECT 
--                     ROUND(SUM(orders_details.quantity * pizzas.price),
--                                 2) AS total_sales
--                 FROM
--                     orders_details
--                         JOIN
--                     pizzas ON pizzas.pizza_id = orders_details.pizza_id) * 100,
--             2) AS revenue
-- FROM
--     pizza_types
--         JOIN
--     pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
--         JOIN
--     orders_details ON orders_details.pizza_id = pizzas.pizza_id
-- GROUP BY pizza_types.category
-- ORDER BY revenue DESC;

-- 11.) Analyze the comulative revenue generated over time 
-- select date,
-- sum(revenue) over(order by date) as cum_revenue
-- from
-- (select orders.date,
-- sum(orders_details.quantity * pizzas.price) as revenue
-- from orders_details join pizzas
-- on orders_details.pizza_id = pizzas.pizza_id
-- join orders
-- on orders.order_id = orders_details.order_id
-- group by orders.date) as  sales;

-- 11.)Determine the top 3 most ordered pizza types based on revenue for each pizza category
-- select name, revenue from
-- (select category, name, revenue,
-- rank() over(partition by category order by revenue desc) as rn
-- from
-- (select pizza_types.category, pizza_types.name,
-- sum((orders_details.quantity) * pizzas.price) as revenue
-- from pizza_types join pizzas
-- on pizza_types.pizza_type_id = pizzas.pizza_type_id
-- join orders_details
-- on orders_details.pizza_id = pizzas.pizza_id
-- group by pizza_types.category, pizza_types.name) as a) as b
-- where rn <=3;







        
        
        
        
        











