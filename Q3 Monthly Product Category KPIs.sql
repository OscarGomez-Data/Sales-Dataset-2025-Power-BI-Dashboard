#Build a report by month and category that includes:

#monthly_revenue = category revenues for that month.
#month_total_revenue = total revenue of the month (all categories).
#share_of_month = percentage that the category represents of the total for the month.
#prev_month_revenue = revenue from the previous month for that category.
#mom_growth_pct = month-over-month percentage growth for that category.
#running_ytd_revenue = Year-to-date total by category (January→current month).
#rank_in_month = Category ranking by revenue within the month.


with completed_status as(
	select order_id, 
		lower(status) as status
	from customer
	where lower(status) = 'completed'
),

revenue_per_order as(
	select order_id, 
		sum(total_sales) as monthly_revenue
	from quantity_information
	group by order_id
),

category_month as (
	select order_id, 
		category, 
		min(date_format(order_date, '%Y-%m')) as month_date
	from sale_information
	group by order_id, category
),

join_cte as(
	select sum(B.monthly_revenue) as monthly_revenue, 
		C.category, 
		C.month_date
	from completed_status A 
	join revenue_per_order B
		on A.order_id = B.order_id
	join category_month C 
		on A.order_id = C.order_id
	group by C.month_date, C.category
)

select month_date,
	category,
    monthly_revenue,
    coalesce(sum(monthly_revenue) over(partition by month_date), 0) as month_total_revenue,
    monthly_revenue / nullif(sum(monthly_revenue) over(partition by month_date), 0) as share_of_month,
    lag(monthly_revenue) over(partition by category order by month_date) as prev_month_revenue,
    (monthly_revenue -  lag(monthly_revenue) over(partition by category order by month_date) )/ nullif(lag(monthly_revenue) over(partition by category order by month_date), 0) as mom_growth_pct,
    sum(monthly_revenue) over(partition by category, year(month_date) order by month_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_ytd_revenue,
	dense_rank() over(partition by month_date order by monthly_revenue DESC) as rank_in_month
from join_cte
order by month_date





