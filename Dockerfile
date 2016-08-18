FROM debian:jessie
RUN apt-get update && apt-get install -y curl && rm -rf /var/apt/lists
RUN cd /opt && \
    curl -o /opt/ts.tar.gz http://dl.4players.de/ts/releases/3.0.11.3/teamspeak3-server_linux-amd64-3.0.11.3.tar.gz && \
    tar xzf ts.tar.gz && \
    rm ts.tar.gz && \
    mv /opt/teamspeak3-server_linux-amd64 /opt/ts3 && \
    mkdir /opt/ts3/data && \
    ln -s /opt/ts3/data/ts3server.sqlitedb /opt/ts3/ts3server.sqlitedb
EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033
WORKDIR /opt/ts3
VOLUME /opt/ts3/data/
CMD ["/opt/ts3/ts3server_minimal_runscript.sh"]
