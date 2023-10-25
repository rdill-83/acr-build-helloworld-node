# GitHub Action Notes

# Source: https://learn.microsoft.com/en-us/azure/container-instances/container-instances-github-action?tabs=userlevel

# AZ Env - General Setup:

### Resource Group Creation:
$RG = 'github-actions'
$Loc = "EastUS2"
$ACR = "ghacr90814"

az group create --name $RG --location $loc

$groupid =$(az group show --name $RG --query id --output tsv)

### Create Service Principal:
az ad sp create-for-rbac --scope $groupid --role Contributor --sdk-auth

#### service principal creation - JSON output (clientID used in later step)
{
  "clientId": "16e3c10b-a8ae-4dd3-b355-f415465deb96",
  "clientSecret": "Gha8Q~GEvmf_lzTLeunfFm1GmOJ-7egZ5_rZWajv",
  "subscriptionId": "da4de53d-f7e7-49c8-bbbe-3533fb81ee12",
  "tenantId": "8ceb2077-8b6c-4385-add7-66e6059a805a",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}

#### Bonus - show az sp info (live example):
az ad sp show --id 16e3c10b-a8ae-4dd3-b355-f415465deb96

### Create AZ Container Registry:
az acr create -g $RG --name $ACR --sku standard --admin-enabled $true

### ACR ID to Variable:
$regID = $(az acr show -g $RG --name $ACR --query id --output tsv)

### Add AcrPush role to the SP:
az role assignment create --assignee 16e3c10b-a8ae-4dd3-b355-f415465deb96 --scope $regID --role AcrPush