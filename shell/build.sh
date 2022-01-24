#!/bin/sh

# get timestamp
nowTimestamp=$(date '+%Y%m%d%H%M%S')

# get mac os version
macOsFullName=$(uname -a)


# shellcheck disable=SC2039
if [[ $macOsFullName == *"arm"* ]]; then
  tagPrefix="arm"
else
  tagPrefix="intel"
fi

fullTag=$tagPrefix"-"$nowTimestamp
fullCentOs="moqimoqidea/centos:$fullTag"
fullUbuntu="moqimoqidea/ubuntu:$fullTag"


# centos
printf "\n************************* start build %s *************************\n\n" "$fullCentOs"

docker build -f ../centos/Dockerfile -t "$fullCentOs" .

if [ $? -ne 0 ]; then
  printf "\n************************* build %s failed *************************\n\n" "$fullCentOs"
  exit 1
fi

printf "\n************************* build %s success *************************\n\n" "$fullCentOs"


# ubuntu
printf "\n************************* start build %s *************************\n\n" "$fullUbuntu"

docker build -f ../ubuntu/Dockerfile -t "$fullUbuntu" .

if [ $? -ne 0 ]; then
  printf "\n************************* build %s failed *************************\n\n" "$fullUbuntu"
  exit 1
else
  printf "\n************************* build %s success *************************\n\n" "$fullUbuntu"
fi
