Write-Host "HWhatever you put here is executed with armConnection rights"
az aks nodepool list --resource-group jmeter-group --cluster-name k8 --output table
az pipelines variable list --pipeline-id 24 --output table