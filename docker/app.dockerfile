FROM node:16.8.0-stretch

RUN apt update
RUN apt install -y vim

COPY bashrc /root/.bashrc

WORKDIR /hoticeamericano