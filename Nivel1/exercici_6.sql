select company.company_name as companyia, avg(transaction.amount) as despesa_mitjana
from company
inner join transaction on transaction.company_id=company.id
where transaction.declined=0
group by transaction.company_id 
order by despesa_mitjana desc limit 1;