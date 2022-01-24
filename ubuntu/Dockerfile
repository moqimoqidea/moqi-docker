FROM ubuntu:latest

RUN apt -y update && apt -y upgrade

RUN apt -y install git python2 python3 curl zsh vim

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
