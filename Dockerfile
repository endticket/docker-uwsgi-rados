FROM ubuntu:16.04
MAINTAINER Pas <pas@endticket.com>
ADD setup.sh /setup.sh
RUN bash -x /setup.sh
EXPOSE 80 8000
CMD ["/usr/local/bin/uwsgi", "--ini", "/etc/uwsgi/rados.ini"]

