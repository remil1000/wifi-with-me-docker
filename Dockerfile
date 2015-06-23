FROM debian:jessie

MAINTAINER Rémi Laurent <remi.laurent@gmail.com>

ADD conf/apt.conf /etc/apt/apt.conf

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
	python-bottle

EXPOSE 8081

VOLUME /wifi-with-me

WORKDIR /wifi-with-me

ENTRYPOINT [ -f db.sqlite3 ] || ./backend.py createdb && \
	./backend.py buildgeojson && \
	BIND_ADDR='0.0.0.0' BIND_PORT=8081 ./backend.py
#	BIND_ADDR='0.0.0.0' BIND_PORT=8081 DEBUG=1 ./backend.py
