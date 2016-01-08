FROM ubuntu:14.04

MAINTAINER Christian Schnidrig

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/firefox && \
    echo "firefox:x:${uid}:${gid}:firefox,,,:/home/firefox:/bin/bash" >> /etc/passwd && \
    echo "firefox:x:${uid}:" >> /etc/group && \
    echo "firefox ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/firefox && \
    chmod 0440 /etc/sudoers.d/firefox && \
    chown ${uid}:${gid} -R /home/firefox

RUN apt-get update && \
    apt-get install -y firefox=28.0+build2-0ubuntu2 && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y dbus dbus-x11 && \
    dbus-uuidgen > /var/lib/dbus/machine-id && \
    apt-get install -y \
    openjdk-7-jre icedtea-plugin && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/*

USER firefox
ENV HOME /home/firefox
WORKDIR /home/firefox
ENTRYPOINT ["/usr/bin/firefox"]

