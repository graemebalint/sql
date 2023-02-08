select product_id
	, discounted_price
	, actual_price, rating
	, round(((cast((actual_price-discounted_price) as numeric)/actual_price)*100)) as percent_savings
from amazon_sales;


-- ######


select category
	, round(cast(avg(rating) as numeric),1) as avg_rating
from amazon_sales
group by category
order by avg_rating desc;


-- ######


with temp as 
	(select category
		, round(cast(avg(rating) as numeric),1) as avg_rating
	from amazon_sales
	group by category)

select category
	, avg_rating
from temp
where avg_rating in ((select max(avg_rating) from temp), (select min(avg_rating) from temp));

select rating
	, round(avg(((cast((actual_price-discounted_price) as numeric)/actual_price)*100))) as avg_percent_savings
from amazon_sales
group by rating
order by rating desc;


-- ######


select category
	, round(avg(((cast((actual_price-discounted_price) as numeric)/actual_price)*100))) as avg_percent_savings
from amazon_sales
group by category
order by avg_percent_savings desc;
