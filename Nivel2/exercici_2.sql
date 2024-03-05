select timestamp as fecha, sum(amount) as cantidad
from transaction
where declined = 0
group by fecha, company_id
order by cantidad desc limit 5;