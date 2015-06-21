FROM debian:stable
RUN apt-get update
RUN apt-get install -y lighttpd make automake autoconf gcc libtool curl libevent-dev libssl-dev libssl1.0 openssl

#ENV VERSION 0.2.6.9
#RUN curl https://dist.torproject.org/tor-${VERSION}.tar.gz | tar xz -C /tmp
#RUN cd /tmp/tor-${VERSION} && ./configure
#RUN cd /tmp/tor-${VERSION} && make
#RUN cd /tmp/tor-${VERSION} && make install
#RUN cd /tmp/tor-${VERSION} && make clean
#RUN cd /tmp/tor-${VERSION} && make dist-gzip

RUN echo "deb http://deb.torproject.org/torproject.org wheezy main" >> /etc/apt/sources.list
RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
RUN apt-get update && apt-get install -y tor sudo
RUN apt-get -y upgrade

# Ports
EXPOSE 9001
EXPOSE 9050
EXPOSE 8080

# Tor
ADD ./torrc /etc/tor/torrc
ADD ./startup.sh /startup.sh
RUN chmod 777 /startup.sh

ENTRYPOINT /startup.sh
