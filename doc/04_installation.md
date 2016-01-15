# Operational Details

## Installation

In this section, we describe sample setup configuraion of
OpenContrail Global Controller.

### Install OpenContrail Global Controller

```
wget -qO - https://deb.packager.io/key | sudo apt-key add -
echo "deb https://deb.packager.io/gh/Juniper/ukai trusty master" | sudo tee /etc/apt/sources.list.d/ukai.list
sudo apt-get update
sudo apt-get install ukai
```

### Setup Openstack + contrail

You need decide AS number in your setup.

### Sync keystone data

OpenContrail Global Controller requires multi-region
configuraion on KeyStone.

This section describe sample configuraion.

Configure /etc/mysql/my.cnf  & restart mysql

MySQL Master configuration sample

```
[mysqld]
log-bin=mysql-bin
server-id=1
```

```
mysql> CREATE USER 'slave'@'%' IDENTIFIED BY 'secret';
mysql> GRANT REPLICATION SLAVE ON *.* TO 'slave'@'%';
mysql> SHOW Master Statusl
```

Dump master data for keystone.db and copy this file to slaves

```
mysqldump -uroot -p`cat /etc/contrail/mysql.token` keystone > keystone.db
```

Setup MySQL slave

Configure /etc/mysql/my.cnf & restart mysql

```
[mysqld]
server-id=2
max_connections = 10000
replicate-do-db=keystone
```

```
mysql>  CHANGE MASTER TO MASTER_HOST='192.168.0.6', MASTER_USER='slave', MASTER_PASSWORD='secret', MASTER_LOG_FILE='mysql-bin.000002', MASTER_LOG_POS=1507;
Query OK, 0 rows affected (0.01 sec)
```

Import initial data

```
mysql -uroot -p`cat /etc/contrail/mysql.token` keystone –e “drop database keystone”
mysql -uroot -p`cat /etc/contrail/mysql.token` keystone < keystone.db
```

Start slave mode

```
mysql -uroot -p`cat /etc/contrail/mysql.token` keystone –e “start slave”
```

### Setup fernet token

setup master keystone

```
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
```

configure conf

/etc/keystone/keystone.conf

```
provider = fernet
```

Restart keystone


setup on keystone slave & add same provider configuraion.

Copy master’s /etc/keystone/fernet-keys
Restart keystone

# Setup keystone endpoints

You can configure keystone endpoint from OpenStack client.

## Configure keystone in /etc/ukai/gohan.yaml

``` yaml
# keystone configuration
keystone:
    use_keystone: true
    fake: false
    auth_url: "http://10.84.34.96:35357/v2.0"
    user_name: "admin"
    tenant_name: "admin"
    password: "secret123"
```

### Setup BGP peering configuraion between contrail clusters

You can do it from contrail webui.

### Start ukai

```
service ukai start
```

## Initial configuraion

### Create following ID pools

From WebUI, you can add ID pool resource

- route_target
- virtual_network_id   Note that this ID should start from 600000
- security_group_id

### Create location resource

You need create location for each location