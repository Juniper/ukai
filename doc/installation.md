# Installation

In this section, we describe sample setup configuration of
OpenContrail Global Controller.

## Setup Multi Region Openstack with OpenContrail

You need to setup multi-region OpenStack with OpenContrail.
Note that OpenContrail controllers should be peered each other.

## [Optional] Setup Keystone in the multi region

In OpenStack, Keystone manages authentication and endpoint management for each region.
Keystone can be either centralized or distributed. 
In this section, we describe how to setup keystone in distributed manner. 

In this example, we have Region1 and Region2. We will use MySQL server in Region1 as master, and MySQL server in Region2 as slave. You can use local keystone in each region for authentication. You need to go master keystone in case of you need to change tenants or user information.

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
service mysql restart
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
```

Step3: Restart MySQL

```
service mysql restart
```

Step:4 Configure replication

MASTER_LOG_FILE and MASTER_LOG_POS should be values we confirmed in master mysql.

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

We will use Keystone in Region1 as master, and Region2 as slave.

### Setup master keystone

Step1: Setup Keystone in Region1.

```
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
```

Step2: Configure Fernet provider & revoke provider

/etc/keystone/keystone.conf

```
[token]
provider = fernet

[revoke]
driver = kvs
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

You can configure keystone endpoint from OpenStack client on master node.
You can use this simple oneliner. (Please replace REGION_NAME, MASTER_IP and SLAVE_IP).

```
keystone endpoint-list | awk '/RegionOne/{print "keystone endpoint-create --publicurl  '\''" $6 "'\'' \
   --internalurl '\''"$8"'\'' --adminurl '\''"$10"'\'' \
   --service-id "$12 " --region $REGION_NAME"}' | sed 's/$MASTER_IP/$SLAVE_IP/g'| bash
```

## [Optional] Setup CORS

In order to use webui for global controller, 
you need to setup CORS on the master keystone.

Step1: install wsgicors module

```
pip install wsgicors
```

Step2: Add cors filter to /etc/keystone/keystone-paste.ini

```
[filter:cors]
use = egg:wsgicors#middleware
policy = open
open_origin = *
open_headers = *
open_methods = *
open_maxage = 86400
```

Step3: Modify existing pipelines to add cors filter

```
[pipeline:public_api]
pipeline = cors stats_monitoring sizelimit url_normalize build_auth_context token_auth admin_token_auth xml_body_v2 json_body ec2_extension user_crud_extension public_service

[pipeline:admin_api]
pipeline = cors sizelimit url_normalize build_auth_context token_auth admin_token_auth xml_body_v2 json_body ec2_extension s3_extension crud_extension admin_service

[pipeline:api_v3]
pipeline = cors stats_reporting sizelimit url_normalize build_auth_context token_auth admin_token_auth xml_body_v3 json_body ec2_extension_v3 s3_extension simple_cert_extension revoke_extension service_v3

[pipeline:public_version_api]
pipeline = cors sizelimit url_normalize xml_body public_version_service

[pipeline:admin_version_api]
pipeline = cors sizelimit url_normalize xml_body admin_version_service
```

Step4: Restart Keystone

```
service keystone restart
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

From WebUI, you can add ID pool resource

- route_target
- virtual_network_id   Note that this ID should start from 600000
- security_group_id

## Create location resource

You need create location for each location