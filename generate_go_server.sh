#!/bin/bash
echo "generating server stubs"
rm -rf ./go_out/
# rm -rf ./grpc_out/
mkdir -p go_out 
# mkdir -p grpc_out
protoc --gofast_out=plugins=grpc:./go_out *.proto #--gofast_out=./go_out
echo "done generating server stubs"