-- This file emulates some common MS SQL Server functions in PostgreSQL


-- maps getdate() to now()
create or replace function getdate() returns timestamp as '
begin
return now();
end;
' language 'plpgsql';

-- maps isnull() to coalesce()
create or replace function isnull(anyelement, anyelement) returns anyelement as '
begin
return coalesce($1,$2);
end;
' language 'plpgsql' immutable;

-- This allows the use of "+" when joining strings.
create or replace function strcat(text, text) returns text as '
begin
return $1 || $2;
end;
' language 'plpgsql' immutable;
create operator + (procedure = strcat, leftarg = text, rightarg = text);

-- these simulate day, month, and year functions in T-SQL
-- day function for each date/time type.
create or replace function day(timestamptz) returns int as '
begin
return extract(day from $1);
end;
' language 'plpgsql' immutable;

create or replace function day(timestamp) returns int as '
begin
return extract(day from $1);
end;
' language 'plpgsql' immutable;

-- month function for each date/time type.
create or replace function month(timestamptz) returns int as '
begin
return extract(month from $1);
end;
' language 'plpgsql' immutable;

create or replace function month(timestamp) returns int as '
begin
return extract(month from $1);
end;
' language 'plpgsql' immutable;

-- year function for each date/time type.
create or replace function year(timestamptz) returns int as '
begin
return extract(year from $1);
end;
' language 'plpgsql' immutable;

create or replace function year(timestamp) returns int as '
begin
return extract(year from $1);
end;
' language 'plpgsql' immutable;

-- emulate ms sql string functions.
create or replace function space(integer) returns text as '
begin
return repeat('' '', $1);
end;
' language 'plpgsql' immutable;

create or replace function charindex(text, text) returns int as '
begin
return position($1 in $2);
end;
' language 'plpgsql';

create or replace function len(text) returns int as '
begin
return char_length($1);
end;
' language 'plpgsql';

create or replace function left(text, int) returns text as '
begin
return substr($1, 0, $2);
end;
' language 'plpgsql';

-- a function to allow mailing. It is currently a wrapper that allows
-- this functionality to be added later.
-- create or replace function xp_sendmail(tofield text, message text, subject text) returns int as '
-- declare
-- begin
-- return 0;
-- end;
-- ' language 'plpgsql';

-- these functions provide casts from timestamps to ints (# of days). Must be created as super-user.
create or replace function mscomp_int4(interval) returns int4 as '
begin
return extract(day from $1);
end;
' language 'plpgsql' immutable;

create cast (interval as int4) with function mscomp_int4(interval);
create or replace function mscomp_int4(timestamptz) returns int4 as '
begin
return mscomp_int4($1 - ''1/1/1900'');
end;
' language 'plpgsql' immutable;

create cast (timestamptz as int4) with function mscomp_int4
(timestamptz);
create or replace function mscomp_int4(timestamp) returns int4 as '
begin
return mscomp_int4($1 - ''1/1/1900'');
end;
' language 'plpgsql' immutable;

create cast (timestamp as int4) with function mscomp_int4(timestamp);

create or replace function mscomp_float(interval) returns float as '
begin
return (extract(epoch from $1) / 86400);
end;
' language 'plpgsql' immutable;

create cast (interval as float) with function mscomp_float(interval);

create or replace function mscomp_float(timestamptz) returns float as '
begin
return mscomp_float($1 - ''1/1/1900'');
end;
' language 'plpgsql' immutable;

create cast (timestamptz as float) with function mscomp_float(timestamptz);

create or replace function mscomp_float(timestamp) returns float as '
begin
return mscomp_float($1 - ''1/1/1900'');
end;
' language 'plpgsql' immutable;

create cast (timestamp as float) with function mscomp_float(timestamp);

/*
Function to emulate the RIGHT function from SQL Server 2008 R2
*/

create or replace function right ( TEXT, INTEGER) RETURNS TEXT
        language SQL IMMUTABLE STRICT AS $$
        select substring($1 FROM char_length($1)-$2+1) $$;

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

