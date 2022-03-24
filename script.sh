#!/bin/sh

sudo yum -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd.service 
sudo echo "<html><body> Holas soy David Arias y esto es mi IaC </body></html>"
sudo systemctl restart httpd
