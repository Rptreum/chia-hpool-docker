FROM ubuntu:20.04 as build
RUN apt-get update && apt-get install -y \
  curl \
  unzip \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /tmp/hpool
RUN curl -L -o hpool-miner-chia.zip https://github.com/hpool-dev/chia-miner/releases/download/1.4.2/HPool-Miner-chia-v1.4.2-1-linux.zip
RUN unzip hpool-miner-chia.zip

FROM ubuntu:20.04
COPY --from=build /tmp/hpool/linux/hpool-miner-chia /hpool/hpool-miner-chia
RUN useradd -m hpool && mkdir -p /hpool/log && chown -R hpool. /hpool
USER hpool
WORKDIR /hpool
CMD ["./hpool-miner-chia"]
