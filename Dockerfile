#
# nginx_es Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM dockerfile/nginx

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Mount nginx config
ADD nginx.conf /etc/nginx/

# Define mountable directories.
VOLUME ["/var/www/es"]

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
