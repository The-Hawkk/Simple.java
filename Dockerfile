FROM centos:latest
MAINTAINER arpan.abes@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install -y httpd
RUN yum install unzip -y
RUN yum install zip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page276/adward.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip adward.zip
RUN cp -rvf adward/* .
RUN rm -rf adward adward.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
