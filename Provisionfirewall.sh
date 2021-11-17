#!/bin/bash
#Actualización del servidor
sudo -i yum install -y vim

#Activamos el servicio firewall
service firewalld start

#Detenemos el administrador de red
service NetworkManager stop
chkconfig NetworkManager off

#Asignamos puertos a las zonas

firewall-cmd --permanent --zone=dmz --add-interface=eth1
firewall-cmd --permanent --zone=internal --add-interface=eth2
firewall-cmd --reload

#Definimos las reglas

firewall-cmd --direct  --permanent --add-rule ipv4 nat POSTROUTING 0 -o eth1 -j MASQUERADE
firewall-cmd --direct  --permanent --add-rule ipv4 filter FORWARD 0 -i eth2 -o eth1 -j ACCEPT
firewall-cmd --direct  --permanent --add-rule ipv4 filter FORWARD 0 -i eth1 -o eth2 -m state --state RELATED,ESTABLISHED -j ACCEPT

#Adicionamos el servicio http

firewall-cmd --permanent --zone=dmz --add-service=http

#Agregamos el puerto 8080 de forma permanente

sudo firewall-cmd --zone=dmz --add-port=8080/tcp --permanent

#Adicionamos el direccionamiento al ServidorST

firewall-cmd --zone="dmz" --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=192.168.70.4 --permanent
firewall-cmd --zone="internal" --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=192.168.70.4 --permanent
firewall-cmd --permanent --zone=dmz --add-masquerade --permanent
firewall-cmd --reload
