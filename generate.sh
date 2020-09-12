#!/bin/bash
set -euo pipefail
echo "generating server stubs"

rm -rf server_out
mkdir server_out
protoc --gofast_out=plugins=grpc:server_out *.proto
echo "done generating server stubs"

echo "generating client"
rm -rf service_client_out
mkdir service_client_out
protoc --js_out=import_style=commonjs,binary:./service_client_out \
  --grpc-web_out=import_style=typescript,mode=grpcwebtext:./service_client_out *.proto

echo "done generating client"