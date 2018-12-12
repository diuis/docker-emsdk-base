FROM diuis/docker-debian9-wget_nodejs_python3:v1.0.5

RUN apt-get update && apt-get install --no-install-recommends -y cmake build-essential && \
    apt-get autoremove && apt-get clean && \
    mkdir emsdk && chown appuser emsdk

USER appuser
RUN wget -nv https://github.com/juj/emsdk/tarball/master -O /home/appuser/emsdk.tar && \
    tar xf /home/appuser/emsdk.tar -C /emsdk && \
    rm /home/appuser/emsdk.tar

