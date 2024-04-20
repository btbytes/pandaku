# Base Image: Ubuntu
FROM ubuntu:noble-20240407.1
ARG DEBIAN_FRONTEND=noninteractive
# Update packages and install dependencies
RUN apt-get update && \
    apt-get install -y texlive-full pandoc

# Create the working directory
WORKDIR /data

# Expose pandoc server port
EXPOSE 3030

# Start the pandoc server
CMD ["/usr/bin/pandoc", "server"]
