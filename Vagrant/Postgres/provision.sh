#/bin/bash
#ok
yum install postgresql-server postgresql-contrib -y 
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql
mv /var/lib/pgsql/data/postgresql.conf /var/lib/pgsql/data/postgresql.conf.old
touch /var/lib/pgsql/data/postgresql.conf
echo > /var/lib/pgsql/data/postgresql.conf
cat <<EOT >> /var/lib/pgsql/data/postgresql.conf
listen_addresses = '0.0.0.0'
EOT
mv /var/lib/pgsql/data/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf.old
touch /var/lib/pgsql/data/pg_hba.conf
echo > /var/lib/pgsql/data/pg_hba.conf
cat <<EOT >> /var/lib/pgsql/data/pg_hba.conf
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     peer
# IPv4 local connections:
host    all             all             127.0.0.1/32            ident
# IPv6 local connections:
host    all             all             ::1/128                 ident
# Allow replication connections from localhost, by a user with the
# replication privilege.
#local   replication     postgres                                peer
#host    replication     postgres        127.0.0.1/32            ident
#host    replication     postgres        ::1/128                 ident

host    all             all              0.0.0.0/0                       md5
host    all             all              ::/0                            md5


EOT

##https://www.bigbinary.com/blog/configure-postgresql-to-allow-remote-connection
#https://hassanannajjar.medium.com/how-to-fix-error-password-authentication-failed-for-the-user-in-postgresql-896e1fd880dc