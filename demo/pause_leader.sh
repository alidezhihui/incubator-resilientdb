#!/usr/bin/env bash
WORKDIR="/home/alidezhihui/incubator-resilientdb"

kill "$(tail -n1 $WORKDIR/server0.pid)"