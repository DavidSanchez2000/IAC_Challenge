#!/bin/sh

sudo yum -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd.service 
sudo echo "
<html>
   <head>
      <title>IAC Challenge </title>
   </head>
   <body style="background-color:grey;">
      <h1>Products</h1>
      <p>Hola soy David Sanchez Arias y esto es mi IaC.</p>
   </body>
</html>"
>> /var/www/html/index.html
sudo systemctl restart httpd
