#Compute monthly revenue (Completed only) and the MoM % change per Customer_Location:
#Output: month, Customer_Location, revenue, prev_month_revenue, mom_growth_pct
#MoM% = (Current_Month_Revenue - Previous_Month_Revenue) / Previous_Month_Revenue

 
with status_completed as (
	select order_id, 
		customer_location, 
		status
	from customer
	where LOWER(status) = 'completed'
),

revenue_cte as (
	select order_id, 
		coalesce(sum(total_sales), 0) as revenue
	from quantity_information
	group by order_id
),

month_cte as (
	select order_id, 
		date_format(min(order_date), '%Y-%m') as month_date
	from sale_information
	group by order_id
),

join_cte as(
	select A.customer_location, 
		coalesce(sum(B.revenue), 0) as revenue, 
		C.month_date
	from status_completed A
	left join revenue_cte B
		on A.order_id = B.order_id
	left join month_cte C 
		on A.order_id = C.order_id
	group by C.month_date, A.customer_location
),

prev_month as(
	select month_date, 
		customer_location, 
		revenue, 
		lag(revenue) over(partition by customer_location order by month_date) as prev_month_revenue
	from join_cte
)

select *, 
		round( (revenue - prev_month_revenue) / nullif(prev_month_revenue, 0), 2) as mom_growth_pct
from prev_month
order by month_date, mom_growth_pct DESC

