FROM consul:1.9.0

RUN apk add --no-cache ca-certificates dumb-init 

RUN mkdir -p /tmp/build && \
    cd /tmp/build && \
    wget https://releases.hashicorp.com/consul/1.9.0/consul_1.9.0_linux_amd64.zip && \
    unzip -d  /tmp/build consul_1.9.0_linux_amd64.zip && \
    cp /tmp/build/consul /bin/consul && \
    chmod +x /bin/consul
 
VOLUME /consul/data

EXPOSE 8500

#COPY .release/docker/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
#ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/bin/consul","agent","-dev","-client","0.0.0.0"]    



