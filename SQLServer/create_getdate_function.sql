/*
	emulates getdate()function in SQL Server
*/

create function GETDATE() returns DATE
	language SQL IMMUTABLE STRICT AS $$
	select current_date $$;
