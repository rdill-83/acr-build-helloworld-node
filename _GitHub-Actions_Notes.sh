# GitHub Action Notes

# Source: https://learn.microsoft.com/en-us/azure/container-instances/container-instances-github-action?tabs=userlevel

# Resource Group
$RG = 'github-actions'
$Loc = "EastUS2"

az group create --name $RG --location $loc

$groupid =$(az group show --name $RG --query id --output tsv)

