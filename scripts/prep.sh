#!/bin/bash

createRG()
{
    az group create \
        --name acs-swarmm-vnet \
        --location westeurope 
}

createVnet() 
{
    az network vnet create \
        --resource-group acs-swarmm-vnet \
        --location westeurope \
        --name swarmm-vnet \
        --address-prefix 172.17.0.0/24
}

createMasterSubnet()
{
    az network vnet subnet create \
        --name master \
        --resource-group acs-swarmm-vnet \
        --vnet-name swarmm-vnet \
        --address-prefix 172.17.0.0/25
}

createAgentSubnet()
{
    az network vnet subnet create \
        --name agent \
        --resource-group acs-swarmm-vnet \
        --vnet-name swarmm-vnet \
        --address-prefix 172.17.0.128/25
}


time createRG
time createVnet
time createMasterSubnet
time createAgentSubnet
