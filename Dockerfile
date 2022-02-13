# syntax=docker/dockerfile:1
FROM ubuntu:20.04 as build
RUN apt-get update && apt-get install -y \
  curl \
  unzip \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /tmp/hpool
RUN curl -L -o hpool-miner-chia.zip https://raw.githubusercontent.com/Rptreum/chia-hpool-docker/main/linux.tar.gz
RUN unzip hpool-miner-chia.zip
COPY /tmp/hpool/linux/hpool-miner-chia /hpool/hpool-miner-chia
RUN useradd -m hpool && mkdir -p /hpool/log && chown -R hpool. /hpool
USER hpool
WORKDIR /hpool
CMD ["./hpool-miner-chia"]
