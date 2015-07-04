FROM ubuntu:14.10
MAINTAINER SiddonTang <tl@pingcap.com>

# Use Chinese sources.list to speed up if you are in China
COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y gcc libc6-dev zlib1g-dev make libmysqlclient-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

ADD . /tpcc-mysql
ENV PATH /tpcc-mysql:$PATH
RUN cd /tpcc-mysql/src && make
