FROM ajoergensen/baseimage-alpine

MAINTAINER ajoergensen
ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/ajoergensen/docker-irkerd.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

RUN \
	apk add --update git python && \
	apk add --virtual build-dependencies make asciidoc python-dev xmlto && \	
	cd /tmp && \
	git clone https://gitlab.com/esr/irker.git && \
	cd irker && \
	make && make install && \
	apk del build-dependencies && \
	rm -rf /var/cache/apk/* /tmp/*

ADD root/ /

RUN \
	chmod -v +x /etc/services.d/*/run
