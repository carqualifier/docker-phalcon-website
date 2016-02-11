FROM carqualifier/docker-nginx-php:php56
MAINTAINER Faruk Brbovic <fbrbovic@carqualifier.com>

RUN \
  rpm --rebuilddb && yum update -y && \