# Minimal Docker image for rammap using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install rammap
RUN apk update && \
    apk add bash gcc make musl-dev zlib-dev && \
    wget -qO- "https://sh.rustup.rs" | sh -s -- -y && \
    . "$HOME/.cargo/env" && \
    rustup update stable && \
    rustup default stable && \
    wget -qO- "https://github.com/jwanglab/rammap/archive/refs/tags/v1.0.0.tar.gz" | tar -zx && \
    cd rammap-* && \
    cargo build --release && \
    mv target/release/rammap /usr/local/bin/rammap && \
    cd .. && \
    rm -rf rammap-*
