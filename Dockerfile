#
# nginx_es Dockerfile
#

# Pull base image.
FROM dockerfile/ubuntu

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx

# Mount nginx config
ADD nginx.conf /etc/nginx/

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/es"]

# Define working directory.
WORKDIR /etc/nginx

# Expose ports.
#   - 80: HTTP
#   - 443: HTTPS
EXPOSE 80
EXPOSE 443

# Mount startup script
ADD startup.sh /opt/

# Make the startup script executable
RUN chmod +x /opt/startup.sh

# Define default command - script to modify nginx config and start nginx
ENTRYPOINT ["/opt/startup.sh"]
