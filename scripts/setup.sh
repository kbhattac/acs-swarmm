#!/bin/bash

createRG()
{
    az group create \
        --debug \
        --name acs-swarmm-vnet \
        --location westeurope 
}

createVnet() 
{
    az network vnet create \
        --debug \
        --resource-group acs-swarmm-vnet \
        --location westeurope \
        --name swarmm-vnet \
        --address-prefix 172.17.0.0/24
}

createMasterSubnet()
{
    az network vnet subnet create \
        --debug \
        --name master \
        --resource-group acs-swarmm-vnet \
        --vnet-name swarmm-vnet \
        --address-prefix 172.17.0.0/25
}

createAgentSubnet()
{
    az network vnet subnet create \
        --debug \
        --name agent \
        --resource-group acs-swarmm-vnet \
        --vnet-name swarmm-vnet \
        --address-prefix 172.17.0.128/25
}

deploy()
{
    az group deployment create \
        --debug \
        --name swarmmode \
        --resource-group acs-swarmm-vnet \
        --template-file ./output/azuredeploy.json \
        --parameters @./output/azuredeploy.parameters.json
} 

time createRG
time createVnet
time createMasterSubnet
time createAgentSubnet
time deploy