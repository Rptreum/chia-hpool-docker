# syntax=docker/dockerfile:1
FROM ubuntu:20.04 as build
RUN apt-get update && apt-get install -y \
  curl \
  unzip \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /tmp/hpool
RUN curl -L -o hpool-miner.zip https://github.com/Rptreum/chia-hpool-docker/blob/main/linux.tar.gz
RUN unzip hpool-miner.zip

FROM ubuntu:20.04
COPY --from=build /tmp/hpool/linux/hpool-miner-chia /hpool/hpool-miner-chia
RUN useradd -m hpool && mkdir -p /hpool/log && chown -R hpool. /hpool
USER hpool
WORKDIR /hpool
CMD ["./hpool-miner-chia"]
