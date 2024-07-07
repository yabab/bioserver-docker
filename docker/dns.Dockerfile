FROM strm/dnsmasq

ARG SERVER_IP
ARG ROUTER_IP

COPY docker/vars/dns/dnsmasq.conf /etc/dnsmasq.conf

RUN sed -i "s/{{SERVER_IP}}/${SERVER_IP}/g" /etc/dnsmasq.conf 
RUN sed -i "s/{{ROUTER_IP}}/${ROUTER_IP}/g" /etc/dnsmasq.conf

ENTRYPOINT [ "dnsmasq", "-k" ]