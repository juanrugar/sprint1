/* NIVEL 1 
   EJERCICIO 1
   A partir de los documentos adjuntos (estructura_dades y dades_introduir), importa las dos tablas. 
   Muestra las características principales del esquema creado y explica las diferentes tablas y variables que existen. 
   Asegúrate de incluir un diagrama que ilustre la relación entre las diferentes taulas y variables.
*/

describe company;
describe transaction;

/* NIVEL 1 
   EJERCICIO 2
   Realiza la siguiente consulta: has de obtener el nombre, email y país de cada compañía. Ordena los datos en función del nombre de las compañías.
*/

select company_name as Nom, 
email as email, 
country as País
from company
order by company_name asc;

/* NIVEL 1 
   EJERCICIO 3
   Desde la sección de márquetin nos solicitan que les pasemos un listado de los países que están realizando compras.
*/

select company.country as paises from company
inner join transaction on transaction.company_id=company.id
where transaction.declined=0
group by paises
order by paises asc;

/* NIVEL 1 
   EJERCICIO 4
   Desde márquetin también quieren saber desde cuantos países se realizan las compras.
*/

select count(DISTINCT company.country) as Total_paises from company
inner join transaction on transaction.company_id=company.id
where transaction.declined=0;


/* NIVEL 1 
   EJERCICIO 5
   Tu jefe identifica un error con la compañía que tiene identificador 'b-2354'. 
   Por lo tanto, te solicita que le indiques el país y le nombre de compañía de este identificador.
*/

select country as pais, company_name as companyia
from company 
where id like "b-2354";

/* NIVEL 1 
   EJERCICIO 6
   Además tu jefe te solicita que indiques cual es la compañía con mayor gasto medio.
*/

select company.company_name as companyia, avg(transaction.amount) as despesa_mitjana
from company
inner join transaction on transaction.company_id=company.id
where transaction.declined=0
group by transaction.company_id 
order by despesa_mitjana desc limit 1;

/* NIVEL 2 
   EJERCICIO 1
   Tu jefe está redactando un informe de cierre del año y te solicita que le envíes información relevante para el documento. 
   Para ello te solicita verificar si en la base de datos existen compañías con identificadores (id) duplicados.
*/

select id, count(id) as cantidad from company
group by id
having cantidad > 1;

/* NIVEL 2 
   EJERCICIO 2
   ¿En qué día se realizaron las cinco ventas más costosas? 
   Muestra la fecha de la transacción y la sumatoria de la cantidad de dinero.
*/

select timestamp as fecha, sum(amount) as cantidad
from transaction
where declined = 0
group by fecha, company_id
order by cantidad desc limit 5;

/* NIVEL 2 
   EJERCICIO 3
   ¿En qué día se realizaron las cinco ventas de menor valor? 
   Muestra la fecha de la transacción y la sumatoria de la cantidad de dinero.
*/

select timestamp as fecha, sum(amount) as cantidad
from transaction
where declined = 0 
group by fecha, company_id
order by cantidad asc limit 5;

/* NIVEL 2 
   EJERCICIO 4
   ¿Cuál es la media de gasto por país? Presenta los resultados ordenados de mayor a menor.
*/

select distinct company.country as país, avg(transaction.amount) as mitjana
from company
inner join transaction on transaction.company_id=company.id
group by país
order by mitjana desc;

/* NIVEL 3 
   EJERCICIO 1
   Presenta el nombre, teléfono y país de las compañías, junto con la cantidad total gastada, 
   de aquellas que realizaron transacciones con un gasto comprendido entre 100 y 200 euros. 
   Ordena los resultados de mayor a menor cantidad gastada.
*/

select company_name as compañía, phone as teléfono, country as país, sum(amount) as total
from company
inner join transaction on company.id=transaction.company_id
group by company.id
having sum(amount) between 100 and 200
order by sum(amount) desc;

/* NIVEL 3 
   EJERCICIO 2
   Indica el nombre de las compañías que realizaron compras el 16 de marzo de 2022, 28 de febrero de 2022 y 13 de febrero de 2022.
*/

select company_name as compañía, timestamp as fecha
from company
inner join transaction on company.id=transaction.company_id
where timestamp between '2022-03-16 00:00:00.00' and '2022-03-16 23:59:59.999' or
timestamp between '2022-02-28 00:00:00.00' and '2022-02-28 23:59:59.999' or
timestamp between '2022-02-13 00:00:00.00' and '2022-02-13 23:59:59.999'
order by compañía;

