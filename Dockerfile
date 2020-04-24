FROM ubuntu:latest
MAINTAINER PrateekJain
RUN apt -y install httpd
COPY index.html /var/www/html/
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
EXPOSE 80