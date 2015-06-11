FROM ubuntu:14.04
ADD . /src

RUN apt-get update && apt-get install -y automake gcc libev-dev libssl-dev make --no-install-recommends && \
	rm -rf /var/lib/apt/lists/* && \
	cd /src && \
	./bootstrap && \
	./configure && \
	make && \
	make install && \
	mkdir -p /etc/hitch && \
	/usr/local/sbin/hitch-openssl --default-config >> /etc/hitch/default.config

CMD /usr/local/sbin/hitch-openssl --config=/etc/hitch/default.config
