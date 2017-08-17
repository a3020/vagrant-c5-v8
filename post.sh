#!/usr/bin/env bash

cd /vagrant
mkdir public

echo "## Install utilities"
apt-get -y install unzip

echo "## Download latest concrete5 release"
wget -q -O concrete5.base.zip http://www.concrete5.org/latest.zip

echo "## Unpack concrete5 ZIP"
su vagrant -c 'unzip -q concrete5.base.zip'

mv concrete5-*/* public
rm -rf concrete5-*/*
rm concrete5.base.zip
rmdir concrete5-*
cd public

echo "## Install concrete5"
chmod +x concrete/bin/concrete5
concrete/bin/concrete5 c5:install --db-server=localhost --db-username=root --db-password=root --db-database=c5 \
	--admin-email=admin@example.com --admin-password=admin \
	--starting-point=elemental_blank

echo "## Done"
