## Dockerfile for a haskell environment
FROM       debian:jessie
# MAINTAINER Chris Biscardi <chris@christopherbiscardi.com>
# STOLEN_FROM https://raw.githubusercontent.com/freebroccolo/docker-haskell/master/7.8/Dockerfile (LICENSE = MIT)
MAINTAINER Matthew Forrester <github.com@speechmarks.com>

## ensure locale is set during build
ENV LANG            C.UTF-8

RUN echo 'deb http://ppa.launchpad.net/hvr/ghc/ubuntu trusty main' > /etc/apt/sources.list.d/ghc.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F6F88286 && \
    apt-get update && \
    apt-get install -y --no-install-recommends cabal-install-1.22 ghc-7.8.4 happy-1.19.4 alex-3.1.3 \
            zlib1g-dev libtinfo-dev libsqlite3-0 libsqlite3-dev ca-certificates g++ && \
    rm -rf /var/lib/apt/lists/*

ENV PATH /root/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.8.4/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin:$PATH

## run ghci by default unless a command is specified
RUN apt-get update && apt-get install -y graphviz
RUN cabal update && cabal install erd
CMD ["erd -f png"]

