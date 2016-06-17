OpenContrail Global Controller (codename Ukai)
----------------------------------------------

OpenContrail Global Controller is a cloud & network controller for multiple controllers.

![ukai](https://upload.wikimedia.org/wikipedia/commons/3/31/Kisokaido54_Godo.jpg "Ukai")
[Ukai](https://en.wikipedia.org/wiki/Cormorant_fishing#Japan)

- Global Network Resource management
  Ukai manages network resources and it get translated to local resources in the DC.
- Global identifier pool management such as Route Target and Security Group ID etc.

Status
------
Alpha in QA

Doc
-------

see more detail in [Doc](./doc)


TODOs
-----

Common

- [x] Better error message
- [ ] Better logging
- [x] Retry execution
- [x] Queuing

Resources Status

- [x] ID pool
- [x] Network
  - [x] local network
    - [x] local_server
    - [x] local_network_policy
  - [x] global subnet & IPAM
  - [x] RT pool management
  - [x] Multiple RT
  - [x] Update network
- [x] Security group
  - [x] Global sg id management
  - [x] Input ip validation check
- [x] service_template
- [x] service_instance
  - [x] support in_network and in_network_nat
- [x] network_policy
  - [x] input ip validation check
- [x] location
  - [x] local_security_group
  - [x] local_image
  - [x] local_service_template
  - [x] local_service_instance
  - [ ] health status
- [x] Image
- [x] Server
- [x] Heat
- [x] Flavor

Testing

- [ ] CI test
- [ ] make ansible + vagrant for createing testing enviroment including two contrail setup
- [ ] Dependency analysis & test

Benchmark

- [x] mock backend
- [ ] real backend

Document
- [x] API Doc
- [ ] Detailed Setup procedure

Licensing
---------
Apache2