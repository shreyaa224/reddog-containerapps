# *nix only
export RG="reddog-22"
export LOCATION="eastus2"
export SUB_ID="d39add2e-a062-4ac2-b217-b69b4fb14a19"

# Follow Azure CLI prompts to authenticate to your subscription of choice
az login
az account set --subscription $SUB_ID

# Create resource group
az group create -n $RG -l $LOCATION

# Deploy all infrastructure and reddog apps
az deployment group create -n reddog -g $RG -f ./deploy/bicep/main.bicep

# Show outputs for bicep deployment
az deployment group show -n reddog -g $RG -o json --query properties.outputs.urls.value
