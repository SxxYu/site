FROM ubuntu:14.04
MAINTAINER luodaoyi <luodaoyi@gmail.com>

# Surpress Upstart errors/warning
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Add sources for latest nginx
RUN apt-get install -y wget
RUN wget -q http://nginx.org/keys/nginx_signing.key -O- | sudo apt-key add -
RUN echo deb http://nginx.org/packages/ubuntu/ trusty nginx >> /etc/apt/sources.list
RUN echo deb-src http://nginx.org/packages/ubuntu/ trusty nginx >> /etc/apt/sources.list

# Update System
RUN apt-get update
RUN apt-get -y upgrade

# Basic Requirements
RUN apt-get -y install nginx pwgen python-setuptools curl git unzip vim

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN sudo apt-get install -y nodejs


# Expose Ports
EXPOSE 443
EXPOSE 80