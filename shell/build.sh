#!/bin/sh

# build moqi-centos
docker build -f ../centos/Dockerfile -t moqi-centos .

if [ $? -ne 0 ]; then
  echo "\n************************* build moqi-centos failed *************************\n"
  exit 1
fi

echo "\n************************* build moqi-centos success *************************\n"

# build moqi-ubuntu
docker build -f ../ubuntu/Dockerfile -t moqi-ubuntu .

if [ $? -ne 0 ]; then
  echo "\n************************* build moqi-ubuntu failed *************************\n"
  exit 1
fi

echo "\n************************* build moqi-ubuntu success *************************\n"
