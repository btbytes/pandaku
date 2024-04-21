FROM ubuntu:noble-20240407.1
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y wget tar texlive-full
WORKDIR /tmp
RUN wget https://github.com/jgm/pandoc/releases/download/3.1.13/pandoc-3.1.13-linux-amd64.tar.gz
RUN tar -xvf pandoc-3.1.13-linux-amd64.tar.gz -C /usr --strip-components=1
WORKDIR /data
EXPOSE 3030
CMD ["/usr/bin/pandoc-server"]
