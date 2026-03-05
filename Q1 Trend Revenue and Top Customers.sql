-- “We noticed that business performance has been inconsistent over time.
-- Using the available dataset, how would you analyze the trend of revenue and identify the top performing customer locations month over month?


with main_cte as (
select a.order_id, 
a.customer_location, 
b.total_sales as revenue, 
month(c.order_date) as date_month
from customer a
join quantity_information b
on a.order_id = b.order_id
join sale_information c
on b.order_id = c.order_id 
),

secundary_cte as (
select customer_location, 
date_month, 
sum(revenue) as revenue 
from main_cte
group by customer_location, date_month
order by date_month asc
) 

select customer_location, 
date_month, 
revenue,
lag(revenue) over( partition by customer_location order by date_month) as over_month_tendency, 
case when (lag(revenue) over( partition by customer_location order by date_month) < revenue) then 'up' when (lag(revenue) over( partition by customer_location order by date_month) > revenue) then 'down' else 'N/A' end as indicator, 
 RANK() OVER (PARTITION BY date_month ORDER BY revenue DESC) AS top_customers
from secundary_cte
