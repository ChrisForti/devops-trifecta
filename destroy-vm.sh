#!/bin/bash

# delete and purge trifecta VM
multipass delete --purge trifecta
# Remove any and all id_ed255129 ssh keys 
rm -f id_ed25519*
# Remove cloud-init yaml file
rm cloud-init.yaml