/*
	emulates SQL SERVER funcxtion ADDDATE
*/

create or replace function dateadd (text, integer, timestamptz)
returns timestamptz as 
$BODY$

declare
p_Interval ALIAS FOR $1;
p_N ALIAS for $2;
p_Date Alias for $3;

BEGIN

if p_Interval = 'DAY' then
	return p_Date + cast(p_N || 'days' as interval);
elseif
	p_Interval = 'MONTH' then
	return p_Date + cast(p_N || 'months' as interval);
else
	raise exception 'dateadd parameter not supported';
	return null;
end if;
END
$BODY$
LANGUAGE 'plpgsql';

