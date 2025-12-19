
#!/bin/bash

# Update package lists and upgrade existing packages
apt-get update -y
apt-get upgrade -y
apt-get install apache2 -y
apt-get install php libapache2-mod-php php-mysql -y
apt-get install wget unzip -y
apt-get install php-curl php-gd php-mbstring php-xml php-xmlrpc -y

# Start Apache service
systemctl start apache2
# Enable Apache to start on boot
systemctl enable apache2

rm -rf /var/www/html/*
cd /tmp
wget https://wordpress.org/latest.zip
unzip latest.zip
mv wordpress/* /var/www/html/
rm -rf wordpress latest.zip

cp wp-config-sample.php /var/www/html/wp-config.php
# Set database connection details
sed -i "s/database_name_here/${db_name}/" /var/www/html/wp-config.php
sed -i "s/username_here/${db_user}/" /var/www/html/wp-config.php
sed -i "s/password_here/${db_password}/" /var/www/html/wp-config.php
sed -i "s/localhost/${db_host}/" /var/www/html/wp-config.php

# Set ownership and permissions for the web server's root directory
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
echo "Startup script completed successfully."
# Restart Apache to ensure all changes take effect
systemctl restart apache2
# Print a message indicating completion
echo "Web server setup is complete. You can access the web page now."