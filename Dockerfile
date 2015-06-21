FROM debian:stable
RUN apt-get update
RUN apt-get install -y lighttpd make automake autoconf gcc libtool curl libevent-dev libssl-dev libssl1.0 openssl

ENV VERSION 0.2.6.9

RUN curl https://dist.torproject.org/tor-${VERSION}.tar.gz | tar xz -C /tmp

RUN cd /tmp/tor-${VERSION} && ./configure
RUN cd /tmp/tor-${VERSION} && make
RUN cd /tmp/tor-${VERSION} && make install
RUN cd /tmp/tor-${VERSION} && make clean
RUN cd /tmp/tor-${VERSION} && make dist-gzip

CMD /bin/ls
