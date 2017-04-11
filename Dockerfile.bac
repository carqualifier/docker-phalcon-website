FROM carqualifier/docker-nginx-php:php70
MAINTAINER Faruk Brbovic <fbrbovic@carqualifier.com>, Eidher Escalona <eescalona@carqualifier.com>

ADD ./container-files/aerospike-client-php-3.3.15.tar.gz /tmp/
ADD ./container-files/aerospike.ini /etc/php.d/20-aerospike.ini

RUN  yum install -y  @development  openssl-devel  lua-devel
RUN  yum clean all
RUN  cd /tmp/aerospike-client-php-3.3.15/src/aerospike && ./build.sh && make install
RUN  chmod 644 /etc/php.d/20-aerospike.ini
RUN  yes '' | pecl install -f mongo && \ 
     echo "extension=mongo.so" >> /etc/php.ini
RUN  git clone --depth=1 git://github.com/phalcon/cphalcon.git && \
     cd cphalcon/build && ./install && \
     echo "extension=phalcon.so" >> /etc/php.d/50-phalcon.ini
