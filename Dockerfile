FROM amazonlinux:latest

# Install dependencies
RUN yum update -y && \
    yum install -y httpd && \
    yum search wget && \
    yum install wget -y && \
    yum install unzip -y \
    yum install git -y

RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf

# change directory
RUN cd /var/www/html

# download webfiles
RUN git clone https://github.com/Adutoby/DevOps-Lifecycle.git

RUN cp -r DevOps-Lifecycle/* /var/www/html/

RUN rm -rf DevOps-Lifecycle/*

# exposes port 8080 on the container
EXPOSE 3000

# set the default application that will start when the container start

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
