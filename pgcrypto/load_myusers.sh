:
#
#	load encrypted data into myusers table in jimtest
#

PUBKEY=`cat ./public.key`

#echo $PUBKEY

psql jimtest <<_SQL
insert into myusers ( username, ss_nbr )
select x.username, pgp_pub_encrypt(x.cc, keys.pubkey) as cc
from (VALUES ('jimmccann','30020400'), ('dduck','30121501')) 
as x(username, cc)
cross join (select dearmor(('$PUBKEY'))as pubkey) as keys;

select * from myusers;

_SQL

exit 0
