FROM ghcr.io/eoepca/iga-remote-desktop:latest-dev

USER root

ADD panoply.desktop /etc/xdg/autostart/panoply.desktop

### Install OpenJDK for Panoply ###
RUN apt-get update && \
    apt-get install -y openjdk-17-jre unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

### Install Panoply ###
ARG PANOPLY_VERSION=5.9.1
RUN curl -L -o /tmp/panoply.zip \
      https://www.giss.nasa.gov/tools/panoply/download/PanoplyJ-${PANOPLY_VERSION}.zip && \
    unzip /tmp/panoply.zip -d /opt && \
    mv /opt/Panoply*/ /opt/panoply && \
    rm /tmp/panoply.zip

COPY panoply /usr/local/bin/panoply

RUN chmod +x /usr/local/bin/panoply

RUN chown -R $NB_UID:$NB_GID $HOME

USER $NB_USER
