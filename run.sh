#!/bin/sh

cd docker
docker build -t node:1.0 -f app.dockerfile .
docker-compose up -d