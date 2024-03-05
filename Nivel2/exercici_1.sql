select id, count(id) as cantidad from company
group by id
having cantidad > 1;

