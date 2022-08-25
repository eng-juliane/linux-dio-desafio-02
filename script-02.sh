#!/bin/bash

echo "procurando por atualizações ..."
apt-get update

echo "instalando atualizações ..."
apt-get upgrade -y

echo "instalando o Apache ..."
apt-get install apache2 -y

echo "subindo serviço do apache ..."
systemctl start apache2

echo "colocando o apache para inicializar com o SO"
systemctl enable apache2

echo "instalando o unzip ..."
apt install unzip -y

echo "fazendo o download da aplicacao do git para o diretório /tmp ..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip /tmp

echo "descompactando o arquivo baixado"
unzip /tmp/main.zip

echo "copiando arquivos para a pasta do apache"
cp -R /tmp/linux-site-dio-main/* /var/www/html