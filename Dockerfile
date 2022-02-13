FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
  curl \
  unzip \
  && rm -rf /var/lib/apt/lists/*
RUN wget https://raw.githubusercontent.com/Rptreum/chia-hpool-docker/main/linux.tar.gz
RUN unzip linux.tar.gz
CMD ["./hpool-miner-chia"]
