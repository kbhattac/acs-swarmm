#!/bin/bash
echo "Deleting resource-group acs-swarmm-vnet..."
deleteRG() 
{
  az group delete --name acs-swarmm-vnet
}
time deleteRG
