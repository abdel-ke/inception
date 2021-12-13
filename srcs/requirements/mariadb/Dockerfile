FROM alpine:3.14.2

RUN apk update && apk add openrc mariadb mariadb-client
RUN openrc && touch /run/openrc/softlevel

COPY ./tools/script.sh .
RUN chmod +x script.sh

CMD ./script.sh
