#!/bin/sh

# get mac os version
macOsFullName=$(uname -a)

# shellcheck disable=SC2039
if [[ $macOsFullName == *"arm"* ]]; then
  tagSuffix="arm"
else
  tagSuffix="intel"
fi

fullTag="latest-"$tagSuffix
fullCentOs="moqimoqidea/centos:$fullTag"
fullUbuntu="moqimoqidea/ubuntu:$fullTag"


# centos
printf "\n************************* start push %s *************************\n\n" "$fullCentOs"

docker push "$fullCentOs"

if [ $? -ne 0 ]; then
  printf "\n************************* push %s failed *************************\n\n" "$fullCentOs"
  exit 1
else
  printf "\n************************* push %s success *************************\n\n" "$fullCentOs"
fi


# ubuntu
printf "\n************************* start push %s *************************\n\n" "$fullUbuntu"

docker push "$fullUbuntu"

if [ $? -ne 0 ]; then
  printf "\n************************* push %s failed *************************\n\n" "$fullUbuntu"
  exit 1
else
  printf "\n************************* push %s success *************************\n\n" "$fullUbuntu"
fi
