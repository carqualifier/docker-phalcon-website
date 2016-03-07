FROM carqualifier/docker-nginx-php:php56
MAINTAINER Faruk Brbovic <fbrbovic@carqualifier.com>

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
  	php-process && \
  yum clean all

EXPOSE 80
EXPOSE 443
