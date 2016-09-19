FROM million12/nginx-php:latest
MAINTAINER Dmitri Pisarev dimaip@gmail.com

ADD container-files /

RUN \
  yum -y install python-pip python-devel openssl-devel && \
  pip install 'ansible>=1.9.0,<2.0.0'
