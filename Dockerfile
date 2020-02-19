FROM registry.access.redhat.com/ubi8/ubi

RUN   yum --disableplugin=subscription-manager -y install iputils skopeo \
# && yum --disableplugin=subscription-manager -y module enable php:7.2 \
#  && yum --disableplugin=subscription-manager -y install httpd php \
  && yum --disableplugin=subscription-manager clean all

#ADD index.php /var/www/html

#RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf \
#  && mkdir /run/php-fpm \
#  && chgrp -R 0 /var/log/httpd /var/run/httpd /run/php-fpm \
#  && chmod -R g=u /var/log/httpd /var/run/httpd /run/php-fpm
  
EXPOSE 8080

USER 1001

CMD php-fpm & httpd -D FOREGROUND

