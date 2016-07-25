OpenContrail Global Controller (codename Ukai)
----------------------------------------------

# Introduction

## Purpose

The goal of OpenContrail Global Controller is to provide the seamless experience in multiple regions. Cloud environment. We will separate failure domain using Region concept on multiple region environments to provide high availability. However, there is a burden to configure servers and virtual machines over multiple different regions.

The Global Controller has two primary responsibility, resource ID management and multiple location resource provisioning.

## Scope

### Centralized resource identifier management

We have multiple kinds of identifiers (IDs), which are needed to coordinate in centralized location,
 such as Route Target, Virtual Network IDs, Security Groups ID.
OpenContrail can interconnect virtual networks (VNs) in different Data Centers using BGP VPN technology (RFC4364).
BGP VPN realizes virtual private networks (VPNs) using Route Target identifier (RFC4360).
We need to coordinate route target ID ranges if we interconnect multiple DCs to automate this process.
Virtual network ID is similar with route target. It is used to identify same virtual networks in different DCs for preventing looping in
service chaining described later.
Security Group IDs are used to identify same security group so that we can use same security group policy over multiple
DCs. It is an operational burden for users if we can't use same security group over multiple regions because we need
to configure to allow traffic from all route in a same virtual network.
OpenContrail Global Controller manages these identifiers.

### Multiple location resource provisioning

We have many use-cases need to have same resource need to be existing in multiple DCs such as Policy or services.
Let's say we have a security policy to apply firewall (FW) for any traffic for application server network which exists in multiple
locations. We need to have replicated virtual networks, network policies, and FWs in each location.
OpenContrail Global Controller automates this process.

Doc
-------

see more detail in [Doc](https://nati.gitbooks.io/contrail-global-controller/content/)

Licensing
---------
Apache2