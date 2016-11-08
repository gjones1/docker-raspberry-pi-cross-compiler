#!/bin/bash

: ${RPXC_IMAGE:=geordiejones/raspberry-pi-cross-compiler}

docker build -t $RPXC_IMAGE .
