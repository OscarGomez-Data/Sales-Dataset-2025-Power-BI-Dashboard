#View 3 — Revenue per Month

create or replace view revenue_per_month as

	select  A.order_id, 
		date_format(B.order_date, '%Y-%m') as date_month, 
        sum(C.total_sales) as revenue
	from customer A
	inner join sale_information B
		on A.order_id = B.order_id
	inner join quantity_information C 
		on A.order_id = C.order_id
	group by A.order_id, date_month