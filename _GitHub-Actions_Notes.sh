# GitHub Action Notes

# Source: https://learn.microsoft.com/en-us/azure/container-instances/container-instances-github-action?tabs=userlevel

# Resource Group
$RG = 'github-actions'
$Loc = "EastUS2"

az group create --name $RG --location $loc

$groupid =$(az group show --name $RG --query id --output tsv)

# Create Service Principal:
az ad sp create-for-rbac --scope $groupid --role Contributor --sdk-auth

### service principal creation - JSON output (clientID used in later step)
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

