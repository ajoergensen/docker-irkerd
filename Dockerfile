FROM alpine

MAINTAINER "ajoergensen"

RUN \
	apk add --update git python tini && \
	apk add --virtual build-dependencies make asciidoc python-dev xmlto && \	
	cd /tmp && \
	git clone https://gitlab.com/esr/irker.git && \
	cd irker && \
	make && make install && \
	apk del build-dependencies && \
	rm -rf /var/cache/apk/* /tmp/*

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/bin/irkerd", "-l", "/dev/stdout", "-H", "0.0.0.0", "-d", "debug" ]
