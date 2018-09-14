#!/usr/bin/env bash

set -e

CURDIR=`pwd`
OLDGOPATH="$GOPATH"
OLDGOBIN="$GOBIN"
export GOPATH="$CURDIR"
export GOBIN="$CURDIR/bin/"
echo 'GOPATH:' $GOPATH
echo 'GOBIN:' $GOBIN
go build -o greeter_server -race -work -v -ldflags "-s" -gcflags "-N -l" src/grpc/vendor/google.golang.org/grpc/examples/helloworld/greeter_server/main.go 
go build -o greeter_client -race -work -v -ldflags "-s" -gcflags "-N -l" src/grpc/vendor/google.golang.org/grpc/examples/helloworld/greeter_client/main.go 

if [ ! -d ./bin ]; then
	mkdir bin
fi

if [ -e ./ebike-order-go ]; then
   mv ebike-order-go ./bin/
fi

export GOPATH="$OLDGOPATH"
export GOBIN="$OLDGOBIN"

echo 'build finished'

