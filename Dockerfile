FROM diuis/docker-debian9-wget_nodejs_python3:v1.0.0

ARG EMSDK_ARCHIVE=https://github.com/juj/emsdk/tarball/master

RUN apt-get update && apt-get install --no-install-recommends -y make cmake g++ gcc && \
    apt-get autoremove && apt-get clean

USER appuser
RUN wget -nv ${EMSDK_ARCHIVE} -O /home/appuser/emsdk.tar && \
    mkdir /home/appuser/emsdk && \
    tar xf /home/appuser/emsdk.tar -C /home/appuser/emsdk --strip-components 1 && \
    rm /home/appuser/emsdk.tar

