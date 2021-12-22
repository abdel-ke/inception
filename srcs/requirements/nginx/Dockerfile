FROM alpine:3.14.2

RUN apk update
RUN apk add nginx openrc vim openssl
RUN openrc && touch /run/openrc/softlevel
RUN mkdir /www/
COPY ./conf/nginx.conf /etc/nginx/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"
CMD [ "nginx",  "-g", "daemon off;" ]
