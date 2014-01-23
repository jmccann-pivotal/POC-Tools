:
#
#	load encrypted data into myusers table in jimtest
#

PRIVKEY=`cat ./secret.key`



psql -d jimtest -q <<_SQL
select username, pgp_pub_decrypt(ss_nbr,dearmor(('$PRIVKEY')))as dssnbr
from myusers;
_SQL

exit 0
