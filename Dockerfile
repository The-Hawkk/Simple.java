FROM centos:latest
MAINTAINER arpan.abes@gmail.com
RUN yum install -y httpd \
  zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page275/the7.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip the7.zip
RUN cp -rvf the7/* .
RUN rm -rf the7 the7.zip
CMD ["/usr/sbin/httpd", "-0", "FOREGROUND"]
EXPOSE 80
