#!/bin/sh

sudo yum -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd.service 
sudo echo "<html><body>Hola soy David Sánchez Arias y esto es mi IaC </body></html>" >> /var/www/html/index.html
sudo systemctl restart httpd 
