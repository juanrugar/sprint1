select company_name as compañía, timestamp as fecha
from company
inner join transaction on company.id=transaction.company_id
where timestamp between '2022-03-16 00:00:00.00' and '2022-03-16 23:59:59.999' or
timestamp between '2022-02-28 00:00:00.00' and '2022-02-28 23:59:59.999' or
timestamp between '2022-02-13 00:00:00.00' and '2022-02-13 23:59:59.999'
order by compañía;

