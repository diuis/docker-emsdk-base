FROM diuis/docker-ubuntu-wget_nodejs_python:19.04

ARG EMSDK_ARCHIVE=https://github.com/emscripten-core/emsdk/archive/master.tar.gz

USER root
RUN apt-get update && apt-get install --no-install-recommends -y make cmake g++ gcc llvm git xz-utils && \
    apt-get autoremove && apt-get clean

RUN update-alternatives --set python /usr/bin/python2.7

USER appuser
RUN wget -nv ${EMSDK_ARCHIVE} -O /home/appuser/emsdk.tar && \
    mkdir /home/appuser/emsdk && \
    tar xzf /home/appuser/emsdk.tar -C /home/appuser/emsdk --strip-components 1 && \
    rm /home/appuser/emsdk.tar
