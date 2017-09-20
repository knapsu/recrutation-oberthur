FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive

# Install essential tools
RUN set -e \
  && apt-get update \
  && apt-get install -y \
    curl \
    wget \
    unzip \
    software-properties-common \
    htop \
  && rm -rf /var/cache/apt/archives/*

# Install Nginx
RUN set -e \
  && add-apt-repository ppa:nginx/stable \
  && apt-get update \
  && apt-get install -y nginx \
  && rm -rf /var/cache/apt/archives/*

# Configure Nginx
COPY config/default /etc/nginx/sites-available/default
COPY ssl/localhost.crt /etc/ssl/localhost.crt
COPY ssl/localhost.key /etc/ssl/localhost.key

# Copy startup script 
COPY bin/nginx-start /usr/local/bin/
RUN chmod +x /usr/local/bin/nginx-start

EXPOSE 80
EXPOSE 443

CMD ["nginx-start"]
