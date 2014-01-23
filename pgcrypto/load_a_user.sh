:
#
#	load encrypted data into myusers table in jimtest
#

if [ $# -ne 2 ]
then
	echo "Syntax: $0 <user> <ss_nbr>"
	exit -1
fi

PUBKEY=`cat ./public.key`

#echo $PUBKEY

psql jimtest <<_SQL
insert into myusers ( username, ss_nbr )
VALUES (('$1'),pgp_pub_encrypt(('$2'), dearmor(('$PUBKEY'))));

select id, username from myusers;

_SQL

exit 0
