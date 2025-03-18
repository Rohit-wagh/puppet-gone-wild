#!/bin/bash

# Start Puppet Server
/opt/puppetlabs/server/bin/puppetserver foreground &

# Wait for Puppet Server to be ready
while ! puppetserver ca list 2>/dev/null | grep -q 'agent'; do
  echo "Waiting for Puppet Agent certificate request..."
  sleep 5
done

# Sign all pending certificates
puppetserver ca sign --all
echo "Puppet Agent certificate signed!"

# Keep container running
wait

