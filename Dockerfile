FROM carqualifier/docker-nginx-php:php56
MAINTAINER Faruk Brbovic <fbrbovic@carqualifier.com>

ADD ./container-files/aerospike-client-php-3.3.15.tar.gz /tmp/
ADD ./container-files/aerospike.ini /etc/php.d/20-aerospike.ini

RUN \
  rpm --rebuilddb && yum update -y && \

  yum install -y \
	php-common \
  	php-xml \
  	php-pear \
  	php-mysqlnd \
  	php-devel \
  	php-soap \
  	php-pecl-igbinary \
  	php-pecl-jsonc \
  	php-pecl-jsonc-devel \
  	php-pecl-zip \
  	php-phalcon2 \
  	php-process \
    @development \
    openssl-devel \
    lua-devel && \
  yum clean all && \
  cd /tmp/aerospike-client-php-3.3.15/src/aerospike && \
  ./build.sh && \
  make install && \
  chmod 644 /etc/php.d/20-aerospike.ini && \
  yes '' | pecl install -f mongo && \
  echo "extension=mongo.so" >> /etc/php.ini
