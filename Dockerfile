FROM alpine:3.7

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"
LABEL APP="Ansible"

ENV VERSION 2.4.3.0

# Dependencies
RUN apk --update add python py-pip openssl ca-certificates && \
    apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base && \
    pip install --upgrade pip cffi

# Install Ansible
RUN echo "===> Installing Ansible..." && \
    pip install ansible==${VERSION}

# Tools
RUN echo "===> Installing handy tools (not absolutely required)..." && \
    apk --update add sshpass openssh-client rsync

# Cleanup
RUN echo "===> Removing package list..."  && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*