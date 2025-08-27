#!/bin/bash

# Purpose: PVC usage for quay-37-enterprise namespace
# Output: Prints PVC usage to terminal

NAMESPACE="openshift-monitoring"
PROM_POD="prometheus-k8s-0"
TARGET_NS="quay-37-enterprise"

fetch_pvc_usage() {
    ENCODED_NS="%7Bnamespace%3D%22$TARGET_NS%22%7D"

    # Fetch used bytes
    used=$(oc -n $NAMESPACE exec $PROM_POD -c prometheus -- \
      curl -s "http://localhost:9090/api/v1/query?query=kubelet_volume_stats_used_bytes$ENCODED_NS" | \
      jq -r '.data.result[]? | [.metric.namespace, .metric.persistentvolumeclaim, (.value[1] | tonumber // 0)] | @tsv')

    # Fetch capacity bytes
    cap=$(oc -n $NAMESPACE exec $PROM_POD -c prometheus -- \
      curl -s "http://localhost:9090/api/v1/query?query=kubelet_volume_stats_capacity_bytes$ENCODED_NS" | \
      jq -r '.data.result[]? | [.metric.namespace, .metric.persistentvolumeclaim, (.value[1] | tonumber // 0)] | @tsv')

    # Print header
    printf "%-40s %-60s %10s %12s %8s\n" "NAMESPACE" "PVC NAME" "USED(GiB)" "CAPACITY(GiB)" "% USED"

    # Merge results and print
    paste <(echo "$used") <(echo "$cap") | awk -F'\t' '{
      used_bytes=$3;
      cap_bytes=$6;
      used_gib = used_bytes/1024/1024/1024;
      cap_gib = cap_bytes/1024/1024/1024;
      pct = (cap_gib>0)?(used_gib/cap_gib*100):0;
      printf "%-40s %-60s %10.2f %12.2f %8.2f\n", $1, $2, used_gib, cap_gib, pct
    }' | sort -k2,2
}

# Run
fetch_pvc_usage
