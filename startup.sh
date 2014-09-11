#!/bin/bash
sed -i "s|<proxy_pass_ip>|$ELASTICSEARCH_PORT_9200_TCP_ADDR|" /etc/nginx/nginx.conf
sed -i "s|<proxy_pass_port>|$ELASTICSEARCH_PORT_9200_TCP_PORT|" /etc/nginx/nginx.conf

nginx
