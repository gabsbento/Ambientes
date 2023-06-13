#/bin/bash
#ok
yum install postgresql-server postgresql-contrib -y 
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql


##https://www.bigbinary.com/blog/configure-postgresql-to-allow-remote-connection