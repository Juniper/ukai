Common
=========

HTTP Header

X-Auth-Token:  keystone Token

Common HTTP Status

| Code | Status | Description |
|------|--------|-------------|
| 401  | Unauthorized | Authentication required or you don't have permission to perform action for a resource |
| 404  | Not Found |  Resource Not Found |
| 500  | Internal Server Error | Server Side issue occurred.. Please contact administrator |

- Not Found: 404  Resource Not Found
- Internal Server Error: 500  Server Side issue occurred.. Please contact administrator


Location
============================

Description: Location represents each datacenters

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| keystone_endpoint | Keystone endpoint | Keystone endpoint | string |  | uri |  |
| contrail_endpoint | Contrail endpoint | Contrail endpoint | string |  | uri |  |
| webui | Webui | WebUI link | string |  | uri |  |
| contrail_webui | Contrail Webui | Contrail WebUI link | string |  | uri |  |
| region | Region | Region | string |  |  |  |
| address | Endpoint address | Endpoint address | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/locations

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "locations": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "keystone_endpoint": $keystone_endpoint,
        "contrail_endpoint": $contrail_endpoint,
        "webui": $webui,
        "contrail_webui": $contrail_webui,
        "region": $region,
        "address": $address
      }
    ]
  }

```

Show API
-----------

GET /v1.0/locations/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "location": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "keystone_endpoint": $keystone_endpoint,
        "contrail_endpoint": $contrail_endpoint,
        "webui": $webui,
        "contrail_webui": $contrail_webui,
        "region": $region,
        "address": $address
    }
  }
```

POST API
-----------

POST /v1.0/locations

Sample Request

``` json

  {
    "location": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "keystone_endpoint": $keystone_endpoint,
        "contrail_endpoint": $contrail_endpoint,
        "webui": $webui,
        "contrail_webui": $contrail_webui,
        "region": $region,
        "address": $address
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "location": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "keystone_endpoint": $keystone_endpoint,
        "contrail_endpoint": $contrail_endpoint,
        "webui": $webui,
        "contrail_webui": $contrail_webui,
        "region": $region,
        "address": $address
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/locations/:id

Sample Request

``` json

  {
    "location": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "keystone_endpoint": $keystone_endpoint,
        "contrail_endpoint": $contrail_endpoint,
        "webui": $webui,
        "contrail_webui": $contrail_webui,
        "region": $region,
        "address": $address
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "location": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "keystone_endpoint": $keystone_endpoint,
        "contrail_endpoint": $contrail_endpoint,
        "webui": $webui,
        "contrail_webui": $contrail_webui,
        "region": $region,
        "address": $address
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/locations/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Heat Template
============================

Description: Global Heat Template.

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| template | Heat Template | Heat Template | string |  | yaml |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/heat_templates

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "heat_templates": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "template": $template
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/heat_templates/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "heat_template": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "template": $template
    }
  }
