FROM alpine:latest
MAINTAINER RaphaelHuan

RUN apk add --virtual build-deps --update \
  autoconf \
  automake \
  cmake \
  ncurses ncurses-dev ncurses-libs ncurses-terminfo \
  gcc \
  g++ \
  libtool \
  libuv \
  linux-headers \
  lua5.3-dev \
  m4 \
  unzip \
  make 


RUN apk del build-deps &&\
  rm -rf /var/cache/apk/*

# # install all plugins
#RUN make install
