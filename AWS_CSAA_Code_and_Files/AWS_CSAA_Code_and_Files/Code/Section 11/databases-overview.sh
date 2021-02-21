# Install WordPress on EC2 using RDS MySQL DB

#!/bin/bash
yum update -y
amazon-linux-extras install -y php7.2
yum install -y httpd
systemctl start httpd
systemctl enable httpd
cd /var/www/html
wget https://wordpress.org/latest.tar.gz 
tar -xzf latest.tar.gz
cp -r wordpress/* ./
chmod -R 755 wp-content
chown -R apache:apache wp-content
yum install php-mbstring -y
systemctl restart httpd
systemctl restart php-fpm
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all- languages.tar.gz
mkdir phpMyAdmin && tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C phpMyAdmin --strip-components 1
rm phpMyAdmin-latest-all-languages.tar.gz






#!/bin/bash
sudo apt update -y && sudo apt install -y nginx && sudo apt install -y php-fpm php-mysql
wget https://raw.githubusercontent.com/geekylane/aws-wordpress/master/default.conf
sudo cp default.conf /etc/nginx/sites-available/wordpress
sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/
sudo unlink /etc/nginx/sites-enabled/default
cd /tmp
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
sudo cp -a /tmp/wordpress/. /var/www/html
sudo chown -R www-data:www-data /var/www/html
sudo systemctl restart php7.2-fpm
sudo systemctl reload nginx