#!/usr/bin/env bash

set -e

CURDIR=`pwd`
OLDGOPATH="$GOPATH"
OLDGOBIN="$GOBIN"
export GOPATH="$CURDIR"
export GOBIN="$CURDIR/bin/"
echo 'GOPATH:' $GOPATH
echo 'GOBIN:' $GOBIN
#go test -race -test.v ucenter/business/dao 
#go test -race -test.v ucenter/business/service/auth 
go test -race -test.v songguo7.com/business/transport/order_adjust
#go test -race -test.v -test.run Info -bench=. -benchtime=2s -cpuprofile=prof.cpu api/http/controller
#go test -race -test.v -bench=. -benchtime=2s -memprofile=prof.mem ucenter/business/dao 
export GOPATH="$OLDGOPATH"
export GOBIN="$OLDGOBIN"

echo 'test finished'

