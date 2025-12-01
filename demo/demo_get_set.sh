#!/usr/bin/env bash
set -euo pipefail
WORKDIR="/home/alidezhihui/incubator-resilientdb"
CLIENT_CFG="$WORKDIR/service/tools/config/interface/service.config"
KV_TOOL="$WORKDIR/bazel-bin/service/tools/kv/api_tools/kv_service_tools"

echo "=== Non-versioned set/get ==="
"$KV_TOOL" --config "$CLIENT_CFG" --cmd set --key key1 --value value_a
"$KV_TOOL" --config "$CLIENT_CFG" --cmd set --key key2 --value value_b
"$KV_TOOL" --config "$CLIENT_CFG" --cmd set --key key3 --value value_c

"$KV_TOOL" --config "$CLIENT_CFG" --cmd get --key key1
"$KV_TOOL" --config "$CLIENT_CFG" --cmd get --key key2
"$KV_TOOL" --config "$CLIENT_CFG" --cmd get --key key3
"$KV_TOOL" --config "$CLIENT_CFG" --cmd get_key_range --min_key key1 --max_key key3

echo
echo "=== Version-based set/get ==="
KEY="vkey_demo"
# First Version
"$KV_TOOL" --config "$CLIENT_CFG" --cmd set_with_version --key "$KEY" --version 0 --value Alice
"$KV_TOOL" --config "$CLIENT_CFG" --cmd set_with_version --key "$KEY" --version 1 --value Bob

# Second Version
"$KV_TOOL" --config "$CLIENT_CFG" --cmd get_with_version --key "$KEY" --version 0
"$KV_TOOL" --config "$CLIENT_CFG" --cmd get_with_version --key "$KEY" --version 1

echo
echo "Done."