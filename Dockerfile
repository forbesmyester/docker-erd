## Dockerfile for a haskell environment
FROM       ubuntu:18.04
# MAINTAINER Chris Biscardi <chris@christopherbiscardi.com>
# STOLEN_FROM https://raw.githubusercontent.com/freebroccolo/docker-haskell/master/7.8/Dockerfile (LICENSE = MIT)
MAINTAINER Matthew Forrester <github.com@speechmarks.com>

## ensure locale is set during build
ENV LANG            C.UTF-8

## run ghci by default unless a command is specified
RUN apt-get update && apt-get install -y graphviz cabal-install ghc zlib1g-dev libtinfo-dev libsqlite3-0 libsqlite3-dev ca-certificates g++ happy alex
RUN cabal update && cabal install erd
CMD ["erd -f png"]

