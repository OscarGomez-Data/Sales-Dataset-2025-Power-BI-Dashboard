#View 2 — Revenue per Category

create or replace view revenue_by_category as
	select A.order_id, 
		B.category, 
		date_format(B.order_date, '%Y-%m') as date_month, 
        sum(C.total_sales) as revenue
	from customer A
	inner join sale_information B
		on A.order_id = B.order_id
	inner join quantity_information C 
		on A.order_id = C.order_id
	group by A.order_id, b.category, date_month


