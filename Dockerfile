from ubuntu:latest

RUN apt-get -y update
RUN apt-get -y install nginx

RUN echo 'Hello Alex from Ivan' > /var/www/html/index.html

RUN rm /var/www/html/index.nginx-debian.html

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80