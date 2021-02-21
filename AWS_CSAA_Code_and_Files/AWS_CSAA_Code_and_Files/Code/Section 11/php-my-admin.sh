# Install PHP MyAdmin
yum install php-mbstring -y
systemctl restart httpd
systemctl restart php-fpm
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
mkdir phpMyAdmin && tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C phpMyAdmin --strip-components 1 rm phpMyAdmin-latest-all-languages.tar.gz

# Edit config:
nano config.sample.inc.php

# Add text (enter RDS endpoint):
$cfg['Servers'][$i]['host'] = 'RDS MYSQL ENDPOINT'; $cfg['Servers'][$i]['compress'] = false; $cfg['Servers'][$i]['AllowNoPassword'] = false; $cfg['Servers'][$i]['connect_type'] = 'tcp'; $cfg['Servers'][$i]['extension'] = 'mysqli';

# Copy sample file over live file:
cp config.sample.inc.php config.inc.php
service httpd restart