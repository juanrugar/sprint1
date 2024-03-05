select count(DISTINCT company.country) as Total_paises from company
inner join transaction on transaction.company_id=company.id
where transaction.declined=0;



