ceph-uwsgi-docker
A container running Uwsgi with rados plugin built to serve files from ceph

#USAGE
Please keep in mind, that this is NOT a container, you can run on its own, but you can use it as base for your own container. You just have to mount your rados settings to /etc/ceph, and place your uwsgi ini file under /etc/uwsgi/rados.ini

#Maintainers
deathowl <bagoly@endticket.com>

Made with Love at Endticket.