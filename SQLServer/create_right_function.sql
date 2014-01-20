/*
Function to emulate the RIGHT function from SQL Server 2008 R2
*/

create function right ( TEXT, INTEGER) RETURNS TEXT
	language SQL IMMUTABLE STRICT AS $$
	select substring($1 FROM char_length($1)-$2+1) $$;
