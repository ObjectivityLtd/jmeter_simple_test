Write-Host "Hello from CLI hook"
az aks nodepool list --resource-group "$resource_group" --name "$cluster_name"