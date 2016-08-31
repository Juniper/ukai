# Installation

In this section, we describe sample setup configuration of
OpenContrail Global Controller.

## Setup Multi Region Openstack with OpenContrail

You need to setup multi-region OpenStack with OpenContrail.
Note that OpenContrail controllers should peer each other.

## [Optional] Setup Keystone in the multi region

In OpenStack, Keystone manages authentication and endpoint management for each region.
Keystone can be either centralized or distributed.
In this section, we describe how to setup keystone in distributed manner.

In this example, we have Region1 and Region2. We will use MySQL server in Region1 as master, and MySQL server in Region2 as a slave. You can use local keystone in each region for authentication. You need to go master Keystone in a case of you need to change tenants or user information.

### Configure MySQL master

Step1: Login to the MySQL in Region1
Step2: Configure /etc/mysql/my.cnf

MySQL Master configuration sample

```
[mysqld]
log-bin=mysql-bin
server-id=1
```

Step3: Restart MySQL server

```
service MySQL restart
```

Step4: Create slave users for each slave

```
mysql> CREATE USER 'slave'@'$SLAVE_IP' IDENTIFIED BY 'secret';
mysql> GRANT REPLICATION SLAVE ON *.* TO 'slave’@’$SLAVE_IP';
mysql> SHOW Master Status;
```

Note that we need MYSQL_LOG_POS and MASTER_LOG_FILE value later.

Step5: Dump master data for keystone.db

```
mysqldump -uroot -p`cat /etc/contrail/mysql.token` keystone > keystone.db
```

### Configure MySQL slave

Step1: Login to MySQL server in Region2

Step2: Configure /etc/mysql/my.cnf

Note that server-id should be unique.

```
[mysqld]
server-id=2
replicate-do-db=keystone
replicate-ignore-table=keystone.revocation_event
```

Step3: Restart MySQL

```
service mysql restart
```

Step:4 Configure replication

MASTER_LOG_FILE and MASTER_LOG_POS should be values we confirmed in master MySQL.

```
mysql>  CHANGE MASTER TO MASTER_HOST='$MASTER_IP', MASTER_USER='slave', MASTER_PASSWORD='secret', MASTER_LOG_FILE='mysql-bin.000002', MASTER_LOG_POS=$MYSQL_LOG_POS;
Query OK, 0 rows affected (0.01 sec)
mysql > drop database keystone;
mysql > create database keystone;
```

Step5: Import initial data

Copy keystone.db from MySQL master and apply.

```
mysql -uroot -p`cat /etc/contrail/mysql.token` keystone < keystone.db
```

Step6: Start slave mode

```
mysql -uroot -p`cat /etc/contrail/mysql.token` keystone –e "start slave"
```

Check replication status.

```
mysql>  show slave status;
```

## Setup Fernet token

We will use Keystone in Region1 as master, and Region2 as a slave.

### Setup master Keystone

Step1: Setup Keystone in Region1.

```
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
```

Step2: Configure Fernet provider & revoke provider

/etc/keystone/keystone.conf

```
[token]
provider = fernet

```

Step3: Restart keystone

```
service keystone restart
```

### Setup slave keystone

Step1: Copy master’s /etc/keystone/fernet-keys to slave.


Step2: Make sure permission

```
chown -R keystone.keystone fernet-keys
```

Step3: Configure Fernet provider

/etc/keystone/keystone.conf

```
provider = fernet
```

Step4: Restart keystone

```
service keystone restart
```


## Setup keystone endpoints

You can configure keystone endpoint from OpenStack client on the master node.
You can use this simple one-liner. (Please replace REGION_NAME, MASTER_IP and SLAVE_IP).

```
keystone endpoint-list | awk '/RegionOne/{print "keystone endpoint-create --publicurl  '\''" $6 "'\'' \
   --internalurl '\''"$8"'\'' --adminurl '\''"$10"'\'' \
   --service-id "$12 " --region $REGION_NAME"}' | sed 's/$MASTER_IP/$SLAVE_IP/g'| bash
```

## [Optional] Setup CORS

In order to use webui for global controller,
you need to setup CORS on the master keystone.


Step1:

add CORS configuration on the /etc/keystone/keystone.conf

NOTE that this is a TEST configuration. You need put proper
allowed_origin on production.

```
[cors]

#
# From oslo.middleware
#

# Indicate whether this resource may be shared with the domain received in the
# requests "origin" header. (list value)
allowed_origin = *

# Indicate that the actual request can include user credentials (boolean value)
#allow_credentials = true

# Indicate which headers are safe to expose to the API. Defaults to HTTP Simple
# Headers. (list value)
expose_headers = X-Auth-Token,X-Openstack-Request-Id,X-Subject-Token

# Maximum cache age of CORS preflight requests. (integer value)
max_age = 3600

# Indicate which methods can be used during the actual request. (list value)
allow_methods = GET,PUT,POST,DELETE,PATCH

# Indicate which header field names may be used during the actual request.
# (list value)
allow_headers = X-Auth-Token,X-Openstack-Request-Id,X-Subject-Token,X-Project-Id,X-Project-Name,X-Project-Domain-Id,X-Project-Domain-Name,X-Domain-Id,X-Domain-Name

```

Step4: Restart Keystone

```
service keystone restart
```

## Specify region_name for service monitor

Add region_name for /etc/contrail/contrail-svc-monitor.conf

```
[DEFAULTS]
ifmap_server_ip=5.5.5.24
ifmap_server_port=8443
ifmap_username=svc-monitor
ifmap_password=svc-monitor
api_server_ip=5.5.5.24
api_server_port=8082
api_server_use_ssl=False
zk_server_ip=5.5.5.24:2181
log_file=/var/log/contrail/contrail-svc-monitor.log
cassandra_server_list=5.5.5.24:9160
disc_server_ip=5.5.5.24
disc_server_port=5998
region_name=RegionTwo  # <-- specify region_name
log_local=1
log_level=SYS_NOTICE
rabbit_server=5.5.5.24:5672
```

then restart contrail-svc-monitor

```
service contrail-svc-monitor restart
```

## Install OpenContrail Global Controller

```
wget -qO - https://deb.packager.io/key | sudo apt-key add -
echo "deb https://deb.packager.io/gh/Juniper/ukai trusty master" | sudo tee /etc/apt/sources.list.d/ukai.list
sudo apt-get update
sudo apt-get install ukai
```

### Configure keystone in /etc/ukai/gohan.yaml

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

### Start ukai

```
service ukai start
```

## Initial configuration

### Create following ID pools

You need create three ID pools using WebUI

- id_pool1:

    name: route_target
    start: 1000
    end:   20000

- id_pool2:

    name: virtual_network_id
    start: 600000
    end:   650000

- id_pool3

    name: security_group
    start: 1000
    end:   2000

## Create location resource

You need to create location for each location