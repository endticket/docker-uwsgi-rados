apt-get update
apt-get install -y wget

wget https://download.ceph.com/keys/release.asc -O - | apt-key add -


echo 'deb https://download.ceph.com/debian-jewel xenial main' > /etc/apt/sources.list.d/ceph.list

apt-get update
apt-get -y upgrade
apt-get -y install unzip librados-dev ceph-common curl make gcc
# curl http://uwsgi.it/install | bash -s rados /usr/local/bin/uwsgi


cd /tmp
wget https://github.com/endticket/uwsgi/archive/master.zip -O uwsgi-master.zip
unzip uwsgi-master.zip

cd uwsgi-master
UWSGI_PROFILE=rados UWSGI_BIN_NAME=/usr/local/bin/uwsgi make

