#!/bin/sh

# get timestamp
nowTimestamp=$(date '+%Y%m%d%H%M%S')

# get mac os version
macOsFullName=$(uname -a)


# shellcheck disable=SC2039
if [[ $macOsFullName == *"arm"* ]]; then
  tag="arm"
else
  tag="x86"
fi

fullTag=$tag"-"$nowTimestamp
fullCentOs="moqimoqidea/centos:$fullTag"
fullUbuntu="moqimoqidea/ubuntu:$fullTag"

printf "\n************************* start build and push %s, %s *************************\n\n" "$fullCentOs" "$fullUbuntu"

# centos
docker build -f ../centos/Dockerfile -t "$fullCentOs" .

if [ $? -ne 0 ]; then
  printf "\n************************* build %s failed *************************\n\n" "$fullCentOs"
  exit 1
fi

printf "\n************************* build %s success *************************\n\n" "$fullCentOs"

docker push "$fullCentOs"

if [ $? -ne 0 ]; then
  printf "\n************************* push %s failed *************************\n\n" "$fullCentOs"
  exit 1
else
  printf "\n************************* push %s success *************************\n\n" "$fullCentOs"
fi


# ubuntu
docker build -f ../ubuntu/Dockerfile -t "$fullUbuntu" .

if [ $? -ne 0 ]; then
  printf "\n************************* build %s failed *************************\n\n" "$fullUbuntu"
  exit 1
else
  printf "\n************************* build %s success *************************\n\n" "$fullUbuntu"
fi

docker push "$fullUbuntu"

if [ $? -ne 0 ]; then
  printf "\n************************* push %s failed *************************\n\n" "$fullUbuntu"
  exit 1
else
  printf "\n************************* push %s success *************************\n\n" "$fullUbuntu"
fi
