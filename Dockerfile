FROM ubuntu:14.04
MAINTAINER Csergo Balint <bagoly@endticket.com>
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install git librados-dev ceph-common curl make gcc
RUN git clone https://github.com/endticket/uwsgi.git && cd uwsgi &&  UWSGI_PROFILE=rados UWSGI_BIN_NAME=/usr/local/bin/uwsgi make
EXPOSE 80 8000
CMD ["/usr/local/bin/uwsgi", "--ini", "/etc/uwsgi/rados.ini"]
