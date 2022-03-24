#!/bin/sh

sudo yum -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd.service 
sudo echo "<html><body><tittle>Hola soy David Sánchez Arias y esto es mi IaC </tittle></body></html>" >> /var/www/html/index.html
sudo systemctl restart httpd
