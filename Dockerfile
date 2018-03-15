FROM ubuntu:16.04
LABEL maintainer=milobahg
RUN apt-get update -y; apt-get install pkg-config \
  libssl-dev wget g++ perl openssl vim \
  irssi libwww-perl gnutls-bin gnutls-dev -y
RUN useradd -m ircuser
WORKDIR /home/ircuser
USER ircuser
RUN wget https://github.com/inspircd/inspircd/archive/v2.0.24.tar.gz; \
  tar xvf v2.0.24.tar.gz
WORKDIR /home/ircuser/inspircd-2.0.24
RUN ./configure --disable-interactive --enable-gnutls; make; make install
ADD inspircd.conf /home/ircuser/inspircd-2.0.24/run/conf/inspircd.conf
ADD inspircd.motd /home/ircuser/inspircd-2.0.24/run/conf/inspircd.motd
ADD certs/ /home/ircuser/inspircd-2.0.24/run/conf/certs/
EXPOSE 6667 7001
CMD /home/ircuser/inspircd-2.0.24/run/inspircd start --nofork
