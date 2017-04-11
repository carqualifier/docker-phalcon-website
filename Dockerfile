FROM carqualifier/docker-nginx-php:php70
MAINTAINER Faruk Brbovic <fbrbovic@carqualifier.com>, Eidher Escalona <eescalona@carqualifier.com>

ADD ./container-files/aerospike-client-php-3.3.15.tar.gz /tmp/
ADD ./container-files/aerospike.ini /etc/php.d/20-aerospike.ini

