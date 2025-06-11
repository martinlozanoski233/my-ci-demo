FROM ubuntu:22.04

USER root

RUN apt-get update && apt-get install -y \
    git \
    curl \
    docker.io \
    postgresql-client \
    sudo \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
USER root
