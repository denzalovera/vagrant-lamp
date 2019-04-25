# update package and install Apache2
apt-get update
apt-get install -y Apache2

# install git
apt-get install -y git

# Enable Apache Mods
a2enmod rewrite

# Add Ondrej PPA Repo
apt-add-repository ppa:ondrej/php
apt-get update

# Install PHP
apt-get install -y php7.2

# PHP Apache Mod
apt-get install -y libapache2-mod-php7.2

# restart Apache2
service apache2 restart

# PHP Mods
apt-get install -y php7.2-common
apt-get install -y php7.2-mcrypt
apt-get install -y php7.2-zip

# Set MySQL User and Pass
debconf-set-selection <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selection <<< 'mysql-server mysql-server/root_password_again password root'

# Install MySQL
apt-get install -y mysql-server

# PHP-MYSQL lib
apt-get install -y php7.2-mysql

# Restart Apache
sudo service apache2 restart

# replace Apache2 index with index.php (for testing PHP)
mv index.html index.html.temp 
