FROM ubuntu:20.04
USER root
RUN apt-get update && apt-get install -y wget
RUN wget https://raw.githubusercontent.com/Rptreum/chia-hpool-docker/main/linux.tar.gz
RUN tar -xvzf linux.tar.gz
CMD ["./hpool-miner-chia"]
