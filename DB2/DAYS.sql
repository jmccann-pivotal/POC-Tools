create or replace function DAYS(date) returns integer
as $$
select ($1 - to_date('01/01/0001','MM/DD/YYYY'))+1;
$$
LANGUAGE sql;

