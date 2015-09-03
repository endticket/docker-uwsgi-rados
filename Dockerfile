FROM ubuntu:14.04
MAINTAINER Csergo Balint <bagoly@endticket.com>
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install librados-dev ceph-common curl make gcc
RUN curl http://uwsgi.it/install | bash -s rados /usr/local/bin/uwsgi
EXPOSE 80 8000
CMD ["/usr/local/bin/uwsgi", "--ini", "/etc/uwsgi/rados.ini"]