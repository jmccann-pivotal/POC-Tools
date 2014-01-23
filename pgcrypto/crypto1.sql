create table jcrypt (
id serial,
txt1 text,
crypted bytea,
dttm timestamp default now());
