#!/usr/bin/env bash

if ! [[ "18.04 20.04 22.04 23.04" == *"$(lsb_release -rs)"* ]];
then
    echo "Ubuntu $(lsb_release -rs) is not currently supported.";
    exit;
fi

wget -O /etc/apt/trusted.gpg.d/microsoft.asc https://packages.microsoft.com/keys/microsoft.asc
wget -O /etc/apt/sources.list.d/mssql-release.list https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list

apt-get update
ACCEPT_EULA=Y apt-get install -y msodbcsql18 unixodbc-dev

# optional: for bcp and sqlcmd
if [ "$1" == "--install-tools" ];
then
    ACCEPT_EULA=Y apt-get install -y mssql-tools18
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
fi
