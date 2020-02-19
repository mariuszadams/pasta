# Use the httpd-parent image as base
FROM registry.access.redhat.com/rhscl/httpd-24-rhel7
#RUN   yum --disableplugin=subscription-manager -y install iputils \
# && yum --disableplugin=subscription-manager -y module enable php:7.2 \
#  && yum --disableplugin=subscription-manager -y install httpd php \
#  && yum --disableplugin=subscription-manager clean all

ADD index.html /var/www/html

RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf 
#  && mkdir /run/php-fpm \
#RUN chgrp -R 0 /var/log/httpd /var/run/httpd && chmod -R g=u /var/log/httpd /var/run/httpd 
#/run/php-fpm
  
EXPOSE 8080

USER 1001

#CMD httpd -D FOREGROUND


