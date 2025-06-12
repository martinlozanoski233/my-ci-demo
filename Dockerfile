FROM jenkins/inbound-agent:latest

USER root

RUN apt-get update && apt-get install -y \
    git \
    curl \
    docker.io \
    postgresql-client \
    sudo \
    bash \
    && apt-get clean

USER jenkins
