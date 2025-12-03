#!/usr/bin/env bash
set -euo pipefail
WORKDIR="/home/alidezhihui/incubator-resilientdb"
START_SCRIPT="$WORKDIR/service/tools/kv/server_tools/start_kv_service.sh"

# Start 4 RAFT replicas
"$START_SCRIPT"