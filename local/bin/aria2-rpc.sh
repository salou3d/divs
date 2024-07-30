#!/usr/bin/env bash

aria2c --no-conf --enable-rpc --rpc-listen-port=6800 --rpc-max-request-size=2M --rpc-listen-all --quiet=true
