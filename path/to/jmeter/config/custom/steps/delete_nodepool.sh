delete_nodepool() {
   local nodepool_name=$1
   local cluster_name=$2
   local resource_group=$3
   local cnamer=$4

   if [ -z "$cname" ]; then
    echo "##[info] Dynamically created cluster not available. Using static cluster."
   else
    echo "##[info] Using dynamically created cluster named $name"
    cluster_name="$cname"
   fi
   echo "Deleting pool on $cluster_name... "
   echo "##[command] az aks nodepool delete -g "$resource_group" --cluster-name "$cluster_name" --name "$nodepool_name" --no-wait"
   az aks nodepool delete -g "$resource_group" --cluster-name "$cluster_name" --name "$nodepool_name" --no-wait

}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  delete_nodepool "$@"
fi