```

POST API
-----------

POST /v1.0/tenant/heat_templates

Sample Request

``` json

  {
    "heat_template": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "template": $template
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "heat_template": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "template": $template
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/heat_templates/:id

Sample Request

``` json

  {
    "heat_template": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "template": $template
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "heat_template": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "template": $template
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/heat_templates/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Heat Instance
============================

Description: Global Heat Instance.

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| heat_template_id | Heat Template | Heat Template | string |  |  |  |
| parameters | Parameters | Parameters | object |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/heat_instances

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "heat_instances": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_template_id": $heat_template_id,
        "parameters": $parameters
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/heat_instances/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "heat_instance": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_template_id": $heat_template_id,
        "parameters": $parameters
    }
  }
```

POST API
-----------

POST /v1.0/tenant/heat_instances

Sample Request

``` json

  {
    "heat_instance": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_template_id": $heat_template_id,
        "parameters": $parameters
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "heat_instance": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_template_id": $heat_template_id,
        "parameters": $parameters
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/heat_instances/:id

Sample Request

``` json

  {
    "heat_instance": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_template_id": $heat_template_id,
        "parameters": $parameters
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "heat_instance": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_template_id": $heat_template_id,
        "parameters": $parameters
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/heat_instances/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Local Heat Instance
============================

Description: Local heat instance on each location status

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| location_id | Location ID | Location ID | string |  |  |  |
| status | Status | status | string |  |  |  |
| output | Output | Output | object |  | yaml |  |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| heat_instance_id | Heat Instance ID | Heat Instance | string |  |  |  |
| task_status | Status | status | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/local_heat_instances

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "local_heat_instances": [
      {

        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_instance_id": $heat_instance_id,
        "task_status": $task_status
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/local_heat_instances/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_heat_instance": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_instance_id": $heat_instance_id,
        "task_status": $task_status
    }
  }
```

POST API
-----------

POST /v1.0/tenant/local_heat_instances

Sample Request

``` json

  {
    "local_heat_instance": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_instance_id": $heat_instance_id,
        "task_status": $task_status
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "local_heat_instance": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_instance_id": $heat_instance_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/local_heat_instances/:id

Sample Request

``` json

  {
    "local_heat_instance": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_instance_id": $heat_instance_id,
        "task_status": $task_status
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_heat_instance": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "heat_instance_id": $heat_instance_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/local_heat_instances/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Image
============================

Description: OpenStack Glance image

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| url | URL | URL | string |  | uri |  |
| disk_format | Disk format | Disk format | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/images

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "images": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "url": $url,
        "disk_format": $disk_format
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/images/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "image": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "url": $url,
        "disk_format": $disk_format
    }
  }
```

POST API
-----------

POST /v1.0/tenant/images

Sample Request

``` json

  {
    "image": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "url": $url,
        "disk_format": $disk_format
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "image": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "url": $url,
        "disk_format": $disk_format
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/images/:id

Sample Request

``` json

  {
    "image": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "url": $url,
        "disk_format": $disk_format
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "image": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "url": $url,
        "disk_format": $disk_format
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/images/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Flavor
============================

Description: OpenStack Flavor

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| ram | RAM(mb) | RAN(mb) | integer |  |  |  |
| vcpus | VCPUs | VCPUs | integer |  |  |  |
| disk | Disk(GB) | ram | integer |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/flavors

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "flavors": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "ram": $ram,
        "vcpus": $vcpus,
        "disk": $disk
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/flavors/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "flavor": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "ram": $ram,
        "vcpus": $vcpus,
        "disk": $disk
    }
  }
```

POST API
-----------

POST /v1.0/tenant/flavors

Sample Request

``` json

  {
    "flavor": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "ram": $ram,
        "vcpus": $vcpus,
        "disk": $disk
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "flavor": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "ram": $ram,
        "vcpus": $vcpus,
        "disk": $disk
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/flavors/:id

Sample Request

``` json

  {
    "flavor": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "ram": $ram,
        "vcpus": $vcpus,
        "disk": $disk
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "flavor": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "ram": $ram,
        "vcpus": $vcpus,
        "disk": $disk
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/flavors/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Service Template
============================

Description: Global service template configuraion

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| image_id | ImageID | ImageID | string |  |  |  |
| service_mode | Service Mode | Service Mode | string |  |  |  |
| flavor_id | Flavor ID | flavor_id | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/service_templates

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "service_templates": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "service_mode": $service_mode,
        "flavor_id": $flavor_id
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/service_templates/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "service_template": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "service_mode": $service_mode,
        "flavor_id": $flavor_id
    }
  }
```

POST API
-----------

POST /v1.0/tenant/service_templates

Sample Request

``` json

  {
    "service_template": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "service_mode": $service_mode,
        "flavor_id": $flavor_id
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "service_template": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "service_mode": $service_mode,
        "flavor_id": $flavor_id
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/service_templates/:id

Sample Request

``` json

  {
    "service_template": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "service_mode": $service_mode,
        "flavor_id": $flavor_id
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "service_template": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "service_mode": $service_mode,
        "flavor_id": $flavor_id
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/service_templates/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Service Instance
============================

Description: Global Service Instance configuraion

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| service_instance_properties | Service Instance Property | Service Instance Property | object | <map[string]interface {} Value> |  |  |
| service_template_id | Service Template | Service Template | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/service_instances

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "service_instances": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_properties": $service_instance_properties,
        "service_template_id": $service_template_id
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/service_instances/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "service_instances": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_properties": $service_instance_properties,
        "service_template_id": $service_template_id
    }
  }
```

POST API
-----------

POST /v1.0/tenant/service_instances

Sample Request

``` json

  {
    "service_instances": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_properties": $service_instance_properties,
        "service_template_id": $service_template_id
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "service_instances": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_properties": $service_instance_properties,
        "service_template_id": $service_template_id
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/service_instances/:id

Sample Request

``` json

  {
    "service_instances": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_properties": $service_instance_properties,
        "service_template_id": $service_template_id
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "service_instances": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_properties": $service_instance_properties,
        "service_template_id": $service_template_id
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/service_instances/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Local Service Instance
============================

Description: Local service configuraion in each service

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| location_id | Location ID | Location ID | string |  |  |  |
| status | Status | status | string |  |  |  |
| output | Output | Output | object |  | yaml |  |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| service_instance_id | Service Instance | Service Instance | string |  |  |  |
| task_status | Status | status | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/local_service_instance

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "local_service_instance": [
      {

        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_id": $service_instance_id,
        "task_status": $task_status
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/local_service_instance/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_service_instance": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_id": $service_instance_id,
        "task_status": $task_status
    }
  }
```

POST API
-----------

POST /v1.0/tenant/local_service_instance

Sample Request

``` json

  {
    "local_service_instance": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_id": $service_instance_id,
        "task_status": $task_status
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "local_service_instance": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_id": $service_instance_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/local_service_instance/:id

Sample Request

``` json

  {
    "local_service_instance": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_id": $service_instance_id,
        "task_status": $task_status
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_service_instance": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_instance_id": $service_instance_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/local_service_instance/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Local Service Template
============================

Description: Local service configuraion

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| location_id | Location ID | Location ID | string |  |  |  |
| status | Status | status | string |  |  |  |
| output | Output | Output | object |  | yaml |  |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| service_template_id | Parent | parent object | string |  |  |  |
| task_status | Status | status | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/local_service_templates

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "local_service_templates": [
      {

        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_template_id": $service_template_id,
        "task_status": $task_status
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/local_service_templates/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_service_template": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_template_id": $service_template_id,
        "task_status": $task_status
    }
  }
```

POST API
-----------

POST /v1.0/tenant/local_service_templates

Sample Request

``` json

  {
    "local_service_template": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_template_id": $service_template_id,
        "task_status": $task_status
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "local_service_template": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_template_id": $service_template_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/local_service_templates/:id

Sample Request

``` json

  {
    "local_service_template": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_template_id": $service_template_id,
        "task_status": $task_status
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_service_template": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "service_template_id": $service_template_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/local_service_templates/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Security Group
============================

Description: Global security group configuraion

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| contrail_id | Contrail ID | security group ID used in contrail | integer |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/security_groups

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "security_groups": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/security_groups/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "security_group": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id
    }
  }
```

POST API
-----------

POST /v1.0/tenant/security_groups

Sample Request

``` json

  {
    "security_group": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "security_group": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/security_groups/:id

Sample Request

``` json

  {
    "security_group": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "security_group": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/security_groups/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Security Group Rules
============================

Description: Global Security Group Rule Configuraion

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| direction | Direction | Direction | string |  |  |  |
| ethertype | EtherType | EtherType | string |  |  |  |
| protocol | Protocol | Protocol | string | any |  |  |
| port_range_min | Port Range Min | Port Range Min | integer |  |  |  |
| port_range_max | Port Range Max | Port Range Max | integer |  |  |  |
| remote_group_id | Remote Group ID | Remote Group ID | string |  |  |  |
| remote_ip_prefix | Remote IP Prefix | Remote IP Prefix | string |  | cidr |  |
| security_group_id | Parent | parent object | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/security_group_rules

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "security_group_rules": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "direction": $direction,
        "ethertype": $ethertype,
        "protocol": $protocol,
        "port_range_min": $port_range_min,
        "port_range_max": $port_range_max,
        "remote_group_id": $remote_group_id,
        "remote_ip_prefix": $remote_ip_prefix,
        "security_group_id": $security_group_id
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/security_group_rules/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "security_group_rule": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "direction": $direction,
        "ethertype": $ethertype,
        "protocol": $protocol,
        "port_range_min": $port_range_min,
        "port_range_max": $port_range_max,
        "remote_group_id": $remote_group_id,
        "remote_ip_prefix": $remote_ip_prefix,
        "security_group_id": $security_group_id
    }
  }
```

POST API
-----------

POST /v1.0/tenant/security_group_rules

Sample Request

``` json

  {
    "security_group_rule": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "direction": $direction,
        "ethertype": $ethertype,
        "protocol": $protocol,
        "port_range_min": $port_range_min,
        "port_range_max": $port_range_max,
        "remote_group_id": $remote_group_id,
        "remote_ip_prefix": $remote_ip_prefix,
        "security_group_id": $security_group_id
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "security_group_rule": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "direction": $direction,
        "ethertype": $ethertype,
        "protocol": $protocol,
        "port_range_min": $port_range_min,
        "port_range_max": $port_range_max,
        "remote_group_id": $remote_group_id,
        "remote_ip_prefix": $remote_ip_prefix,
        "security_group_id": $security_group_id
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/security_group_rules/:id

Sample Request

``` json

  {
    "security_group_rule": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "direction": $direction,
        "ethertype": $ethertype,
        "protocol": $protocol,
        "port_range_min": $port_range_min,
        "port_range_max": $port_range_max,
        "remote_group_id": $remote_group_id,
        "remote_ip_prefix": $remote_ip_prefix,
        "security_group_id": $security_group_id
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "security_group_rule": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "direction": $direction,
        "ethertype": $ethertype,
        "protocol": $protocol,
        "port_range_min": $port_range_min,
        "port_range_max": $port_range_max,
        "remote_group_id": $remote_group_id,
        "remote_ip_prefix": $remote_ip_prefix,
        "security_group_id": $security_group_id
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/security_group_rules/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Local Security Group
============================

Description: Local Security Group

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| location_id | Location ID | Location ID | string |  |  |  |
| status | Status | status | string |  |  |  |
| output | Output | Output | object |  | yaml |  |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| security_group_id | Parent | parent object | string |  |  |  |
| task_status | Status | status | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/local_security_groups

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "local_security_groups": [
      {

        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "security_group_id": $security_group_id,
        "task_status": $task_status
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/local_security_groups/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_security_group": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "security_group_id": $security_group_id,
        "task_status": $task_status
    }
  }
```

POST API
-----------

POST /v1.0/tenant/local_security_groups

Sample Request

``` json

  {
    "local_security_group": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "security_group_id": $security_group_id,
        "task_status": $task_status
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "local_security_group": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "security_group_id": $security_group_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/local_security_groups/:id

Sample Request

``` json

  {
    "local_security_group": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "security_group_id": $security_group_id,
        "task_status": $task_status
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_security_group": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "security_group_id": $security_group_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/local_security_groups/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Network
============================

Description: Network

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| contrail_id | Contrail ID | Virtual Network ID used in contrail | integer |  |  |  |
| cidr | Cidr | cidr | string |  | cidr |  |
| local_prefix_len | Local Prefix Length | Prefix length for each local network | integer |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/networks

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "networks": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id,
        "cidr": $cidr,
        "local_prefix_len": $local_prefix_len
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/networks/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "network": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id,
        "cidr": $cidr,
        "local_prefix_len": $local_prefix_len
    }
  }
```

POST API
-----------

POST /v1.0/tenant/networks

Sample Request

``` json

  {
    "network": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id,
        "cidr": $cidr,
        "local_prefix_len": $local_prefix_len
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "network": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id,
        "cidr": $cidr,
        "local_prefix_len": $local_prefix_len
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/networks/:id

Sample Request

``` json

  {
    "network": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id,
        "cidr": $cidr,
        "local_prefix_len": $local_prefix_len
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "network": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "contrail_id": $contrail_id,
        "cidr": $cidr,
        "local_prefix_len": $local_prefix_len
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/networks/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Network Policy
============================

Description: Network Policy resources to allow policy between different networks

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| source_network_id | Source Network ID | Source Network | string |  |  |  |
| dest_network_id | Destination network ID | Destination Network ID | string |  |  |  |
| entries | Rules | Rules | array |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/network_policies

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "network_policies": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "source_network_id": $source_network_id,
        "dest_network_id": $dest_network_id,
        "entries": $entries
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/network_policies/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "network_policy": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "source_network_id": $source_network_id,
        "dest_network_id": $dest_network_id,
        "entries": $entries
    }
  }
```

POST API
-----------

POST /v1.0/tenant/network_policies

Sample Request

``` json

  {
    "network_policy": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "source_network_id": $source_network_id,
        "dest_network_id": $dest_network_id,
        "entries": $entries
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "network_policy": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "source_network_id": $source_network_id,
        "dest_network_id": $dest_network_id,
        "entries": $entries
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/network_policies/:id

Sample Request

``` json

  {
    "network_policy": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "source_network_id": $source_network_id,
        "dest_network_id": $dest_network_id,
        "entries": $entries
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "network_policy": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "source_network_id": $source_network_id,
        "dest_network_id": $dest_network_id,
        "entries": $entries
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/network_policies/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Local Network Policy
============================

Description: Local configuraion status in each location

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| location_id | Location ID | Location ID | string |  |  |  |
| status | Status | status | string |  |  |  |
| output | Output | Output | object |  | yaml |  |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| network_policy_id | Parent | parent object | string |  |  |  |
| task_status | Status | status | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/local_network_policies

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "local_network_policies": [
      {

        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "network_policy_id": $network_policy_id,
        "task_status": $task_status
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/local_network_policies/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_network_policy": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "network_policy_id": $network_policy_id,
        "task_status": $task_status
    }
  }
```

POST API
-----------

POST /v1.0/tenant/local_network_policies

Sample Request

``` json

  {
    "local_network_policy": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "network_policy_id": $network_policy_id,
        "task_status": $task_status
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "local_network_policy": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "network_policy_id": $network_policy_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/local_network_policies/:id

Sample Request

``` json

  {
    "local_network_policy": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "network_policy_id": $network_policy_id,
        "task_status": $task_status
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_network_policy": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "network_policy_id": $network_policy_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/local_network_policies/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Server
============================

Description: OpenStack Server instance configuraion. Experimental and for testing purpose only.

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| image_id | ImageID | ImageID | string |  |  |  |
| network_id | Network ID | NetworkID | string |  |  |  |
| security_group_id | Security Group ID | Security Group | string |  |  |  |
| flavor_id | Flavor ID | flavor_id | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/servers

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "servers": [
      {

        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "network_id": $network_id,
        "security_group_id": $security_group_id,
        "flavor_id": $flavor_id
      }
    ]
  }

```

Show API
-----------

GET /v1.0/servers/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "server": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "network_id": $network_id,
        "security_group_id": $security_group_id,
        "flavor_id": $flavor_id
    }
  }
```

POST API
-----------

POST /v1.0/servers

Sample Request

``` json

  {
    "server": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "network_id": $network_id,
        "security_group_id": $security_group_id,
        "flavor_id": $flavor_id
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "server": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "network_id": $network_id,
        "security_group_id": $security_group_id,
        "flavor_id": $flavor_id
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/servers/:id

Sample Request

``` json

  {
    "server": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "network_id": $network_id,
        "security_group_id": $security_group_id,
        "flavor_id": $flavor_id
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "server": { 
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "network_id": $network_id,
        "security_group_id": $security_group_id,
        "flavor_id": $flavor_id
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/servers/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Local Server
============================

Description: Local server configuraion status

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| location_id | Location ID | Location ID | string |  |  |  |
| status | Status | status | string |  |  |  |
| output | Output | Output | object |  | yaml |  |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| instance_id | Instance ID | Instance ID | string |  |  |  |
| console_url | Console | link for console | string |  | uri |  |
| server_id | Parent | parent object | string |  |  |  |
| task_status | Status | status | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/local_servers

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "local_servers": [
      {

        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "instance_id": $instance_id,
        "console_url": $console_url,
        "server_id": $server_id,
        "task_status": $task_status
      }
    ]
  }

```

Show API
-----------

GET /v1.0/local_servers/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_server": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "instance_id": $instance_id,
        "console_url": $console_url,
        "server_id": $server_id,
        "task_status": $task_status
    }
  }
```

POST API
-----------

POST /v1.0/local_servers

Sample Request

``` json

  {
    "local_server": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "instance_id": $instance_id,
        "console_url": $console_url,
        "server_id": $server_id,
        "task_status": $task_status
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "local_server": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "instance_id": $instance_id,
        "console_url": $console_url,
        "server_id": $server_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/local_servers/:id

Sample Request

``` json

  {
    "local_server": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "instance_id": $instance_id,
        "console_url": $console_url,
        "server_id": $server_id,
        "task_status": $task_status
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_server": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "instance_id": $instance_id,
        "console_url": $console_url,
        "server_id": $server_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/local_servers/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Local flavor
============================

Description: Local status of flavor configuraion

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| location_id | Location ID | Location ID | string |  |  |  |
| status | Status | status | string |  |  |  |
| output | Output | Output | object |  | yaml |  |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| flavor_id | Parent | parent object | string |  |  |  |
| task_status | Status | status | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/local_flavors

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "local_flavors": [
      {

        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "flavor_id": $flavor_id,
        "task_status": $task_status
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/local_flavors/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_flavor": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "flavor_id": $flavor_id,
        "task_status": $task_status
    }
  }
```

POST API
-----------

POST /v1.0/tenant/local_flavors

Sample Request

``` json

  {
    "local_flavor": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "flavor_id": $flavor_id,
        "task_status": $task_status
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "local_flavor": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "flavor_id": $flavor_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/local_flavors/:id

Sample Request

``` json

  {
    "local_flavor": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "flavor_id": $flavor_id,
        "task_status": $task_status
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_flavor": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "flavor_id": $flavor_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/local_flavors/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Local Image
============================

Description: Local status of image configuraion

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| location_id | Location ID | Location ID | string |  |  |  |
| status | Status | status | string |  |  |  |
| output | Output | Output | object |  | yaml |  |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| image_id | Parent | parent object | string |  |  |  |
| task_status | Status | status | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/local_images

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "local_images": [
      {

        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "task_status": $task_status
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/local_images/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_image": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "task_status": $task_status
    }
  }
```

POST API
-----------

POST /v1.0/tenant/local_images

Sample Request

``` json

  {
    "local_image": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "task_status": $task_status
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "local_image": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/local_images/:id

Sample Request

``` json

  {
    "local_image": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "task_status": $task_status
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_image": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "image_id": $image_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/local_images/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Local Network
============================

Description: Local network in single DC

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| location_id | Location ID | Location ID | string |  |  |  |
| status | Status | status | string |  |  |  |
| output | Output | Output | object |  | yaml |  |
| id | ID | ID | string |  | uuid |  |
| name | Name | Name | string |  |  |  |
| tenant_id | Tenant ID | Tenant ID | string |  |  |  |
| description | Description | Description | string |  |  |  |
| cidr | Cidr | cidr | string |  | cidr |  |
| network_id | network | parent object | string |  |  |  |
| task_status | Status | status | string |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/tenant/local_networks

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "local_networks": [
      {

        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "cidr": $cidr,
        "network_id": $network_id,
        "task_status": $task_status
      }
    ]
  }

```

Show API
-----------

GET /v1.0/tenant/local_networks/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_network": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "cidr": $cidr,
        "network_id": $network_id,
        "task_status": $task_status
    }
  }
```

POST API
-----------

POST /v1.0/tenant/local_networks

Sample Request

``` json

  {
    "local_network": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "cidr": $cidr,
        "network_id": $network_id,
        "task_status": $task_status
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "local_network": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "cidr": $cidr,
        "network_id": $network_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/tenant/local_networks/:id

Sample Request

``` json

  {
    "local_network": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "cidr": $cidr,
        "network_id": $network_id,
        "task_status": $task_status
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "local_network": { 
        "location_id": $location_id,
        "status": $status,
        "output": $output,
        "id": $id,
        "name": $name,
        "tenant_id": $tenant_id,
        "description": $description,
        "cidr": $cidr,
        "network_id": $network_id,
        "task_status": $task_status
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/tenant/local_networks/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


ID Pool
============================

Description: Identifier pool for managing various ID pool

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| name | name | Name | string |  |  |  |
| start | start | start | number |  |  |  |
| end | end | end | number |  |  |  |
| assigned | assinged | assigned | boolean |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/admin/id_pools

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "id_pools": [
      {

        "id": $id,
        "name": $name,
        "start": $start,
        "end": $end,
        "assigned": $assigned
      }
    ]
  }

```

Show API
-----------

GET /v1.0/admin/id_pools/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "id_pool": { 
        "id": $id,
        "name": $name,
        "start": $start,
        "end": $end,
        "assigned": $assigned
    }
  }
```

POST API
-----------

POST /v1.0/admin/id_pools

Sample Request

``` json

  {
    "id_pool": { 
        "id": $id,
        "name": $name,
        "start": $start,
        "end": $end,
        "assigned": $assigned
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "id_pool": { 
        "id": $id,
        "name": $name,
        "start": $start,
        "end": $end,
        "assigned": $assigned
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/admin/id_pools/:id

Sample Request

``` json

  {
    "id_pool": { 
        "id": $id,
        "name": $name,
        "start": $start,
        "end": $end,
        "assigned": $assigned
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "id_pool": { 
        "id": $id,
        "name": $name,
        "start": $start,
        "end": $end,
        "assigned": $assigned
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/admin/id_pools/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Route Target Association
============================

Description: Route Targets association represents link between route target and networks

Properties
------------

| Key | Title | Description | Type | Default |  Format | Permission |
| ----- | ------- | ------------- | ------ | --------- | --------- | ------------ |
| id | ID | ID | string |  | uuid |  |
| network_id | Network ID | Associated Network ID | string |  |  |  |
| route_target | Route Target | Route Target identifier | integer |  |  |  |

Note: it is mandatory property if there is no default value specified.
id is an exception. if id property is null, gohan server will put uuid.

API Endpoint

List API
-----------

GET /v1.0/admin/route_target_associations

Sample Output

HTTP Status Code: 200 (OK)


``` json

  {
    "route_target_associations": [
      {

        "id": $id,
        "network_id": $network_id,
        "route_target": $route_target
      }
    ]
  }

```

Show API
-----------

GET /v1.0/admin/route_target_associations/:id

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "route_target_association": { 
        "id": $id,
        "network_id": $network_id,
        "route_target": $route_target
    }
  }
```

POST API
-----------

POST /v1.0/admin/route_target_associations

Sample Request

``` json

  {
    "route_target_association": { 
        "id": $id,
        "network_id": $network_id,
        "route_target": $route_target
      }
    }
  }

 ```

Sample Output

HTTP Status Code: 201 (Accepted)

``` json

  {
    "route_target_association": { 
        "id": $id,
        "network_id": $network_id,
        "route_target": $route_target
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


Update API
-----------

PUT /v1.0/admin/route_target_associations/:id

Sample Request

``` json

  {
    "route_target_association": { 
        "id": $id,
        "network_id": $network_id,
        "route_target": $route_target
      }
    }
  }

```

Sample Output

HTTP Status Code: 200 (OK)

``` json

  {
    "route_target_association": { 
        "id": $id,
        "network_id": $network_id,
        "route_target": $route_target
      }
    }
  }

```

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |

Delete API
-----------

DELETE /v1.0/admin/route_target_associations/:id

HTTP Status Code: 204 (No Content)

Error Codes

| Code | Status | Description |
|------|--------|-------------|
| 400  | Bad Request |  There are one or more errors in request value |
| 409  | Conflicts | Data integlity issue such as deleting resource with reference from the other resources |


