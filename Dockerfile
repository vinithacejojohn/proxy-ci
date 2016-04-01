FROM ubuntu
EXPOSE 80

RUN apt-get update -y && apt-get install -y nginx supervisor

RUN rm /etc/nginx/sites-enabled/* && rm /etc/nginx/sites-available/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf 
ADD proxy.conf /etc/nginx/sites-enabled/proxy.conf

CMD ["/usr/bin/supervisord"]
