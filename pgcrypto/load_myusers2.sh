:
#
#	load encrypted data into myusers table in jimtest
#

PUBKEY=`cat ./public.key`

#echo $PUBKEY

psql jimtest <<_SQL
insert into myusers ( username, ss_nbr )
VALUES ('smcduck',pgp_pub_encrypt('410355779', dearmor(('$PUBKEY'))));

select id, username from myusers;

_SQL

exit 0
