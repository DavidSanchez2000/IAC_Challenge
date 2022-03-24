#!/bin/sh

sudo yum -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd.service 
sudo echo "<html><body><title>Hola soy David Sánchez Arias y esto es mi IaC </title></body></html>" >> /var/www/html/index.html
sudo systemctl restart httpd
