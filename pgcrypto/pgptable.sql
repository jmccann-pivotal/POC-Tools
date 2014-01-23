--
--  Table to use with PGP encryption
--

create table myusers
(
	id serial,
	username varchar(50),
	ss_nbr bytea
)
distributed by (id);

