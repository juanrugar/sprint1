select company_name as compañía, phone as teléfono, country as país, sum(amount) as total
from company
inner join transaction on company.id=transaction.company_id
group by company.id
having sum(amount) between 100 and 200
order by sum(amount) desc;