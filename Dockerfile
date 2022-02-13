FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
  curl \
  unzip \
  && rm -rf /var/lib/apt/lists/*
RUN curl -L -o hpool-miner-chia.zip https://github.com/Rptreum/chia-hpool-docker/blob/main/linux.tar.gz
RUN unzip hpool-miner-chia.zip
CMD ["./hpool-miner-chia"]
