# Operational Detail

## Command Line Client

ukai package will also include CLI client so that 
you can manipulate global controller resources.

You need set following env vars.

```
export GOHAN_ENDPOINT_URL=http://$GOHAN_HOST:9500
export OS_USERNAME=admin
export OS_PASSWORD=$PASSWORD
export GOHAN_SCHEMA_URL=/gohan/v0.1/schemas
export OS_TENANT_NAME=admin
export OS_AUTH_URL="http://$KEYSTONE_HOST:5000/v2.0"
```

```
root@a3s40:~# ukai client
gohan client namespace # Gohan Namespace
gohan client event # Gohan Event Log
gohan client extension # Gohan Extension
gohan client policy # Gohan Policy
gohan client schema # Gohan Schema
gohan client location # Location
gohan client heat_template # Heat Template
gohan client heat_instance # Heat Instance
gohan client local_heat_instance # Local Heat Instance
gohan client image # Image
gohan client flavor # Flavor
gohan client service_template # Service Template
gohan client service_instance # Service Instance
gohan client local_service_instance # Local Service Instance
gohan client local_service_template # Local Service Template
gohan client security_group # Security Group
gohan client security_group_rule # Security Group Rules
gohan client local_security_group # Local Security Group
gohan client network # Network
gohan client network_policy # Network Policy
gohan client local_network_policy # Local Network Policy
gohan client server # Server
gohan client local_server # Local Server
gohan client local_flavor # Local flavor
gohan client local_image # Local Image
gohan client local_network # Local Network
gohan client id_pool # ID Pool
gohan client route_target_association # Route Target Association

root@a3s40:~# ukai client network

  Network
  -----------------------------------
  Description: Network

  Properties:
   - id [ string ]: ID ID
   - name [ string ]: Name Name
   - tenant_id [ string ]: Tenant ID Tenant ID
   - description [ string ]: Description Description
   - contrail_id [ integer ]: Contrail ID Virtual Network ID used in contrail
   - cidr [ string ]: Cidr cidr
   - local_prefix_len [ integer ]: Local Prefix Length Prefix length for each local network


  Commands:

  - List all Network resources

    gohan client network list

  - Show a Network resources

    gohan client network show [ID]

  - Create a Network resources

    gohan client network create \
      --id [ string ] \
      --name [ string ] \
      --tenant_id [ string ] \
      --description [ string ] \
      --cidr [ string ] \
      --local_prefix_len [ integer ] \


  - Update Network resources

    gohan client network set \
      --description [string ] \
       [ID]

  - Delete Network resources

  gohan client network delete [ID]

root@a3s40:~# ukai client network list
+-------------+-------------+-------------+--------------------------------------+------------------+------+----------------------------------+
|    CIDR     | CONTRAIL ID | DESCRIPTION |                  ID                  | LOCAL PREFIX LEN | NAME |            TENANT ID             |
+-------------+-------------+-------------+--------------------------------------+------------------+------+----------------------------------+
| 10.0.0.0/20 |        1014 |             | 757d98c9-3f1b-48c0-abeb-83f0c09f9660 | 24               | blue | 43f9bcbbcfe642c1bc682e04e5db1538 |
| 20.0.0.0/20 |        1017 |             | f3fe041b-739d-499c-9bfe-4074a0d51dc2 | 24               | red  | 43f9bcbbcfe642c1bc682e04e5db1538 |
+-------------+-------------+-------------+--------------------------------------+------------------+------+----------------------------------+
````


## Hot reload

OpenContrail Global Controller support hot reload.
In order to hot reload, send HUP signal for OpenContrail Global Controller process.

## Southbound resource creation failure

Southbound resource creatation may fail for various reasons.
OpenContrail Global Controller is designed for try recovering from error status
using update request for the resource.

## Configuraion

Configuraion is stored in this location by default

/etc/ukai/gohan.conf

You can configure various option such as HTTPS, Logging, CORS.
For more detail please take a look [Gohan configuraion guide](http://gohan.cloudwan.io/gohan/config.html)

## Customize API Call

OpenContrail Global Controller uses Gohan framework. so it is pretty easy to
customize API and workfare.

- Schema: schemes are stored in schema directory
- Work-flow logic are stored in extensions directory

For more information please take look [Gohan document](http://gohan.cloudwan.io/gohan/)