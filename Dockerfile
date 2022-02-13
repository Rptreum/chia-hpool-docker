FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
  curl \
  unzip \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /hpool
RUN curl -L -o hpool-miner-chia.zip https://github.com/hpool-dev/chia-miner/releases/download/1.4.2/HPool-Miner-chia-v1.4.2-1-linux.zip
RUN unzip hpool-miner-chia.zip
WORKDIR /hpool/linux
CMD ["./hpool-miner-chia"]
