FROM centos:latest
MAINTAINER PrateekJain
RUN yum -y install httpd
COPY index.html /var/www/html/
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
EXPOSE 80
ADD https://get.aquasec.com/microscanner .
RUN chmod +x microscanner
RUN ./microscanner YjMzNGZmNWNkNGRi