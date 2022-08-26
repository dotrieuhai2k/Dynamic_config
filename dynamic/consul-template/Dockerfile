FROM alpine:3.15

# Get dumb-init 
#RUN wget -O ./dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
#RUN chmod +x ./dumb-init
RUN apk add dumb-init
#Install Curl
#RUN apk add --no-cache curl
#RUN apk add --no-cache tar
#Install consul-template
RUN mkdir -p /tmp/build && \
    cd /tmp/build &&\
    wget https://releases.hashicorp.com/consul-template/0.25.0/consul-template_0.25.0_linux_amd64.zip && \
    unzip -d /tmp/build consul-template_0.25.0_linux_amd64.zip && \
    cp /tmp/build/consul-template /bin/consul-template && \
    chmod +x /bin/consul-template

# Copy consul-template from consul-template image
# COPY ./consul-template /bin/consul-template 

# Copy consul-template configuration
COPY ./config.hcl /consul-template/config.hcl

# Copy Prometheus configuration file template
COPY ./prometheus.tpl /etc/prometheus/prometheus.tpl
COPY ./alertmanager.tpl /etc/alertmanager/alertmanager.tpl
COPY ./alert.tpl /etc/prometheus/alert.tpl

#ENTRYPOINT ["./dumb-init", "--"]


CMD ["/bin/consul-template", "--config=/consul-template/config.hcl"]


