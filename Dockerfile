FROM million12/nginx-php:latest
MAINTAINER Dmitri Pisarev dimaip@gmail.com

ADD container-files /

RUN \
  yum -y install python-pip python-devel && \
  pip install ansible
