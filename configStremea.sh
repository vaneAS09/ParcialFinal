#!/bin/bash

#Instalamos wget
sudo -i yum install wget -y

#Descargamos Java

sudo yum install openjdk-8-jre

#Se crea la carpeta de alojamiento

mkdir /home/user/streama

#Descargamo Streama

wget https://github.com/streamaserver/streama/releases/download/v1.6.1/streama-1.6.1.war

chmod +x streama-1.6.1.war

java -jar streama-1.6.1.war

#Iniciar streama
sudo service streama start
#Instalar httpd
sudo yum -y install httpd mod_ssl
#Iniciar httpd
systemctl start httpd

