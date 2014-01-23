insert into jcrypt values (0, 'Hot',encrypt('Dog','test1','aes'));
select * from jcrypt;
select txt1, decrypt(crypted,'test','aes') from jcrypt;
insert into jcrypt values (0, 'Donald',encrypt('Duck','test1','aes'));
select * from jcrypt;
select txt1, decrypt(crypted,'test1','aes') from jcrypt;

