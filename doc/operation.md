# Operational Detail

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