# Base Image: Ubuntu
FROM ubuntu:noble-20240407.1
ARG DEBIAN_FRONTEND=noninteractive
# Update packages and install dependencies
RUN apt-get update && \
    apt-get install -y  wget tar texlive-full
WORKDIR /tmp
RUN wget https://github.com/jgm/pandoc/releases/download/3.1.13/pandoc-3.1.13-linux-amd64.tar.gz
RUN tar -xvf pandoc-3.1.13-linux-amd64.tar.gz -C /usr --strip-components=1


# Create the working directory
WORKDIR /data

# Expose pandoc server port
EXPOSE 3030

# Start the pandoc server
CMD ["/usr/bin/pandoc-server"]
