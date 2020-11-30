create_nodepool() {
   local nodepool_name=$1
   local cluster_name=$2
   local crux_label=$3
   local crux_label_value=$4
   local resource_group=$5
   local scale_up_replicas=$6
   local node_count=$(($scale_up_replicas+1)) # + 1 for the master
   local node_size=$7
   local cname=$(cname)

   if [ -z "$cname" ]; then
    :
   else
    cluster_name="$cname"
   fi

   active_crux_pools=$(az aks nodepool list -g "$resource_group" --cluster-name "$cluster_name" -o json --query [?nodeLabels].{n:nodeLabels} | grep "$crux_label" | wc -l)

   echo "active crux pools: $active_crux_pools"

   echo "Create dedicated pool on $cluster_name - $nodepool_name with $node_count nodes sized as $node_size"
   echo "##[command]az aks nodepool add --resource-group $resource_group --cluster-name $cluster_name  --name $nodepool_name --node-count $node_count --node-vm-size $node_size --labels $crux_label=$crux_label_value"
   az aks nodepool add --resource-group "$resource_group" --cluster-name "$cluster_name"  --name "$nodepool_name" --node-count "$node_count" --node-vm-size "$node_size" --labels $crux_label=$crux_label_value

   echo "Available pools: "
   az aks nodepool list -g "$resource_group" --cluster-name "$cluster_name" --output table
   echo "-----------------------"
   if az aks nodepool list -g "$resource_group" --cluster-name "$cluster_name" --output table | grep "$nodepool_name" ; then
      echo "##[info] Pool has been created usccessfully."
   else
      echo "##[error] Pool has not been successfully created. Lacking capacity?"
      echo "##vso[task.complete result=Failed;]DONE"
   fi
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  create_nodepool "$@"
fi