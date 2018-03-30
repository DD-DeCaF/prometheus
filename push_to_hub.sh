#!/usr/bin/env bash
NAME="dddecaf/prometheus:latest"
docker build -t ${NAME} .
docker push ${NAME}
