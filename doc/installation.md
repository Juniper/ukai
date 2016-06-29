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

Configure /etc/mysql/my.cnf

MySQL Master configuration sample

```
[mysqld]
log-bin=mysql-bin
server-id=1
```

Restart mysql

```
mysql> CREATE USER 'slave'@'%' IDENTIFIED BY 'secret';
mysql> GRANT REPLICATION SLAVE ON *.* TO 'slave’@’$SLAVE_IP';
mysql> SHOW Master Status;
```

Copy master status output.

Dump master data for keystone.db

```
mysqldump -uroot -p`cat /etc/contrail/mysql.token` keystone > keystone.db
```

Setup MySQL slave

Configure /etc/mysql/my.cnf
Assign server id greater than 1

```
[mysqld]
server-id=2
max_connections = 10000
replicate-do-db=keystone
```

Restart mysql

Configure repliaction
MASTER_LOG_FILE and MASTER_LOG_POS should be values we confirmed in master mysql.

```
mysql>  CHANGE MASTER TO MASTER_HOST='$MASTER_IP', MASTER_USER='slave', MASTER_PASSWORD='secret', MASTER_LOG_FILE='mysql-bin.000002', MASTER_LOG_POS=$MYSQL_LOG_POS;
Query OK, 0 rows affected (0.01 sec)
mysql > drop database keystone;
mysql > create database keystone;
```

Import initial data

Copy keystone.db from master server

```
mysql -uroot -p`cat /etc/contrail/mysql.token` keystone < keystone.db
```

Start slave mode

```
mysql -uroot -p`cat /etc/contrail/mysql.token` keystone –e "start slave"
```

Check replication status.

```
mysql>  show slave status;
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

Copy master’s /etc/keystone/fernet-keys to slave
Note that user & group of fernet-keys should be keystone

Restart keystone


# Setup keystone endpoints

You can configure keystone endpoint from OpenStack client on master node.
You can use this simple oneliner. (please replace REGION_NAME, MASTER_IP and SLAVE_IP.

```
keystone endpoint-list | awk '/RegionOne/{print "keystone endpoint-create --publicurl  '\''" $6 "'\'' \
   --internalurl '\''"$8"'\'' --adminurl '\''"$10"'\'' \
   --service-id "$12 " --region $REGION_NAME"}' | sed 's/$MASTER_IP/$SLAVE_IP/g' \ | bash
```


## Configure keystone in /etc/ukai/gohan.yaml


Setup Gohan db in mysql

```
CREATE USER 'gohan'@'localhost' IDENTIFIED BY 'gohan';
CREATE DATABASE gohan;
GRANT ALL PRIVILEGES ON gohan.* TO 'gohan'@'localhost';
```

update gohan config

``` yaml
# keystone configuration
keystone:
    use_keystone: true
    fake: false
    auth_url: "http://$MASTER_IP:35357/v2.0"
    user_name: "admin"
    tenant_name: "admin"
    password: "secret123"

webui_config:
    # if true, gohan generates webui config.json
    enabled: true
    # you need to set keystone auth url for users
    # auth_url: "http://localhost:9091/v2
    tls: false
    auth_url: "http://$MASTER_IP:5000/v2.0"
```

update webui config also

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