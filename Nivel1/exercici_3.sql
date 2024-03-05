select company.country as paises from company
inner join transaction on transaction.company_id=company.id
where transaction.declined=0
group by paises
order by paises asc;