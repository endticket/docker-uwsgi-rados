
export DEBIAN_FRONTEND=noninteractive

apt-get                            update
apt-get -y --no-install-recommends install wget

wget --no-check-certificate https://download.ceph.com/keys/release.asc -O - | apt-key add -


echo 'deb https://download.ceph.com/debian-jewel xenial main' > /etc/apt/sources.list.d/ceph.list

apt-get                            update
apt-get -y                         upgrade
apt-get -y --no-install-recommends install unzip librados2 librados-dev ceph-common curl make gcc
# curl http://uwsgi.it/install | bash -s rados /usr/local/bin/uwsgi


cd /tmp
wget https://github.com/endticket/uwsgi/archive/master.zip -O uwsgi-master.zip
unzip uwsgi-master.zip

cd uwsgi-master
UWSGI_PROFILE=rados UWSGI_BIN_NAME=/usr/local/bin/uwsgi make


apt-get -y purge librados-dev make gcc unzip
apt-get -y autoremove

rm -rf /var/lib/apt/lists/*
cd /
rm -rf /tmp/uwsgi-master
