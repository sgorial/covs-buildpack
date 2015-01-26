#!/bin/bash

# Clean up
rm -rf /app/sw
mkdir /app/sw

cd /tmp

echo '---> Fetching Apache2'
wget --progress=dot:mega http://mirror.metrocast.net/apache/httpd/httpd-2.2.21.tar.gz

echo '---> Building Apache2'
tar -zxvf httpd-2.2.21.tar.gz
cd httpd-2.2.21
./configure --prefix=/app/httpd --enable-rewrite
make
make install

echo '---> Bundling httpd'
cd /app
tar -zcvf /vagrant/httpd_2.2.21-mod_perl_2.0.5.tar.gz httpd

echo '---> DONE'
