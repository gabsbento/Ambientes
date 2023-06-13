#/bin/bash
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

yum install nginx -y 
systemctl start nginx
systemctl enable nginx

#firewall-cmd --permanent --add-port=80/tcp
#firewall-cmd --reload


yum install mariadb-server php-mysql -y 
systemctl start mariadb.service
#/usr/bin/mysql_secure_installation  ## configuração de segurança


yum install yum-utils -y
yum-config-manager --enable remi-php72 
yum install php php-fpm php-common php-xml php-mbstring php-json php-zip -y


systemctl start php-fpm
systemctl enable php-fpm


curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer

chown -R vagrant:vagrant /var/www/html

##https://www.tecmint.com/install-laravel-in-centos/