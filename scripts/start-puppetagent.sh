#!/bin/bash

apt-get update
# Wait for Puppet Server
until curl -s --connect-timeout 2 https://puppet:8140 >/dev/null; do
  echo "Waiting for Puppet Server..."
  sleep 5
done

# Run Puppet Agent
puppet agent --test --server=puppet --waitforcert=600

