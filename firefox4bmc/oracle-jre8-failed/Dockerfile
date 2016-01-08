FROM ubuntu:14.04

MAINTAINER Christian Schnidrig

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/firefox && \
    echo "firefox:x:${uid}:${gid}:firefox,,,:/home/firefox:/bin/bash" >> /etc/passwd && \
    echo "firefox:x:${uid}:" >> /etc/group && \
    echo "firefox ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/firefox && \
    chmod 0440 /etc/sudoers.d/firefox && \
    chown ${uid}:${gid} -R /home/firefox

RUN apt-get update 
RUN apt-get install -y firefox language-pack-de firefox-locale-de

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y dbus dbus-x11 && \
    dbus-uuidgen > /var/lib/dbus/machine-id

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > /etc/apt/sources.list.d/OracleJava.list && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
    apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-installer oracle-java8-set-default libxtst6

RUN ln -s /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libnpjp2.so /usr/lib/firefox-addons/plugins

#RUN    apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/*

USER firefox
ENV HOME /home/firefox
WORKDIR /home/firefox
ENTRYPOINT ["/usr/bin/firefox"]

