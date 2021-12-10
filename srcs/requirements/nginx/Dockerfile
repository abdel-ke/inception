FROM alpine:3.14.2

RUN apk update
RUN apk add nginx openrc vim openssl
RUN openrc
RUN mkdir /www/
COPY ./tools/index.html /www/
RUN touch /run/openrc/softlevel
COPY ./conf/nginx.conf /etc/nginx/
COPY ./tools/nginx-selfsigned.key /etc/ssl/private/
COPY ./tools/nginx-selfsigned.crt /etc/ssl/certs/
COPY ./tools/run.sh /
# EXPOSE 80 443
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"
CMD /./run.sh
# https://10.11.100.193/