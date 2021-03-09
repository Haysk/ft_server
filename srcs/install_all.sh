# install_nginx
rm /etc/nginx/sites-enabled/default
cp /root/nginx_config /etc/nginx/sites-enabled/dylews.com

# install_database
service mysql start
mysql -u root < /root/database_conf.sql

#install_SSL
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
mv mkcert-v1.4.3-linux-amd64 usr/local/bin/mkcert
chmod +x /usr/local/bin/mkcert
mkcert -install
cd /root/.local/share/mkcert/ && mkcert localhost


# install_wordpress
cd
wget https://fr.wordpress.org/latest-fr_FR.tar.gz
tar -zxf latest-fr_FR.tar.gz
mv wordpress /usr/share/nginx/html/

# install_phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
tar -zxf phpMyAdmin-5.1.0-english.tar.gz
mv phpMyAdmin-5.1.0-english /usr/share/nginx/html/phpmyadmin
mv /root/config.inc.php /usr/share/nginx/html/phpmyadmin/.

mv /root/wp-config.php /usr/share/nginx/html/wordpress/.
chown -R www-data:www-data /usr/share/nginx/html/*
chmod -R 755 /usr/share/nginx/html/*
service nginx start
service php7.3-fpm start

# tail -f /var/log/nginx/access.log /var/log/nginx/error.log
