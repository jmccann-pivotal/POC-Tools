:
#
#	load encrypted data into myusers table in jimtest
#

PUBKEY=`cat ./public.key`

#echo $PUBKEY

CC=`psql -d jimtest -t -q <<_SQL
\timing off
select pgp_key_id(dearmor(('$PUBKEY'))); 
_SQL`

echo $CC

psql -d jimtest -q <<_SQL
select username, pgp_key_id(dearmor(('$PUBKEY'))) as keyweused
from myusers;
_SQL

exit 0
