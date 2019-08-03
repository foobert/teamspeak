FROM debian:jessie
RUN apt-get update && apt-get install -y curl bzip2 && rm -rf /var/apt/lists
RUN cd /opt && \
    curl -o /opt/ts.tar.bz2 https://files.teamspeak-services.com/releases/server/3.9.1/teamspeak3-server_linux_amd64-3.9.1.tar.bz2 && \
    tar xjf ts.tar.bz2 && \
    rm ts.tar.bz2 && \
    mv /opt/teamspeak3-server_linux_amd64 /opt/ts3 && \
    mkdir /opt/ts3/data && \
    ln -s /opt/ts3/data/ts3server.sqlitedb /opt/ts3/ts3server.sqlitedb
EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033
ENV TS3SERVER_LICENSE=accept
WORKDIR /opt/ts3
VOLUME /opt/ts3/data/
CMD ["/opt/ts3/ts3server_minimal_runscript.sh"]
