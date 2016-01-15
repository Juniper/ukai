#!/bin/sh

#servers=`openstack server list -f value | cut -d " " -f 2`
for i in {1..50}
do
  #  server="ukai$i"
  #  if [[ $servers =~ $server ]]; then
  #    continue
  #  fi
  # openstack server create --flavor m1.xlarge --image ukai_base --nic net-id=99dabf35-3032-4dc8-b976-319257e68f35,v4-fixed-ip=10.84.46.$(($i + 100)) ukai$i
  echo 10.84.46.$(($i + 100))
done
