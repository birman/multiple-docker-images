FROM debian
MAINTAINER Birman Cardona - Victor Espitia "Especializacion Desarrollo de Software"

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80
ADD ["index.html","/var/www/html/"]
ADD ["sticky-footer.css","/var/www/html/"]
ADD ["bootstrap.min.css","/var/www/html/"]

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]