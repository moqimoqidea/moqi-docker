#!/bin/sh

# build moqi-centos
docker build -f ../centos/Dockerfile -t moqi-centos .

echo "build moqi-centos success"

# build moqi-ubuntu
docker build -f ../ubuntu/Dockerfile -t moqi-ubuntu .

echo "build moqi-ubuntu success"
