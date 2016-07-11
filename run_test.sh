#!/bin/bash

set -e

cd extensions/tests
gohan run unittest/fqdn_test.yaml
gohan run unittest/id_pool_test.yaml
gohan run api/scenario_test.yaml
gohan run api/southbound_down_test.yaml
gohan run api/policy_test.yaml
gohan run api/conflict_test.yaml
gohan run api/bad_request_test.yaml