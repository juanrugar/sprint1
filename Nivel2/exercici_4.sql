select distinct company.country as país, avg(transaction.amount) as mitjana
from company
inner join transaction on transaction.company_id=company.id
group by país
order by mitjana desc;