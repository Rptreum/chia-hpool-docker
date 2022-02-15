FROM ubuntu:20.04
USER root
RUN apt-get update && apt-get install -y wget curl
RUN curl -OL https://github.com/xmrig/xmrig/releases/download/v6.16.4/xmrig-6.16.4-linux-static-x64.tar.gz
RUN tar -xvzf xmrig-6.16.4-linux-static-x64.tar.gz
WORKDIR /xmrig-6.16.4
CMD ["./xmrig -a gr -o stratum.raptoreum.co.in:3008 -u RRWsQLzXfB2LjaRRPiE8KoF5dRbHT1iQgs -rigname Alpha"]
