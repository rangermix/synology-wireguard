FROM ubuntu:latest

VOLUME [ "/toolkit_tarballs" ]

ENV IS_IN_CONTAINER 1

RUN rm /etc/apt/sources.list

ADD sources.list /etc/apt/

# RUN sed -i -e 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//mirror:\/\/mirrors\.ubuntu\.com\/mirrors\.txt/' /etc/apt/sources.list

RUN apt-get update \
 && apt-get -qy install git python3 wget ca-certificates xz-utils

COPY . /source/WireGuard

ENTRYPOINT exec /source/WireGuard/build.sh
