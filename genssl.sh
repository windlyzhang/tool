# !/bin/sh

curdir=`pwd`
cadir=$curdir/ca
certdir=$curdir/cert

mkdir -p $cadir
mkdir -p $certdir

echo -e "\e[1;31m BEGIN GEN ca key&cert .....\e[0m"
openssl genrsa -out $cadir/ca.key 2048
openssl req -new -x509 -days 3650 -key $cadir/ca.key -out $cadir/ca.pem -sha256 -subj '/C=CN/ST=BJ/L=BJ/O=org/OU=security/CN=*.windly.com'
echo -e "\e[1;32m END GEN ca key&cert\e[0m\n\n"

echo -e "\e[1;31m BEGIN GEN your cert .....\e[0m"
openssl genrsa -out $certdir/server.key 2048
openssl req -new -days 3650 -key $certdir/server.key -out $certdir/server.csr -sha256
#openssl req -new -days 3650 -key $certdir/server.key -out $certdir/server.csr -sha256 -subj '/C=CN/ST=BJ/L=BJ/O=org/OU=security/CN=*.newsite.com'
echo -e "\e[1;32m END GEN your cert\e[0m\n\n"

echo -e "\e[1;31m BEGIN signature your cert .....\e[0m"
openssl x509 -req -days 3650 -CAcreateserial -CA $cadir/ca.pem -CAkey $cadir/ca.key -in $certdir/server.csr -out $certdir/server.crt
echo -e "\e[1;32m BEGIN signature your cert\e[0m\n\n"

echo -e "\e[1;31m Please copy your cert to your webserver config dir\e[0m"
ls $certdir/
echo -e "\n\n\n"
