select distinct product_id, 10 as price 
from Products 
where product_id not in(select distinct product_id from Products where change_date <='2019-08-16' )
union 
select product_id, new_price as price 
from Products 
where (product_id,change_date) in (select product_id , max(change_date) as date 
from Products 
where change_date <='2019-08-16' 
<<<<<<< HEAD
group by product_id)
select * from 
=======
group by product_id)
>>>>>>> 89a0c05a28a05b943383d5e769c0a762c4218317
